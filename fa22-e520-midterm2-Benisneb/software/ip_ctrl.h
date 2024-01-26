// Preprocessor flags for header file, without guard there can be circular inclusions
#ifndef _SRC_IP_CTRL_H_
#define _SRC_IP_CTRL_H_

#include <xil_types.h>
#include <xil_io.h>

// Need to keep track of base address of IP for driver
typedef struct IPCtrl{
	u32 baseAddress;
} IPctrl; // Alias for the structure

// Initialize baseAddress from IP and store it into struct
// IPctrl *name -> pointer to a struct with address & name
int init_ctrl(IPctrl *custom_ctrl, u32 base_addr);
// Defines a function to take structure pointer and base addr

// Takes address of IPctrl and writes it using function
void write_ctrl(IPctrl *custom_ctrl, u32 offset, u32 write_data);

// When provided the IPctrl address, returns value inside register
u32 read_ctrl(IPctrl *custom_ctrl, u32 offset);

#endif /* _SRC_IP_CTRL_H_ */
