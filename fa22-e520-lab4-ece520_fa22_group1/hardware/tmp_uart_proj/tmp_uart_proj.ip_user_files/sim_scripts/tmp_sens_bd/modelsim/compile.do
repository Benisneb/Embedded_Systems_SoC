vlib modelsim_lib/work
vlib modelsim_lib/msim

vlib modelsim_lib/msim/xilinx_vip
vlib modelsim_lib/msim/xpm
vlib modelsim_lib/msim/axi_infrastructure_v1_1_0
vlib modelsim_lib/msim/axi_vip_v1_1_12
vlib modelsim_lib/msim/processing_system7_vip_v1_0_14
vlib modelsim_lib/msim/xil_defaultlib
vlib modelsim_lib/msim/axi_lite_ipif_v3_0_4
vlib modelsim_lib/msim/lib_pkg_v1_0_2
vlib modelsim_lib/msim/lib_srl_fifo_v1_0_2
vlib modelsim_lib/msim/lib_cdc_v1_0_2
vlib modelsim_lib/msim/axi_uartlite_v2_0_30
vlib modelsim_lib/msim/generic_baseblocks_v2_1_0
vlib modelsim_lib/msim/fifo_generator_v13_2_7
vlib modelsim_lib/msim/axi_data_fifo_v2_1_25
vlib modelsim_lib/msim/axi_register_slice_v2_1_26
vlib modelsim_lib/msim/axi_protocol_converter_v2_1_26
vlib modelsim_lib/msim/proc_sys_reset_v5_0_13

vmap xilinx_vip modelsim_lib/msim/xilinx_vip
vmap xpm modelsim_lib/msim/xpm
vmap axi_infrastructure_v1_1_0 modelsim_lib/msim/axi_infrastructure_v1_1_0
vmap axi_vip_v1_1_12 modelsim_lib/msim/axi_vip_v1_1_12
vmap processing_system7_vip_v1_0_14 modelsim_lib/msim/processing_system7_vip_v1_0_14
vmap xil_defaultlib modelsim_lib/msim/xil_defaultlib
vmap axi_lite_ipif_v3_0_4 modelsim_lib/msim/axi_lite_ipif_v3_0_4
vmap lib_pkg_v1_0_2 modelsim_lib/msim/lib_pkg_v1_0_2
vmap lib_srl_fifo_v1_0_2 modelsim_lib/msim/lib_srl_fifo_v1_0_2
vmap lib_cdc_v1_0_2 modelsim_lib/msim/lib_cdc_v1_0_2
vmap axi_uartlite_v2_0_30 modelsim_lib/msim/axi_uartlite_v2_0_30
vmap generic_baseblocks_v2_1_0 modelsim_lib/msim/generic_baseblocks_v2_1_0
vmap fifo_generator_v13_2_7 modelsim_lib/msim/fifo_generator_v13_2_7
vmap axi_data_fifo_v2_1_25 modelsim_lib/msim/axi_data_fifo_v2_1_25
vmap axi_register_slice_v2_1_26 modelsim_lib/msim/axi_register_slice_v2_1_26
vmap axi_protocol_converter_v2_1_26 modelsim_lib/msim/axi_protocol_converter_v2_1_26
vmap proc_sys_reset_v5_0_13 modelsim_lib/msim/proc_sys_reset_v5_0_13

vlog -work xilinx_vip -64 -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_axi4streampc.sv" \
"/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_axi4pc.sv" \
"/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/xil_common_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_pkg.sv" \
"/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi4stream_vip_if.sv" \
"/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/axi_vip_if.sv" \
"/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/clk_vip_if.sv" \
"/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/hdl/rst_vip_if.sv" \

vlog -work xpm -64 -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"/tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_cdc/hdl/xpm_cdc.sv" \
"/tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_memory/hdl/xpm_memory.sv" \

vcom -work xpm -64 -93 \
"/tools/Xilinx/Vivado/2022.1/data/ip/xpm/xpm_VCOMP.vhd" \

vlog -work axi_infrastructure_v1_1_0 -64 -incr -mfcu "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl/axi_infrastructure_v1_1_vl_rfs.v" \

vlog -work axi_vip_v1_1_12 -64 -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/1033/hdl/axi_vip_v1_1_vl_rfs.sv" \

vlog -work processing_system7_vip_v1_0_14 -64 -incr -mfcu -sv -L axi_vip_v1_1_12 -L processing_system7_vip_v1_0_14 -L xilinx_vip "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl/processing_system7_vip_v1_0_vl_rfs.sv" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/tmp_sens_bd/ip/tmp_sens_bd_processing_system7_0_0/sim/tmp_sens_bd_processing_system7_0_0.v" \

vcom -work axi_lite_ipif_v3_0_4 -64 -93 \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/66ea/hdl/axi_lite_ipif_v3_0_vh_rfs.vhd" \

vcom -work lib_pkg_v1_0_2 -64 -93 \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/0513/hdl/lib_pkg_v1_0_rfs.vhd" \

vcom -work lib_srl_fifo_v1_0_2 -64 -93 \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/51ce/hdl/lib_srl_fifo_v1_0_rfs.vhd" \

vcom -work lib_cdc_v1_0_2 -64 -93 \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ef1e/hdl/lib_cdc_v1_0_rfs.vhd" \

vcom -work axi_uartlite_v2_0_30 -64 -93 \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5d2b/hdl/axi_uartlite_v2_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/tmp_sens_bd/ip/tmp_sens_bd_axi_uartlite_0_0/sim/tmp_sens_bd_axi_uartlite_0_0.vhd" \

vlog -work generic_baseblocks_v2_1_0 -64 -incr -mfcu "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/b752/hdl/generic_baseblocks_v2_1_vl_rfs.v" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/83df/simulation/fifo_generator_vlog_beh.v" \

vcom -work fifo_generator_v13_2_7 -64 -93 \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/83df/hdl/fifo_generator_v13_2_rfs.vhd" \

vlog -work fifo_generator_v13_2_7 -64 -incr -mfcu "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/83df/hdl/fifo_generator_v13_2_rfs.v" \

vlog -work axi_data_fifo_v2_1_25 -64 -incr -mfcu "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5390/hdl/axi_data_fifo_v2_1_vl_rfs.v" \

vlog -work axi_register_slice_v2_1_26 -64 -incr -mfcu "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/0a3f/hdl/axi_register_slice_v2_1_vl_rfs.v" \

vlog -work axi_protocol_converter_v2_1_26 -64 -incr -mfcu "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/90c8/hdl/axi_protocol_converter_v2_1_vl_rfs.v" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/tmp_sens_bd/ip/tmp_sens_bd_auto_pc_0/sim/tmp_sens_bd_auto_pc_0.v" \

vcom -work proc_sys_reset_v5_0_13 -64 -93 \
"../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/8842/hdl/proc_sys_reset_v5_0_vh_rfs.vhd" \

vcom -work xil_defaultlib -64 -93 \
"../../../bd/tmp_sens_bd/ip/tmp_sens_bd_rst_ps7_0_50M_0/sim/tmp_sens_bd_rst_ps7_0_50M_0.vhd" \

vlog -work xil_defaultlib -64 -incr -mfcu "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/ec67/hdl" "+incdir+../../../../tmp_uart_proj.gen/sources_1/bd/tmp_sens_bd/ipshared/5765/hdl" "+incdir+/tools/Xilinx/Vivado/2022.1/data/xilinx_vip/include" \
"../../../bd/tmp_sens_bd/sim/tmp_sens_bd.v" \

vlog -work xil_defaultlib \
"glbl.v"

