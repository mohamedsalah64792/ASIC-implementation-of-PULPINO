
########################### Define Top Module ############################                             

set top_module pulpino_top_pads

#################        Adding search path              ##################

lappend search_path /home/ICer/Asic_pulpino/DB
lappend search_path /home/ICer/Asic_pulpino/rtl_aegis

##################### Define Working Library Directory ######################

sh rm -rf work
sh mkdir -p work
define_design_lib work -path ./work

################## Design Compiler Library Files #setup ######################

puts "#      #setting Design Libraries          #"

## Standard Cell libraries 
set link_library "* tcbn65lpbwp7ttc.db ts1n65lpll1024x8m4.db tphn65lpnv2od3_sltc1.db aegis_lib.db"

## Standard Cell libraries 
set target_library "tcbn65lpbwp7ttc.db"

######################## Reading RTL Files #################################

puts "#             Reading RTL Files           #"

source ./syn_scripts/reading.tcl 

elaborate -lib work $top_module

###################### Defining toplevel ###################################

current_design $top_module

puts "######## Liniking All The Design Parts ########"

redirect -tee ./log/link.rpt {link}


puts "######## checking design consistency ##########"

redirect -tee ./log/check_design.rpt check_design

puts "############ Design Constraints #### ##########"

source ./syn_scripts/constrains.tcl 

###################### Mapping and optimization ########################
puts "########## Mapping & Optimization #############"

compile

set_svf -off
# Write out files
write_sdf  ./syn_results/sdf.sdf
write_sdc  -nosplit ./syn_results/sdc.sdc
report_area -nosplit -hierarchy > ./syn_results/syn_reports/area.rpt
report_power -nosplit -hierarchy > ./syn_results/syn_reports/power.rpt
report_timing -nosplit -delay_type min -max_paths 100 -nets -capacitance -input_pins -transition_time > ./syn_results/syn_reports/hold.rpt
report_timing -nosplit -delay_type max -max_paths 100 -nets -capacitance -input_pins -transition_time > ./syn_results/syn_reports/setup.rpt
report_clock -attributes > ./syn_results/syn_reports/clocks.rpt
report_constraint -all_violators -nosplit > ./syn_results/syn_reports/violated_constraints.rpt
report_qor > ./syn_results/syn_reports/synth_qor.rpt
report_cell > ./syn_results/syn_reports/synth_cells.rpt
report_resources > ./syn_results/syn_reports/synth_resources.rpt
define_name_rules no_case -case_insensitive
change_names -rule no_case -hierarchy
change_names -rule verilog -hierarchy
set verilogout_no_tri true
set verilogout_equation false
write_file -f ddc -hierarchy -output ./syn_results/ddc.ddc
write_file -format verilog -hierarchy -output ./syn_results/netlist.v


gui_start
