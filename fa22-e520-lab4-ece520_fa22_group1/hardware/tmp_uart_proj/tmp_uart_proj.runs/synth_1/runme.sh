#!/bin/sh

# 
# Vivado(TM)
# runme.sh: a Vivado-generated Runs Script for UNIX
# Copyright 1986-2022 Xilinx, Inc. All Rights Reserved.
# 

if [ -z "$PATH" ]; then
  PATH=/tools/Xilinx/Vitis/2022.1/bin:/tools/Xilinx/Vivado/2022.1/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2022.1/bin
else
  PATH=/tools/Xilinx/Vitis/2022.1/bin:/tools/Xilinx/Vivado/2022.1/ids_lite/ISE/bin/lin64:/tools/Xilinx/Vivado/2022.1/bin:$PATH
fi
export PATH

if [ -z "$LD_LIBRARY_PATH" ]; then
  LD_LIBRARY_PATH=
else
  LD_LIBRARY_PATH=:$LD_LIBRARY_PATH
fi
export LD_LIBRARY_PATH

HD_PWD='/home/arianna1/Desktop/ECE520/csun-ece/fa22-e520-lab4-ece520_fa22_group1/hardware/tmp_uart_proj/tmp_uart_proj.runs/synth_1'
cd "$HD_PWD"

HD_LOG=runme.log
/bin/touch $HD_LOG

ISEStep="./ISEWrap.sh"
EAStep()
{
     $ISEStep $HD_LOG "$@" >> $HD_LOG 2>&1
     if [ $? -ne 0 ]
     then
         exit
     fi
}

EAStep vivado -log tmp_sens_bd_wrapper.vds -m64 -product Vivado -mode batch -messageDb vivado.pb -notrace -source tmp_sens_bd_wrapper.tcl
