#include "gpio_ctrl.h"
#include <xparameters.h>

int main() {
	gpioCtrl gpio_int;
	// Stores base address from xparameters into gpio instance base address
	init_gpio(&gpio_int, XPAR_GPIO_CTRL_IP_0_S00_AXI_BASEADDR);

	// Reads switch values from slv_reg0 and writes it into slv_reg1 for LEDs
	while(1){
		u32 switches = read_gpio(&gpio_int);
		write_gpio(&gpio_int, switches);
	}

	return 0;
}
