#include "gpio_ctrl.h"	// Quotes are for local files, <> are for standard library
#include <stdio.h>

// * is a pointer to struct, to access information inside must use " -> "
// This fx takes base_addr user provides and assigns it to pointer contents
int init_gpio(gpioCtrl *custom_gpio, u32 base_addr){
	custom_gpio->baseAddress = base_addr;
	return 0;
}

// Write into slave register using gpio base adderess & user data
void write_gpio(gpioCtrl *custom_gpio, u32 write_data){
	// Fx writes to address in struct + offset for register (0=slv_reg0)
	Xil_Out32(custom_gpio->baseAddress + 0, write_data);
}

// Read from slv_reg1 when passed the base_addr pointer
u32 read_gpio(gpioCtrl *custom_gpio){
	// Pointer addition (1 = 4bytes), here we use processor register addition (offset 1 = 4)
	// Return value from slv_reg1 which stores value of LEDs
	return Xil_In32(custom_gpio->baseAddress + 4);
}
