#include "PmodTMP3.h"
#include "xil_cache.h"
#include "xil_printf.h"
#include "xparameters.h"
#include "sleep.h"
#include "stdio.h"

PmodTMP3 myDevice;

int main(){

	printf("Program started\r\n");
	TMP3_begin(&myDevice, XPAR_PMODTMP3_0_AXI_LITE_IIC_BASEADDR, TMP3_ADDR);
				// Address	  Device ID for PMOD
	while(1){
		printf("Test\n");
		double temp = TMP3_getTemp(&myDevice);
		xil_printf("Raw Temp: %f\r\n", temp);
		double temp2 = TMP3_CtoF(temp);
		double temp3 = TMP3_FtoC(temp2);

		int temp2_round = 0;
		int temp2_int 	= 0;
		int temp2_frac 	= 0;

		//Round to nearest hundredth, multiply by 100
		if (temp2 < 0){
			temp2_round = (int) (temp2 * 1000 - 5) / 10;
			temp2_frac	= -temp2_round % 100;
		} else {
			temp2_round = (int) (temp * 1000 + 5) / 10;
			temp2_frac 	= temp2_round % 100;
		}
		temp2_int = temp2_round / 100;
		int temp3_round = 0;
		     int temp3_int   = 0;
		     int temp3_frac  = 0;
		     if (temp3 < 0) {
		        temp3_round = (int) (temp3 * 1000 - 5) / 10;
		        temp3_frac  = -temp3_round % 100;
		     } else {
		        temp3_round = (int) (temp3 * 1000 + 5) / 10;
		        temp3_frac  = temp3_round % 100;
		     }
		     temp3_int = temp3_round / 100;

		     xil_printf("Temperature: %d.%d in Fahrenheit\n\r", temp2_int, temp2_frac);
		     xil_printf("Temperature: %d.%d in Celsius\n\r", temp3_int, temp3_frac);
		     print("\n\r");
		     sleep(1);
		 }
	TMP3_end(&myDevice);
	xil_printf("PmodTMP3 Disconnected\n\r");
	xil_printf("Closing UART Connection\n\r");
	return 0;
}
