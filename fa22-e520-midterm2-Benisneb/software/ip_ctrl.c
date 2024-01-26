#include "ip_ctrl.h" // "" are for local files, <> are for standard libraries
#include <stdio.h>

// * is a pointer to a struct, to access information inside use "->"
// Function takes base_addr user provides and assigns it to pointer contents
int init_ctrl(IPctrl *custom_ctrl, u32 base_addr){
	custom_ctrl->baseAddress = base_addr;
	return 0;
}

// Write into slave register using ctrl base address & user data
void write_ctrl(IPctrl *custom_ctrl, u32 offset, u32 write_data){
	// function writes to address in struct + offset for register (8=slv_reg2)
	Xil_Out32(custom_ctrl->baseAddress + offset, write_data);  // (12=slv_reg3)
}

// Read from slv_reg0 / 1 when passed base_addr pointer
u32 read_ctrl(IPctrl *custom_ctrl, u32 offset){
	// Pointer addition (1 = 4bytes), processor reg addition (offset 1 = 4)
	// Return values from slv_reg0 / 1 which stores value of leds / rgbs
	return Xil_In32(custom_ctrl->baseAddress + offset);
}
