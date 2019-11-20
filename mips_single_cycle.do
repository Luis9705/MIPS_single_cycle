onerror {resume}
vlib work
vmap work 
vlog -sv  definitions_pkg.sv
vlog -sv  status_reg.sv
vlog -sv  instruction_decoder.sv
vlog -sv  extend.sv
vlog -sv  PC.sv
vlog -sv  alu.sv
vlog -sv  controller.sv
vlog -sv  instruction_memory.sv
vlog -sv  data_memory.sv
vlog -sv  regfile.sv
vlog -sv  mips_single_cycle.sv
vlog -sv  mips_single_cycle_tb.sv

vsim work.mips_single_cycle_tb
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix decimal /mips_single_cycle_tb/clk
add wave -noupdate -radix hexadecimal /mips_single_cycle_tb/instruction
add wave -noupdate -radix decimal /mips_single_cycle_tb/dm_q
add wave -noupdate -radix decimal /mips_single_cycle_tb/PC
add wave -noupdate -radix decimal /mips_single_cycle_tb/dm_address
add wave -noupdate -radix decimal /mips_single_cycle_tb/dm_d
add wave -noupdate -radix decimal /mips_single_cycle_tb/dm_we
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/dm_q
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/dm_address
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/dm_d
add wave -noupdate -radix binary /mips_single_cycle_tb/dut_mips_single/dm_we
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/op
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/func
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/alu_op
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/next_pc
add wave -noupdate -radix binary /mips_single_cycle_tb/dut_mips_single/we
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/muxSel_sa
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/muxSel_b
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/muxSel_rd
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/muxSel_rt
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/muxSel_result
add wave -noupdate -radix binary /mips_single_cycle_tb/dut_mips_single/muxSel_dm_address
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/muxSel_pc
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/sel_sign
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/qt
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/a
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/b
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/r
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/d
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/qs
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/imm
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/addr
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/imm_b
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/sa_extend
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/sa
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/rs
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/rt
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/rd
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/rt_in
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/Z
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/C
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/N
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/O
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/Z_flag
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/C_flag
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/N_flag
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/O_flag
add wave -noupdate -radix decimal /mips_single_cycle_tb/dut_mips_single/equal
add wave -noupdate -radix decimal -childformat {{{/mips_single_cycle_tb/dut_mips_single/rf/RF[31]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[30]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[29]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[28]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[27]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[26]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[25]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[24]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[23]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[22]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[21]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[20]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[19]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[18]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[17]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[16]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[15]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[14]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[13]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[12]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[11]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[10]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[9]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[8]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[7]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[6]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[5]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[4]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[3]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[2]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[1]} -radix decimal} {{/mips_single_cycle_tb/dut_mips_single/rf/RF[0]} -radix decimal}} -expand -subitemconfig {{/mips_single_cycle_tb/dut_mips_single/rf/RF[31]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[30]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[29]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[28]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[27]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[26]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[25]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[24]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[23]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[22]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[21]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[20]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[19]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[18]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[17]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[16]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[15]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[14]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[13]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[12]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[11]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[10]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[9]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[8]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[7]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[6]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[5]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[4]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[3]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[2]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[1]} {-height 15 -radix decimal} {/mips_single_cycle_tb/dut_mips_single/rf/RF[0]} {-height 15 -radix decimal}} /mips_single_cycle_tb/dut_mips_single/rf/RF
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {70000 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 311
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {32600 ps} {187800 ps}
run -all