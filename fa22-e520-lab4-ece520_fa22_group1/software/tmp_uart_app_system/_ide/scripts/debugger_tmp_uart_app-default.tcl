# Usage with Vitis IDE:
# In Vitis IDE create a Single Application Debug launch configuration,
# change the debug type to 'Attach to running target' and provide this 
# tcl script in 'Execute Script' option.
# Path of this script: /home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/software/tmp_uart_app_system/_ide/scripts/debugger_tmp_uart_app-default.tcl
# 
# 
# Usage with xsct:
# To debug using xsct, launch xsct and run below command
# source /home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/software/tmp_uart_app_system/_ide/scripts/debugger_tmp_uart_app-default.tcl
# 
connect -url tcp:127.0.0.1:3121
targets -set -nocase -filter {name =~"APU*"}
rst -system
after 3000
targets -set -filter {jtag_cable_name =~ "Digilent Zybo Z7 210351A6B023A" && level==0 && jtag_device_ctx=="jsn-Zybo Z7-210351A6B023A-13722093-0"}
fpga -file /home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/software/tmp_uart_app/_ide/bitstream/tmp_sens_bd_wrapper.bit
targets -set -nocase -filter {name =~"APU*"}
loadhw -hw /home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/software/tmp_sens_bd_wrapper/export/tmp_sens_bd_wrapper/hw/tmp_sens_bd_wrapper.xsa -mem-ranges [list {0x40000000 0xbfffffff}] -regs
configparams force-mem-access 1
targets -set -nocase -filter {name =~"APU*"}
source /home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/software/tmp_uart_app/_ide/psinit/ps7_init.tcl
ps7_init
ps7_post_config
targets -set -nocase -filter {name =~ "*A9*#0"}
dow /home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/software/tmp_uart_app/Debug/tmp_uart_app.elf
configparams force-mem-access 0
bpadd -addr &main
