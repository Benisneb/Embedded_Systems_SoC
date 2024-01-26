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
#include <unistd.h>
#include "xparameters.h"	// Auto generated using Board Support Package / Necessary parameters
#include "xgpio.h"

int main()
{
    XGpio dip, push;			// Objects of type XGpio
    int psb_check, dip_check;

    xil_printf("-- Start of the program --\r\n");
    // You can find the GPIO 0 DEVICE ID && GPIO 1 DEVICE ID in the xparameters.h header
    											   // XPAR_SWITCHES_DEVICE_ID
    XGpio_Initialize(&dip, XPAR_GPIO_1_DEVICE_ID); // Use XGpio_Initialize to initialize the DIP GPIO device
    XGpio_SetDataDirection(&dip, 1, 0xffffffff);   // Use XGpio_SetDataDirection to set the input/output direction
    											   //  XPAR_BUTTONS_DEVICE_ID
    XGpio_Initialize(&push, XPAR_GPIO_0_DEVICE_ID);// Use XGpio_Initialize to initialize the SW GPIO device
    XGpio_SetDataDirection(&push, 1, 0xffffffff);  // Use XGpio_SetDataDirection to set the input/output direction

    // Set the Direction to 1 as an input from switches / buttons

    while (1)	// Poll status for GPIOs
    {
        // Use a for loop to create a wait time before the next status read pull
        // The Zynq clock runs at 100 MHz.

    	psb_check = XGpio_DiscreteRead(&push, 1);		// Use XGpio_DiscreteRead to read the status of btns
    	xil_printf("Push Buttons Status %x\r\n", psb_check);// Use xil_printf to write the status on the screen

    	dip_check = XGpio_DiscreteRead(&dip, 1);		// Use XGpio_DiscreteRead to read the status of sw
    	xil_printf("DIP Switch Status %x\r\n", dip_check);// Use xil_printf to write the status on the screen

    	// DiscreteRead reads the status of the buttons / switches

    	sleep(0.0001);
    }
}
