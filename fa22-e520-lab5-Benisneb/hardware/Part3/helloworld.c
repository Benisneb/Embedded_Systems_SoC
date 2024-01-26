#include <stdio.h>
#include "xparameters.h"
#include "xil_printf.h"
#include "xbasic_types.h"
#include "platform.h"

Xuint32 *baseaddr_p = (Xuint32 *)XPAR_MY_MULT_IP_0_S00_AXI_BASEADDR;

int main() {
	init_platform();
	xil_printf("Multiplier Test \n\r");
	// Write Multiplier inputs to reg0
	*(baseaddr_p + 0) = 0x00020003;		// Offset of 0 == addressing reg0
	xil_printf( "Wrote : 0x%08x \n\r", *(baseaddr_p + 0) );
	// Read Multiplier output from reg1
	xil_printf( "Read : 0x%08x \n\r", *(baseaddr_p + 1) );
	xil_printf("Multiplier Test Finished\n\r");
	cleanup_platform();
	return 0;
}
