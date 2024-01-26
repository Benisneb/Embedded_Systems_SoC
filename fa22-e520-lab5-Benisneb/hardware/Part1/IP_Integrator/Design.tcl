
################################################################
# This is a generated script based on design: UART_LED
#
# Though there are limitations about the generated script,
# the main purpose of this utility is to make learning
# IP Integrator Tcl commands easier.
################################################################

namespace eval _tcl {
proc get_script_folder {} {
   set script_path [file normalize [info script]]
   set script_folder [file dirname $script_path]
   return $script_folder
}
}
variable script_folder
set script_folder [_tcl::get_script_folder]

################################################################
# Check if script is running in correct Vivado version.
################################################################
set scripts_vivado_version 2022.1
set current_vivado_version [version -short]

if { [string first $scripts_vivado_version $current_vivado_version] == -1 } {
   puts ""
   catch {common::send_gid_msg -ssname BD::TCL -id 2041 -severity "ERROR" "This script was generated using Vivado <$scripts_vivado_version> and is being run in <$current_vivado_version> of Vivado. Please run the script in Vivado <$scripts_vivado_version> then open the design in Vivado <$current_vivado_version>. Upgrade the design by running \"Tools => Report => Report IP Status...\", then run write_bd_tcl to create an updated script."}

   return 1
}

################################################################
# START
################################################################

# To test this script, run the following commands from Vivado Tcl console:
# source UART_LED_script.tcl

# If there is no project opened, this script will create a
# project, but make sure you do not have an existing project
# <./myproj/project_1.xpr> in the current working folder.

set list_projs [get_projects -quiet]
if { $list_projs eq "" } {
   create_project project_1 myproj -part xc7z010clg400-1
   set_property BOARD_PART digilentinc.com:zybo-z7-10:part0:1.1 [current_project]
}


# CHANGE DESIGN NAME HERE
variable design_name
set design_name UART_LED

# If you do not already have an existing IP Integrator design open,
# you can create a design using the following command:
#    create_bd_design $design_name

# Creating design if needed
set errMsg ""
set nRet 0

set cur_design [current_bd_design -quiet]
set list_cells [get_bd_cells -quiet]

if { ${design_name} eq "" } {
   # USE CASES:
   #    1) Design_name not set

   set errMsg "Please set the variable <design_name> to a non-empty value."
   set nRet 1

} elseif { ${cur_design} ne "" && ${list_cells} eq "" } {
   # USE CASES:
   #    2): Current design opened AND is empty AND names same.
   #    3): Current design opened AND is empty AND names diff; design_name NOT in project.
   #    4): Current design opened AND is empty AND names diff; design_name exists in project.

   if { $cur_design ne $design_name } {
      common::send_gid_msg -ssname BD::TCL -id 2001 -severity "INFO" "Changing value of <design_name> from <$design_name> to <$cur_design> since current design is empty."
      set design_name [get_property NAME $cur_design]
   }
   common::send_gid_msg -ssname BD::TCL -id 2002 -severity "INFO" "Constructing design in IPI design <$cur_design>..."

} elseif { ${cur_design} ne "" && $list_cells ne "" && $cur_design eq $design_name } {
   # USE CASES:
   #    5) Current design opened AND has components AND same names.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 1
} elseif { [get_files -quiet ${design_name}.bd] ne "" } {
   # USE CASES: 
   #    6) Current opened design, has components, but diff names, design_name exists in project.
   #    7) No opened design, design_name exists in project.

   set errMsg "Design <$design_name> already exists in your project, please set the variable <design_name> to another value."
   set nRet 2

} else {
   # USE CASES:
   #    8) No opened design, design_name not in project.
   #    9) Current opened design, has components, but diff names, design_name not in project.

   common::send_gid_msg -ssname BD::TCL -id 2003 -severity "INFO" "Currently there is no design <$design_name> in project, so creating one..."

   create_bd_design $design_name

   common::send_gid_msg -ssname BD::TCL -id 2004 -severity "INFO" "Making design <$design_name> as current_bd_design."
   current_bd_design $design_name

}

  # Add USER_COMMENTS on $design_name
  set_property USER_COMMENTS.comment_0 "This is an IPI example project. This is to demonstrate that the IP integrator flow (IPI flow) can also be used for non-embedded designs." [get_bd_designs $design_name]

common::send_gid_msg -ssname BD::TCL -id 2005 -severity "INFO" "Currently the variable <design_name> is equal to \"$design_name\"."

if { $nRet != 0 } {
   catch {common::send_gid_msg -ssname BD::TCL -id 2006 -severity "ERROR" $errMsg}
   return $nRet
}

