// This is a demonstration of how to construct custom drivers using C header files

#ifndef _SRC_GPIOCTRL_H_	// Preprocessor flags for header file (unique to code)
#define _SRC_GPIOCTRL_H_	// Without guard can copy paste header a ton of times on top of c
							// Will only attach this header file once if not created already
#include <xil_types.h>		// Will prevent circular inclusions
#include <xil_io.h>

// Keeps track of base address of IP for driver
typedef struct gpioCtrl{
	u32 baseAddress;
} gpioCtrl; // Alias for structure

// Initialize baseAddress from IP and store it to struct
// gpioCtrl *name -- is a pointer to a struct with address&name
int init_gpio(gpioCtrl *custom_gpio, u32 base_addr);

// Takes address of gpio and writes it using function
void write_gpio(gpioCtrl *custom_gpio, u32 write_data);

// When provided the gpio address, returns value inside
u32 read_gpio(gpioCtrl *custom_gpio);

// Any function can be created here for later behavior
void legit_name_any_function_this_way();

#endif /* _SRC_GPIOCTRL_H_ */
