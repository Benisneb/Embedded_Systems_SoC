/******************************************************************************
*
* Copyright (C) 2009 - 2014 Xilinx, Inc.  All rights reserved.
*
* Permission is hereby granted, free of charge, to any person obtaining a copy
* of this software and associated documentation files (the "Software"), to deal
* in the Software without restriction, including without limitation the rights
* to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
* copies of the Software, and to permit persons to whom the Software is
* furnished to do so, subject to the following conditions:
*
* The above copyright notice and this permission notice shall be included in
* all copies or substantial portions of the Software.
*
* Use of the Software is limited solely to applications:
* (a) running on a Xilinx device, or
* (b) that interact with a Xilinx device through a bus or interconnect.
*
* THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
* IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
* FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL
* XILINX  BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
* WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF
* OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
* SOFTWARE.
*
* Except as contained in this notice, the name of the Xilinx shall not be used
* in advertising or otherwise to promote the sale, use or other dealings in
* this Software without prior written authorization from Xilinx.
*
******************************************************************************/

/*
 * helloworld.c: simple test application
 *
 * This application configures UART 16550 to baud rate 9600.
 * PS7 UART (Zynq) is not initialized by this application, since
 * bootrom/bsp configures it to baud rate 115200
 *
 * ------------------------------------------------
 * | UART TYPE   BAUD RATE                        |
 * ------------------------------------------------
 *   uartns550   9600
 *   uartlite    Configurable only in HW design
 *   ps7_uart    115200 (configured by bootrom/bsp)
 */

#include <stdio.h>
#include "platform.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "xv_mix.h"
#include "xv_mix_l2.h"
#include "xgpio.h"
#include "sleep.h"
#include "xuartps.h"
#include "xil_cache.h"
#include "xv_tpg.h"
#include "xscugic.h"
#include "xvtc.h"

#define UART_BASEADDR XPAR_PS7_UART_1_BASEADDR
#define VTC_GEN_ID XPAR_V_TC_GENERATION_DEVICE_ID
#define VTC_DET_ID XPAR_V_TC_DETECTION_DEVICE_ID
#define VIDE_MIXER_ID XPAR_V_MIX_0_DEVICE_ID
#define TGP_ID XPAR_V_TPG_0_DEVICE_ID
#define VIDEO_DETECT_ID XPAR_V_TC_GENERATION_DEVICE_ID

extern u32 red_gui[];
extern u32 readFrame;
int NumLayers = 2;
#define XVMIX_LAYER_BASEADDR (XPAR_PS7_DDR_0_S_AXI_BASEADDR + (0x21000000))
#define XVMIX_LAYER_ADDR_OFFSET (0x010000000)
#define XVMIX_CHROMA_ADDR_OFFSET (0x010000000)
#define LED 0x01

static int SetupInterrupts(void);
static void DriverInit(void);
static void detectHdmi(void);
static void resetIp(void);
static void configVtcDet(void);
static void configVtcGen(void);
static void ConfigMixer(XVidC_VideoStream *StreamPtr);
static void ConfigTpg(XVidC_VideoStream *StreamPtr);
static void RunMixer(void);

int Status;
XScuGic intc;
XV_mix mix;
XV_Mix_l2 mixl2;
XV_Mix_l2 *MixerPtr = &mixl2;
XGpio rstGpio;
XGpio hpdGpio;
XVidC_VideoStream VidStream;
XVidC_ColorFormat Cfmt;
//XVidC_VideoTiming const *TimingPtr;
XV_tpg tpg;
XVtc vtcDet, vtcGen;
XVtc_Config *vtcConfigDet, *vtcConfigGen;
XVtc_Timing TimingPtr;
XVtc_Timing vtc_timing;
XGpio gpio;

u32* gpio_hlsIpReset;

int main(void) {

//	static const XVidC_VideoWindow MixLayerConfig[2] =
//		{		// X   Y   W   H
//				{ 10, 10, 256, 256 },	// Layer1
//				{ 300, 10, 256, 256 }	// Layer2
//		};

    gpio_hlsIpReset = (u32*) XPAR_RESET_GPIO_BASEADDR;
    *gpio_hlsIpReset = 1;

    init_platform();
    xil_printf("Start Mixer Design\r\n");
    Status = SetupInterrupts();
    DriverInit();
    detectHdmi();
    Xil_ExceptionEnable();
    resetIp();
    configVtcDet();
    configVtcGen();
    ConfigMixer(&VidStream);
    ConfigTpg(&VidStream);
    RunMixer();
    cleanup_platform();
    return 0;
}