set bCheckIPsPassed 1
##################################################################
# CHECK IPs
##################################################################
set bCheckIPs 1
if { $bCheckIPs == 1 } {
   set list_check_ips "\ 
xilinx.com:user:led_ctl:1.0\
xilinx.com:user:meta_harden:1.0\
xilinx.com:ip:util_ds_buf:2.2\
xilinx.com:ip:xlconstant:1.1\
xilinx.com:user:uart_baud_gen:1.0\
xilinx.com:user:uart_rx_ctl:1.0\
"

   set list_ips_missing ""
   common::send_gid_msg -ssname BD::TCL -id 2011 -severity "INFO" "Checking if the following IPs exist in the project's IP catalog: $list_check_ips ."

   foreach ip_vlnv $list_check_ips {
      set ip_obj [get_ipdefs -all $ip_vlnv]
      if { $ip_obj eq "" } {
         lappend list_ips_missing $ip_vlnv
      }
   }

   if { $list_ips_missing ne "" } {
      catch {common::send_gid_msg -ssname BD::TCL -id 2012 -severity "ERROR" "The following IPs are not found in the IP Catalog:\n  $list_ips_missing\n\nResolution: Please add the repository containing the IP(s) to the project." }
      set bCheckIPsPassed 0
   }

}

if { $bCheckIPsPassed != 1 } {
  common::send_gid_msg -ssname BD::TCL -id 2023 -severity "WARNING" "Will not continue with creation of design due to the error(s) above."
  return 3
}

##################################################################
# DESIGN PROCs
##################################################################


# Hierarchical cell: uart_rx_i0
proc create_hier_cell_uart_rx_i0 { parentCell nameHier } {

  variable script_folder

  if { $parentCell eq "" || $nameHier eq "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2092 -severity "ERROR" "create_hier_cell_uart_rx_i0() - Empty argument(s)!"}
     return
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj

  # Create cell and set as current instance
  set hier_obj [create_bd_cell -type hier $nameHier]
  current_bd_instance $hier_obj

  # Create interface pins

  # Create pins
  create_bd_pin -dir I clk_dst
  create_bd_pin -dir I -type rst rst
  create_bd_pin -dir O -from 7 -to 0 rx_data
  create_bd_pin -dir O rx_data_rdy
  create_bd_pin -dir I rxd_pin

  # Create instance: meta_harden_0, and set properties
  set meta_harden_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:meta_harden:1.0 meta_harden_0 ]

  # Create instance: uart_baud_gen_0, and set properties
  set uart_baud_gen_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:uart_baud_gen:1.0 uart_baud_gen_0 ]

  # Create instance: uart_rx_ctl_0, and set properties
  set uart_rx_ctl_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:uart_rx_ctl:1.0 uart_rx_ctl_0 ]

  # Create port connections
  connect_bd_net -net meta_harden_0_signal_dst [get_bd_pins meta_harden_0/signal_dst] [get_bd_pins uart_rx_ctl_0/rxd_clk_rx]
  connect_bd_net -net meta_harden_rst_signal_dst [get_bd_pins rst] [get_bd_pins meta_harden_0/rst_dst] [get_bd_pins uart_baud_gen_0/rst] [get_bd_pins uart_rx_ctl_0/rst_clk_rx]
  connect_bd_net -net signal_src_0_3 [get_bd_pins rxd_pin] [get_bd_pins meta_harden_0/signal_src]
  connect_bd_net -net uart_baud_gen_0_baud_x16_en [get_bd_pins uart_baud_gen_0/baud_x16_en] [get_bd_pins uart_rx_ctl_0/baud_x16_en]
  connect_bd_net -net uart_rx_ctl_0_rx_data [get_bd_pins rx_data] [get_bd_pins uart_rx_ctl_0/rx_data]
  connect_bd_net -net uart_rx_ctl_0_rx_data_rdy [get_bd_pins rx_data_rdy] [get_bd_pins uart_rx_ctl_0/rx_data_rdy]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins clk_dst] [get_bd_pins meta_harden_0/clk_dst] [get_bd_pins uart_baud_gen_0/clk] [get_bd_pins uart_rx_ctl_0/clk_rx]

  # Restore current instance
  current_bd_instance $oldCurInst
}


