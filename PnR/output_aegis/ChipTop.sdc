################################################################################
#
# Design name:  routing
#
# Created by icc2 write_sdc on Sun Jul  9 05:48:10 2023
#
################################################################################

set sdc_version 2.1
set_units -time ns -resistance kOhm -capacitance pF -voltage V -current mA

################################################################################
#
# Units
# time_unit               : 1e-09
# resistance_unit         : 1000
# capacitive_load_unit    : 1e-12
# voltage_unit            : 1
# current_unit            : 0.001
# power_unit              : 1e-09
################################################################################


# Mode: default
# Corner: default
# Scenario: default

# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 14
create_clock -name clk -period 20 -waveform {0 10} [get_ports {clk}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 15
create_clock -name spi_sck -period 1000 -waveform {0 500} [get_ports \
    {spi_clk_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 16
create_clock -name tck -period 1000 -waveform {0 500} [get_ports {tck_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 21
create_generated_clock -name gated_clocks -divide_by 1 -source [get_ports \
    {clk}] -add -master_clock [get_clocks {clk}] [get_pins \
    {top_p/core_region_i/CORE_RISCV_CORE/core_clock_gate_i/gated/Q \
    top_p/core_region_i/axi_slice_core2axi/WITH_SLICE_axi_slice_i/aw_buffer_i/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/axi_slice_core2axi/WITH_SLICE_axi_slice_i/ar_buffer_i/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/axi_slice_core2axi/WITH_SLICE_axi_slice_i/w_buffer_i/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/axi_slice_core2axi/WITH_SLICE_axi_slice_i/r_buffer_i/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/axi_slice_core2axi/WITH_SLICE_axi_slice_i/b_buffer_i/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_aw_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_ar_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_w_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_r_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_b_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_aw_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_ar_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_w_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_r_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_b_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/peripherals_i/genblk1_0__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_1__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_2__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_3__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_4__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_5__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_6__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_7__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_8__core_clock_gate/gated/Q \
    top_p/peripherals_i/axi2apb_i/genblk1_axi2apb_i/Slave_aw_buffer/buffer_i/cg_cell/gated/Q \
    top_p/peripherals_i/axi2apb_i/genblk1_axi2apb_i/Slave_ar_buffer/buffer_i/cg_cell/gated/Q \
    top_p/peripherals_i/axi2apb_i/genblk1_axi2apb_i/Slave_w_buffer/buffer_i/cg_cell/gated/Q \
    top_p/peripherals_i/axi2apb_i/genblk1_axi2apb_i/Slave_r_buffer/buffer_i/cg_cell/gated/Q \
    top_p/peripherals_i/axi2apb_i/genblk1_axi2apb_i/Slave_b_buffer/buffer_i/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_REQ_BLOCK_GEN_0__REQ_BLOCK/DW_ALLOC/MASTER_ID_FIFO/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_REQ_BLOCK_GEN_1__REQ_BLOCK/DW_ALLOC/MASTER_ID_FIFO/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_REQ_BLOCK_GEN_2__REQ_BLOCK/DW_ALLOC/MASTER_ID_FIFO/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_RESP_BLOCK_GEN_0__RESP_BLOCK/DW_ADDR_DEC/MASTER_ID_FIFO/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_RESP_BLOCK_GEN_1__RESP_BLOCK/DW_ADDR_DEC/MASTER_ID_FIFO/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_RESP_BLOCK_GEN_2__RESP_BLOCK/DW_ADDR_DEC/MASTER_ID_FIFO/cg_cell/gated/Q}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 25
create_generated_clock -name inverted_adbg_CLK -divide_by 1 -invert -source \
    [get_ports {tck_i}] -add -master_clock [get_clocks {tck}] [get_pins \
    {top_p/core_region_i/adv_dbg_if_i/cluster_tap_i/u_clk_inv/clk_o}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 29
create_generated_clock -name inverted_spi_slave_CLK -divide_by 1 -invert \
    -source [get_ports {spi_clk_i}] -add -master_clock [get_clocks {spi_sck}] \
    [get_pins \
    {top_p/peripherals_i/axi_spi_slave_i/axi_spi_slave_i/u_txreg/clk_inv_i/clk_o}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 46
set_clock_groups -name clk_1 -asynchronous -group [get_clocks {clk}] -group \
    [get_clocks {spi_sck}] -group [get_clocks {tck}]
set_propagated_clock [get_clocks {clk}]
set_propagated_clock [get_clocks {spi_sck}]
set_propagated_clock [get_clocks {tck}]
set_propagated_clock [get_clocks {gated_clocks}]
set_propagated_clock [get_clocks {inverted_adbg_CLK}]
set_propagated_clock [get_clocks {inverted_spi_slave_CLK}]
set_load -pin_load 0.008 [get_ports {spi_sd0_o}]
set_load -pin_load 0.008 [get_ports {spi_master_clk_o}]
set_load -pin_load 0.008 [get_ports {spi_master_csn0_o}]
set_load -pin_load 0.008 [get_ports {spi_master_sdo0}]
set_load -pin_load 0.008 [get_ports {scl1_pad}]
set_load -pin_load 0.008 [get_ports {sda1_pad}]
set_load -pin_load 0.008 [get_ports {uart_tx}]
set_load -pin_load 0.008 [get_ports {gpio_out[8]}]
set_load -pin_load 0.008 [get_ports {gpio_out[7]}]
set_load -pin_load 0.008 [get_ports {gpio_out[6]}]
set_load -pin_load 0.008 [get_ports {gpio_out[5]}]
set_load -pin_load 0.008 [get_ports {gpio_out[4]}]
set_load -pin_load 0.008 [get_ports {gpio_out[3]}]
set_load -pin_load 0.008 [get_ports {gpio_out[2]}]
set_load -pin_load 0.008 [get_ports {gpio_out[1]}]
set_load -pin_load 0.008 [get_ports {gpio_out[0]}]
set_load -pin_load 0.008 [get_ports {tdo_o}]
set_load -pin_load 0.008 [get_ports {PIO1}]
set_load -pin_load 0.008 [get_ports {PIO2}]
set_load -pin_load 0.008 [get_ports {GIO1}]
set_load -pin_load 0.008 [get_ports {GIO2}]
# Set latency for io paths.
# -origin user
set_clock_latency -min 1.08442 [get_clocks {clk}]
# -origin user
set_clock_latency -max 1.11189 [get_clocks {clk}]
# -origin user
set_clock_latency -min 1.00121 [get_clocks {spi_sck}]
# -origin user
set_clock_latency -max 0.98175 [get_clocks {spi_sck}]
# -origin user
set_clock_latency -min 0.880356 [get_clocks {tck}]
# -origin user
set_clock_latency -max 0.91032 [get_clocks {tck}]
# -origin user
set_clock_latency -min 0.333548 [get_clocks {gated_clocks}]
# -origin user
set_clock_latency -max 0.353661 [get_clocks {gated_clocks}]
# -origin user
set_clock_latency -min 0.131359 [get_clocks {inverted_adbg_CLK}]
# -origin user
set_clock_latency -max 0.123882 [get_clocks {inverted_adbg_CLK}]
# -origin user
set_clock_latency -min 0.553932 [get_clocks {inverted_spi_slave_CLK}]
# -origin user
set_clock_latency -max 0.509338 [get_clocks {inverted_spi_slave_CLK}]
# Set propagated on clock sources to avoid removing latency for IO paths.
set_propagated_clock  [get_ports {clk}]
set_propagated_clock  [get_pins \
    {top_p/core_region_i/CORE_RISCV_CORE/core_clock_gate_i/gated/Q \
    top_p/core_region_i/axi_slice_core2axi/WITH_SLICE_axi_slice_i/aw_buffer_i/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/axi_slice_core2axi/WITH_SLICE_axi_slice_i/ar_buffer_i/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/axi_slice_core2axi/WITH_SLICE_axi_slice_i/w_buffer_i/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/axi_slice_core2axi/WITH_SLICE_axi_slice_i/r_buffer_i/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/axi_slice_core2axi/WITH_SLICE_axi_slice_i/b_buffer_i/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_aw_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_ar_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_w_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_r_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/instr_mem_axi_if/axi_mem_if_SP_i/Slave_b_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_aw_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_ar_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_w_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_r_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/core_region_i/data_mem_axi_if/axi_mem_if_SP_i/Slave_b_buffer_LP/buffer_i/cg_cell/gated/Q \
    top_p/peripherals_i/genblk1_0__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_1__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_2__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_3__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_4__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_5__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_6__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_7__core_clock_gate/gated/Q \
    top_p/peripherals_i/genblk1_8__core_clock_gate/gated/Q \
    top_p/peripherals_i/axi2apb_i/genblk1_axi2apb_i/Slave_aw_buffer/buffer_i/cg_cell/gated/Q \
    top_p/peripherals_i/axi2apb_i/genblk1_axi2apb_i/Slave_ar_buffer/buffer_i/cg_cell/gated/Q \
    top_p/peripherals_i/axi2apb_i/genblk1_axi2apb_i/Slave_w_buffer/buffer_i/cg_cell/gated/Q \
    top_p/peripherals_i/axi2apb_i/genblk1_axi2apb_i/Slave_r_buffer/buffer_i/cg_cell/gated/Q \
    top_p/peripherals_i/axi2apb_i/genblk1_axi2apb_i/Slave_b_buffer/buffer_i/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_REQ_BLOCK_GEN_0__REQ_BLOCK/DW_ALLOC/MASTER_ID_FIFO/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_REQ_BLOCK_GEN_1__REQ_BLOCK/DW_ALLOC/MASTER_ID_FIFO/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_REQ_BLOCK_GEN_2__REQ_BLOCK/DW_ALLOC/MASTER_ID_FIFO/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_RESP_BLOCK_GEN_0__RESP_BLOCK/DW_ADDR_DEC/MASTER_ID_FIFO/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_RESP_BLOCK_GEN_1__RESP_BLOCK/DW_ADDR_DEC/MASTER_ID_FIFO/cg_cell/gated/Q \
    top_p/axi_interconnect_i/axi_node_i/u_RESP_BLOCK_GEN_2__RESP_BLOCK/DW_ADDR_DEC/MASTER_ID_FIFO/cg_cell/gated/Q}]
set_propagated_clock  [get_pins \
    {top_p/core_region_i/adv_dbg_if_i/cluster_tap_i/u_clk_inv/clk_o}]
set_propagated_clock  [get_pins \
    {top_p/peripherals_i/axi_spi_slave_i/axi_spi_slave_i/u_txreg/clk_inv_i/clk_o}]
set_propagated_clock  [get_ports {spi_clk_i}]
set_propagated_clock  [get_ports {tck_i}]
set_clock_uncertainty 0.701 [get_clocks {clk}]
set_clock_uncertainty 0.701 [get_clocks {spi_sck}]
set_clock_uncertainty 0.701 [get_clocks {tck}]
set_clock_uncertainty 0.701 [get_clocks {gated_clocks}]
set_clock_uncertainty 0.701 [get_clocks {inverted_adbg_CLK}]
set_clock_uncertainty 0.701 [get_clocks {inverted_spi_slave_CLK}]
set_clock_transition 0.1 [get_clocks {clk}]
set_clock_transition 0.1 [get_clocks {spi_sck}]
set_clock_transition 0.1 [get_clocks {tck}]
set_clock_transition 0.1 [get_clocks {gated_clocks}]
set_clock_transition 0.1 [get_clocks {inverted_adbg_CLK}]
set_clock_transition 0.1 [get_clocks {inverted_spi_slave_CLK}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {rst_n}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {testmode_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {fetch_enable_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {spi_cs_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {spi_sd0_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {spi_master_sdi0}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {scl1_pad}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {sda1_pad}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {uart_rx}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {gpio_in[7]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {gpio_in[6]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {gpio_in[5]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {gpio_in[4]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {gpio_in[3]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {gpio_in[2]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {gpio_in[1]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {gpio_in[0]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {trstn_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {tms_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {tdi_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {PIO1}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {PIO2}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {GIO1}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 124
set_input_transition 0.2 [get_ports {GIO2}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 69
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {fetch_enable_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 79
set_input_delay -clock [get_clocks {spi_sck}] 0.2 [get_ports {spi_cs_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 80
set_input_delay -clock [get_clocks {spi_sck}] 0.2 [get_ports {spi_sd0_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 102
set_output_delay -clock [get_clocks {spi_sck}] 0.2 [get_ports {spi_sd0_o}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 90
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {spi_master_clk_o}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 91
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {spi_master_csn0_o}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 92
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {spi_master_sdo0}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 70
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {spi_master_sdi0}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 72
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {scl1_pad}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 94
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {scl1_pad}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 73
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {sda1_pad}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 95
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {sda1_pad}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 97
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {uart_tx}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 75
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {uart_rx}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 77
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_in[7]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 77
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_in[6]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 77
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_in[5]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 77
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_in[4]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 77
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_in[3]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 77
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_in[2]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 77
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_in[1]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 77
set_input_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_in[0]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 99
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_out[8]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 99
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_out[7]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 99
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_out[6]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 99
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_out[5]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 99
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_out[4]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 99
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_out[3]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 99
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_out[2]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 99
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_out[1]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 99
set_output_delay -clock [get_clocks {clk}] 0.2 [get_ports {gpio_out[0]}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 82
set_input_delay -clock [get_clocks {tck}] 0.2 [get_ports {trstn_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 83
set_input_delay -clock [get_clocks {tck}] 0.2 [get_ports {tms_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 84
set_input_delay -clock [get_clocks {tck}] 0.2 [get_ports {tdi_i}]
# /home/ICer/Asic_pulpino/ICC/Constraints/constraints_placement.tcl, line 104
set_output_delay -clock [get_clocks {tck}] 0.2 [get_ports {tdo_o}]
set_max_transition 1.081 [current_design]