static int SetupInterrupts(void){
	int Status;
	XScuGic intc;

	XV_Mix_l2 mixl2;
	XV_Mix_l2 *MixerPtr = &mixl2;

	XScuGic *IntcPtr = &intc;
	XScuGic_Config *IntcCfgPtr;

	IntcCfgPtr = XScuGic_LookupConfig (XPAR_SCUGIC_0_DEVICE_ID);
	if (IntcCfgPtr == NULL) {
		print ("ERR:: Interrupt Controller not found");
		return (XST_DEVICE_NOT_FOUND);
	}

	Status = XScuGic_CfgInitialize (IntcPtr, IntcCfgPtr,
	IntcCfgPtr->CpuBaseAddress);
	if (Status != XST_SUCCESS) {
		xil_printf ("Intc initialization failed!\r\n");
		return XST_FAILURE;
	}

    Status |= XScuGic_Connect (IntcPtr,
		XPAR_FABRIC_V_MIX_0_INTERRUPT_INTR,
			(XInterruptHandler) XVMix_InterruptHandler, (void *) MixerPtr);
		Xil_ExceptionRegisterHandler(XIL_EXCEPTION_ID_INT,
			(Xil_ExceptionHandler) XScuGic_InterruptHandler, IntcPtr);

    if (Status != XST_SUCCESS) {
		xil_printf ("ERR:: Mixer interrupt connect failed!\r\n");
		return XST_FAILURE;
    }

    XScuGic_Enable (IntcPtr, XPAR_FABRIC_V_MIX_0_INTERRUPT_INTR);
    return 0;
}

static void DriverInit(void){
	Status = XV_mix_Initialize (&mix, VIDE_MIXER_ID);
	if (Status != XST_SUCCESS) {
		xil_printf ("video mixer initialization failed n\r");
	}

	Status = XVMix_Initialize (&mixl2, VIDE_MIXER_ID);
	if (Status != XST_SUCCESS) {
		xil_printf ("ERROR:: Mixer device not found\r\n");
		return (XST_FAILURE);
	}

	Status = XV_tpg_Initialize(&tpg, TGP_ID);
	if (Status != XST_SUCCESS) {
		xil_printf ("ERROR:: TPG device not found\r\n");
		return (XST_FAILURE);
	}

	vtcConfigDet = XVtc_LookupConfig (VTC_DET_ID);

	Status = XVtc_CfgInitialize (&vtcDet, vtcConfigDet,
			vtcConfigDet->BaseAddress);

	if (Status != (XST_SUCCESS) )
		return;

	vtcConfigGen = XVtc_LookupConfig (VTC_GEN_ID);

	Status = XVtc_CfgInitialize(&vtcGen, vtcConfigGen,
			vtcConfigGen->BaseAddress);

	if (Status != (XST_SUCCESS))
		return;

	Status = XGpio_Initialize (&hpdGpio, VIDEO_DETECT_ID);
	if (Status != XST_SUCCESS) {
		Xil_printf ("hdmi hpd initialization failed\n\r");
	}
}

static void detectHdmi(void){
    XGpio_SetDataDirection (&hpdGpio, 1, ~LED) ;
    XGpio_DiscreteWrite (&hpdGpio, 1, LED);
}

static void resetIp(void){
    *gpio_hlsIpReset = 0;
    usleep (1000);		//hold reset line

    *gpio_hlsIpReset = 1;
    usleep (1000);		//wait
}

static void configVtcDet(void){
	XVtc_ReqUpdateEnable (&vtcDet) ;
	XVtc_IntrDisable (&vtcDet, 0x100);
	XVtc_EnableDetector (&vtcDet) ;
	usleep (3000000);

	if (XVtc_GetDetectionStatus (&vtcDet) ) {
		u16 vidMode = XVtc_GetDetectorVideoMode (&vtcDet) ;
		XVtc_ConvVideoMode2Timing (&vtcDet, vidMode, &TimingPtr);
	}
}

