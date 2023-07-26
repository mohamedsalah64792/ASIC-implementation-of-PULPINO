define_name_rules no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri true
set verilogout_equation false
set_fix_multiple_port_nets -all -buffer_constants [get_designs *]


######### Master Clock Definitions ########### 
set CLK_PER1 20
set CLK_PER2 1000
set max_uncertainty 0.701 
set min_uncertainty 0.701 

create_clock -period $CLK_PER1 -name clk     -waveform "0 10" [get_ports {clk}]
create_clock -period $CLK_PER2 -name spi_sck  -waveform "0 500"  [get_ports {spi_clk_i}]
create_clock -period $CLK_PER2 -name tck      -waveform "0 500"  [get_ports {tck_i}]

create_generated_clock -master_clock clk -source [get_ports {clk}] -name "gated_clocks" [get_pins -hierarchical gated/Q] -divide_by 1 

create_generated_clock -master_clock tck -source [get_ports tck_i] \
                       -name "inverted_adbg_CLK" [get_port top_p/core_region_i/adv_dbg_if_i/cluster_tap_i/u_clk_inv/clk_o] \
                       -invert -divide_by 1 

create_generated_clock -master_clock spi_sck -source [get_ports spi_clk_i] \
                       -name "inverted_spi_slave_CLK" [get_port top_p/peripherals_i/axi_spi_slave_i/axi_spi_slave_i/u_txreg/clk_inv_i/clk_o] \
                       -invert -divide_by 1 

set_clock_uncertainty -setup $max_uncertainty [all_clocks]
set_clock_uncertainty -hold  $min_uncertainty [all_clocks] 

set_clock_transition 0.1 [all_clocks]

# define false paths between all clocks
set_clock_groups -asynchronous \
                 -group { clk } \
                 -group { spi_sck } \
                 -group { tck }
# define case analysis:
set_case_analysis 0 [get_ports testmode_i]
##### set input/output delay/Load on ports ####

set in_factor1 0.01
set out_factor1 0.01

set in_factor2 0.0002
set out_factor2 0.0002

set in_delay1  [expr $in_factor1   * $CLK_PER1]
set out_delay1 [expr $out_factor1  * $CLK_PER1]


set in_delay2  [expr $in_factor2   * $CLK_PER2]
set out_delay2 [expr $out_factor2  * $CLK_PER2]

set in_delay2  [expr $in_factor2   * $CLK_PER2]
set out_delay2 [expr $out_factor2  * $CLK_PER2]
#Constrain Input Paths

 
set_input_delay $in_delay1    -clock  clk     [get_ports fetch_enable_i ]  
set_input_delay $in_delay1    -clock  clk     [get_ports spi_master_sdi0]    
set_input_delay  $in_delay1   -clock  clk     [get_ports scl1_pad] 
set_input_delay  $in_delay1   -clock  clk     [get_ports sda1_pad]  
set_input_delay $in_delay1    -clock  clk     [get_ports uart_rx]
set_input_delay  $in_delay1   -clock  clk     [get_ports gpio_in]

set_input_delay  $in_delay2   -clock  spi_sck     [get_ports spi_cs_i]
set_input_delay  $in_delay2   -clock  spi_sck     [get_ports spi_sd0_i]

set_input_delay  $in_delay2   -clock  tck     [get_ports trstn_i]
set_input_delay  $in_delay2   -clock  tck     [get_ports tms_i]
set_input_delay  $in_delay2   -clock  tck     [get_ports tdi_i]   
 	


#Constrain Output Paths

set_output_delay $out_delay1 -clock  clk  [get_ports spi_master_clk_o]  
set_output_delay $out_delay1 -clock  clk  [get_ports spi_master_csn0_o]     
set_output_delay $out_delay1 -clock  clk  [get_ports spi_master_sdo0]   
set_output_delay $out_delay1 -clock  clk  [get_ports scl1_pad]  
set_output_delay $out_delay1 -clock  clk  [get_ports sda1_pad]  
set_output_delay $out_delay1 -clock  clk  [get_ports uart_tx]
set_output_delay $out_delay1 -clock  clk  [get_ports gpio_out]

set_output_delay $out_delay2 -clock  spi_sck  [get_ports spi_sd0_o]

set_output_delay $out_delay2 -clock  tck  [get_ports tdo_o]  
  
###############      Boundary condition      ##################
#Constrain Output LOAD #
set Min_cap 0.008                   
set Max_cap 0.008

set_load -max $Max_cap [all_outputs]   
set_load -min $Min_cap [all_outputs]

#try transition with 100ps#

set max_trans 0.2
set min_trans 0.2

set_input_transition -max $max_trans  [remove_from_collection [all_inputs] [get_ports {clk spi_clk_i tck_i}]]
set_input_transition -min $min_trans  [remove_from_collection [all_inputs] [get_ports {clk spi_clk_i tck_i}]]

#maximum fanout#
#set_max_fanout 25 $top_module

#set_dont_touch_network []#

set_max_area 900

############ wire_load_model ###########
set_wire_load_mode top
set_wire_load_model -name TSMC8K_Lowk_Conservative -library tcbn65lpbwp7ttc



  


