# 
# Usage: To re-create this platform project launch xsct with below options.
# xsct /home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/software/tmp_sens_bd_wrapper/platform.tcl
# 
# OR launch xsct and run below command.
# source /home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/software/tmp_sens_bd_wrapper/platform.tcl
# 
# To create the platform in a different location, modify the -out option of "platform create" command.
# -out option specifies the output directory of the platform project.

platform create -name {tmp_sens_bd_wrapper}\
-hw {/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/hardware/export/tmp_sens_bd_wrapper.xsa}\
-out {/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/software}

platform write
domain create -name {standalone_ps7_cortexa9_0} -display-name {standalone_ps7_cortexa9_0} -os {standalone} -proc {ps7_cortexa9_0} -runtime {cpp} -arch {32-bit} -support-app {empty_application}
platform generate -domains 
platform active {tmp_sens_bd_wrapper}
domain active {zynq_fsbl}
domain active {standalone_ps7_cortexa9_0}
platform generate -quick
bsp reload
bsp config stdout "axi_uartlite_0"
bsp config stdin "axi_uartlite_0"
bsp write
bsp reload
catch {bsp regenerate}
platform active {tmp_sens_bd_wrapper}
bsp reload
bsp reload
platform generate
platform config -updatehw {/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/hardware/export/tmp_sens_bd_wrapper.xsa}
platform generate -domains 
platform config -updatehw {/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/hardware/export/tmp_sens_bd_wrapper.xsa}
platform generate -domains 
domain active {zynq_fsbl}
bsp reload
bsp reload
domain active {standalone_ps7_cortexa9_0}
bsp reload
domain active {zynq_fsbl}
bsp reload
platform config -updatehw {/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/hardware/export/tmp_sens_bd_wrapper.xsa}
platform generate -domains 
bsp reload
domain active {standalone_ps7_cortexa9_0}
bsp reload
bsp write
platform generate -domains 
bsp reload
platform config -updatehw {/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/hardware/export/tmp_sens_bd_wrapper.xsa}
platform config -updatehw {/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/hardware/export/tmp_sens_bd_wrapper.xsa}
platform config -updatehw {/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/hardware/export/tmp_sens_bd_wrapper.xsa}
platform generate
platform active {tmp_sens_bd_wrapper}
platform config -updatehw {/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/hardware/export/tmp_sens_bd_wrapper.xsa}
platform generate -domains 
platform active {tmp_sens_bd_wrapper}
platform config -updatehw {/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/hardware/export/tmp_sens_bd_wrapper.xsa}
platform generate -domains 
domain active {zynq_fsbl}
bsp reload
domain active {standalone_ps7_cortexa9_0}
bsp reload
bsp config stdin "axi_uartlite_0"
bsp config stdout "axi_uartlite_0"
bsp config ttc_select_cntr "2"
bsp config stdout "axi_uartlite_0"
bsp write
platform generate -domains 
platform active {tmp_sens_bd_wrapper}
bsp reload
bsp config stdin "axi_uartlite_0"
bsp config stdout "axi_uartlite_0"
bsp reload
platform generate -domains 