static void configVtcGen(void){
    vtc_timing.HActiveVideo = TimingPtr. HActiveVideo;
    vtc_timing.HFrontPorch = TimingPtr.HFrontPorch;
    vtc_timing.HSyncWidth = TimingPtr.HSyncWidth;
    vtc_timing.HBackPorch = TimingPtr.HBackPorch;
    vtc_timing.HSyncPolarity = TimingPtr.HSyncPolarity;
    vtc_timing.VActiveVideo = TimingPtr.VActiveVideo;
    vtc_timing.V0FrontPorch = TimingPtr.V0FrontPorch;
    vtc_timing.V0SyncWidth = TimingPtr.V0SyncWidth;
    vtc_timing.V0BackPorch = TimingPtr.V0BackPorch;
    vtc_timing.VSyncPolarity = TimingPtr.VSyncPolarity;

    XVtc_SetGeneratorTiming (&vtcGen, &vtc_timing);
    XVtc_Enable (&vtcGen);
    XVtc_EnableGenerator (&vtcGen);
    XVtc_RegUpdateEnable (&vtcGen);
}


static void ConfigMixer(XVidC_VideoStream *StreamPtr){
	/* Setup default config after reset */
	XVMix_LayerDisable(MixerPtr, XVMIX_LAYER_MASTER);

	/* set master layer resolution */
	XV_mix_Set_HwReg_width (&mix, TimingPtr.HActiveVideo);
	XV_mix_Set_HwReg_height (&mix, TimingPtr.VActiveVideo);
	XV_mix_Start (&mix);

	for (index = XVMIX_LAYER_1; index < NumLayers; index++) {
		XVMix_GetLayerColorFormat (MixerPtr, index, &Cfmt);
		if ( !(XVMix_IsLayerInterfaceStream (MixerPtr, index))) {
			Status = XVMix_SetLayerBufferAddr (MixerPtr, index, MemAddr);
			if (Status != XST_SUCCESS) {
				xil_printf(
					"MIXER ERROR:: Unable to set layer %d buffer addr to Ox%X\r\n",
					index, MemAddr);
			} else {
				if ((Cfmt == XVIDC_CSF_MEM_Y_UV8)
					||	(Cfmt == XVIDC_CSF_MEM_Y_UV8_420)
					||	(Cfmt == XVIDC_CSF_MEM_Y_UV10)
					||	(Cfmt == XVIDC_CSF_MEM_Y_UV10_420)) {
					MemAddr += XVMIX_CHROMA_ADDR_OFFSET;
					Status = XVMix_SetLayerChromaBufferAddr(MixerPtr, index, MemAddr);
					if (Status != XST_SUCCESS) {
						xil_printf(
								"MIXER ERROR:: Unable to set layer %d chroma buffer2 addr to Ox%X\r\n",
								index, MemAddr);
					}
				}

			MemAddr += XVMIX_LAYER_ADDR_OFFSET;
			}
		}
	}

	memcpy((UINTPTR *) MixerPtr->Layer[1].BufAddr, &red_gui,
			32768 * sizeof (u32));

	XVMix_SetBackgndColor (MixerPtr, XVMIX_BKGND_BLUE, XVIDC_BPC_8);
	XVMix_LayerEnable (MixerPtr, XVMIX_LAYER_MASTER);
	XVMix_InterruptEnable (MixerPtr);
	XVMix_SetCallback (MixerPtr, (void *) readFrame, MixerPtr);
	XVMix_Start (MixerPtr);
}

static void ConfigTpg(XVidC_VideoStream *StreamPtr){
	//Stop TPG
	XV_tpg_DisableAutoRestart (&tpg) ;
	XV_tpg_Set_height (&tpg, 256);
	XV_tpg_Set_width (&tpg, 256);
	XV_tpg_Set_colorFormat (&tpg, StreamPtr->ColorFormatId);
	XV_tpg_Set_bckgndId (&tpg, XTPG_BKGND_COLOR_BARS);
	XV_tpg_Set_ovrlayId(&tpg, 0);

	//start TPG
	XV_tpg_EnableAutoRestart (&tpg) ;
	XV_tpg_Start (&tpg) ;
	Xil_printf("INFO: Stream tpg configured \r\n");
}

static void RunMixer(void){
	int userInput;
	scanf("%d", &userInput);
	switch (userInput) {
		case '1':
			optionIsSelected = FALSE;
			overlayEnableDisable();
			break;

		case '2':
			optionIsSelected = FALSE;
			setAlphaBlending();
			break;

		case '3':	//scale
			optionIsSelected = FALSE;
			setScaleFactor();
			break;

		case '4':
			optionIsSelected = FALSE;
			moveLayerWindow();
			break;

		case '5':
			optionIsSelected = TRUE;
			break;

		case '6':
			optionIsSelected = FALSE;
			debugMenu();
			break;

		case '7':
			main();
			break;

		default:
			optionIsSelected = FALSE;
			printMainMenu();
			break;
	}
	XVMix_InterruptHandler (MixerPtr);
}
