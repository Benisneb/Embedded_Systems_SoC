#include "ip_ctrl.h"
#include <xparameters.h>

int main() {
	IPctrl ip_int;
	// Stores base address from xparameters into IPctrl instance base address
	init_ctrl(&ip_int, XPAR_SW_BTN_TO_LEDS_RGBS_0_S00_AXI_BASEADDR);

	// Inifite loop to read switch values from slv0 and write them into slv_2
	// Will also read button values from slv1 and write them into slv_3
	while(1){
		u32 switches = read_ctrl(&ip_int, 0);
		write_ctrl(&ip_int, 8, switches);

		u32 buttons = read_ctrl(&ip_int, 4);
		if (buttons & 0x8){
			write_ctrl(&ip_int, 12, 0x7);
		} else {
			write_ctrl(&ip_int, 12, buttons);
		}
	}

	//	sw <- slv_reg0 | offset = 0  |	sw  -> led
	// btn <- slv_reg1 | offset = 4  |  btn -> rgb
	// led <- slv_reg2 | offset = 8  |
	// rgb <- slv_reg3 | offset = 12 |
}