# Procedure to create entire design; Provide argument to make
# procedure reusable. If parentCell is "", will use root.
proc create_root_design { parentCell } {

  variable script_folder
  variable design_name

  if { $parentCell eq "" } {
     set parentCell [get_bd_cells /]
  }

  # Get object for parentCell
  set parentObj [get_bd_cells $parentCell]
  if { $parentObj == "" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2090 -severity "ERROR" "Unable to find parent cell <$parentCell>!"}
     return
  }

  # Make sure parentObj is hier blk
  set parentType [get_property TYPE $parentObj]
  if { $parentType ne "hier" } {
     catch {common::send_gid_msg -ssname BD::TCL -id 2091 -severity "ERROR" "Parent <$parentObj> has TYPE = <$parentType>. Expected to be <hier>."}
     return
  }

  # Save current instance; Restore later
  set oldCurInst [current_bd_instance .]

  # Set parent object as current
  current_bd_instance $parentObj


  # Create interface ports

  # Create ports
  set btn_pin [ create_bd_port -dir I btn_pin ]
  set clk_pin_n [ create_bd_port -dir I -from 0 -to 0 -type clk clk_pin_n ]
  set clk_pin_p [ create_bd_port -dir I -from 0 -to 0 -type clk clk_pin_p ]
  set led_ctl_0 [ create_bd_port -dir O -from 7 -to 0 led_ctl_0 ]
  set rst_pin [ create_bd_port -dir I rst_pin ]
  set rxd_pin [ create_bd_port -dir I rxd_pin ]

  # Create instance: led_ctl_0, and set properties
  set led_ctl_0 [ create_bd_cell -type ip -vlnv xilinx.com:user:led_ctl:1.0 led_ctl_0 ]

  # Create instance: meta_harden_btn, and set properties
  set meta_harden_btn [ create_bd_cell -type ip -vlnv xilinx.com:user:meta_harden:1.0 meta_harden_btn ]

  # Create instance: meta_harden_rst, and set properties
  set meta_harden_rst [ create_bd_cell -type ip -vlnv xilinx.com:user:meta_harden:1.0 meta_harden_rst ]

  # Create instance: uart_rx_i0
  create_hier_cell_uart_rx_i0 [current_bd_instance .] uart_rx_i0

  # Create instance: util_ds_buf_0, and set properties
  set util_ds_buf_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:util_ds_buf:2.2 util_ds_buf_0 ]
  set_property -dict [ list \
   CONFIG.C_BUF_TYPE {IBUFDS} \
 ] $util_ds_buf_0

  # Create instance: xlconstant_0, and set properties
  set xlconstant_0 [ create_bd_cell -type ip -vlnv xilinx.com:ip:xlconstant:1.1 xlconstant_0 ]
  set_property -dict [ list \
   CONFIG.CONST_VAL {0} \
 ] $xlconstant_0

  # Create port connections
  connect_bd_net -net IBUF_DS_N_0_1 [get_bd_ports clk_pin_n] [get_bd_pins util_ds_buf_0/IBUF_DS_N]
  connect_bd_net -net IBUF_DS_P_0_1 [get_bd_ports clk_pin_p] [get_bd_pins util_ds_buf_0/IBUF_DS_P]
  connect_bd_net -net led_ctl_0_led_o [get_bd_ports led_ctl_0] [get_bd_pins led_ctl_0/led_o]
  connect_bd_net -net meta_harden_btn_signal_dst [get_bd_pins led_ctl_0/btn_clk_rx] [get_bd_pins meta_harden_btn/signal_dst]
  connect_bd_net -net meta_harden_rst_signal_dst [get_bd_pins led_ctl_0/rst_clk_rx] [get_bd_pins meta_harden_btn/rst_dst] [get_bd_pins meta_harden_rst/signal_dst] [get_bd_pins uart_rx_i0/rst]
  connect_bd_net -net signal_src_0_1 [get_bd_ports btn_pin] [get_bd_pins meta_harden_btn/signal_src]
  connect_bd_net -net signal_src_0_2 [get_bd_ports rst_pin] [get_bd_pins meta_harden_rst/signal_src]
  connect_bd_net -net signal_src_0_3 [get_bd_ports rxd_pin] [get_bd_pins uart_rx_i0/rxd_pin]
  connect_bd_net -net uart_rx_ctl_0_rx_data [get_bd_pins led_ctl_0/rx_data] [get_bd_pins uart_rx_i0/rx_data]
  connect_bd_net -net uart_rx_ctl_0_rx_data_rdy [get_bd_pins led_ctl_0/rx_data_rdy] [get_bd_pins uart_rx_i0/rx_data_rdy]
  connect_bd_net -net util_ds_buf_0_IBUF_OUT [get_bd_pins led_ctl_0/clk_rx] [get_bd_pins meta_harden_btn/clk_dst] [get_bd_pins meta_harden_rst/clk_dst] [get_bd_pins uart_rx_i0/clk_dst] [get_bd_pins util_ds_buf_0/IBUF_OUT]
  connect_bd_net -net xlconstant_0_dout [get_bd_pins meta_harden_rst/rst_dst] [get_bd_pins xlconstant_0/dout]

  # Create address segments


  # Restore current instance
  current_bd_instance $oldCurInst

  validate_bd_design
  save_bd_design
}
# End of create_root_design()


##################################################################
# MAIN FLOW
##################################################################

create_root_design ""


