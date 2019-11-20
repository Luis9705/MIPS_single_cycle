import definitions_pkg::*;
// Define simulation scale
`timescale 1ns/100ps


module mips_single_cycle_tb;

	int i;
	logic clk;
	logic asyn_n_rst;
	 logic [31:0] instruction;
	 logic [31:0] dm_q;
	 logic [31:0] PC;
	 logic [15:0] dm_address;
	 logic [31:0] dm_d;
	 logic dm_we;


 mips_single_cycle dut_mips_single(
	.asyn_n_rst(asyn_n_rst),
	.clk(clk),
	.instruction(instruction),
	.dm_q(dm_q),
	.PC(PC),
	.dm_address(dm_address),
	.dm_d(dm_d),
	.dm_we(dm_we)
	
	);
	
	
	data_memory dut_data_memory  (
		.clk(clk),
		.dm_we(dm_we),
		.dm_address(dm_address),
		.dm_q(dm_q),
		.dm_d(dm_d));



			
localparam real TCLK = 10;
always begin
    clk = 1'b0;
    #(0.5*TCLK);
    clk = 1'b1;
    #(0.5*TCLK);
end


initial begin
	asyn_n_rst = 1;
	clk = 0;
	instruction = 0;
	
	for( i = 0; i < 32; i = i + 1 ) begin
		mips_single_cycle_tb.dut_mips_single.rf.RF[ i ] = 32'd0;
	end
	
	for( i = 0; i < 512; i = i + 1 ) begin
		mips_single_cycle_tb.dut_data_memory.mem[ i ] = 32'd0;
	end
	
	mips_single_cycle_tb.dut_mips_single.rf.RF[ 1 ] = -16;
	
	#(1*TCLK);
	asyn_n_rst = 0;
	#(1*TCLK);
	asyn_n_rst = 1;

	 R_TYPE(
		.func(SRL_R),
		.sa(2),
		.rs(1),
		.rt(1),
		.rd(2)
	);	
	 R_TYPE(
		.func(SRA_R),
		.sa(2),
		.rs(1),
		.rt(1),
		.rd(2)
	);	

	 R_TYPE(
		.func(SLL_R),
		.sa(2),
		.rs(1),
		.rt(1),
		.rd(2)
	);	
	 R_TYPE(
		.func(SLA_R),
		.sa(2),
		.rs(1),
		.rt(1),
		.rd(2)
	);
	
	I_TYPE(
		.opcode(LLI),
		.rs(0),
		.rt(0),
		.imm(10)
	);
	
	I_TYPE(
		.opcode(ADDI),
		.rs(0),
		.rt(1),
		.imm(7)
	);
	
	I_TYPE(
		.opcode(ADDI),
		.rs(1),
		.rt(2),
		.imm(-7)
	);
	
	I_TYPE(
		.opcode(SUBI),
		.rs(2),
		.rt(3),
		.imm(10)
	);
	 

	 I_TYPE(
		.opcode(ADDI),
		.rs(3),
		.rt(4),
		.imm(-10)
	);
	
	 R_TYPE(
		.func(ADD_R),
		.sa(0),
		.rs(1),
		.rt(2),
		.rd(5)
	);
	
	J_TYPE(
		.opcode(J),
		.address(10)
	);
	
	J_TYPE(
		.opcode(J),
		.address(20)
	);
	
	
	J_TYPE(
		.opcode(JAL),
		.address(40)
	);
	
	J_TYPE(
		.opcode(RET),
		.address(0)
	);
	
	
	I_TYPE(
		.opcode(BNE),
		.rs(3),
		.rt(2),
		.imm(35)
	);
	
	I_TYPE(
		.opcode(SWR),
		.rs(3),
		.rt(0),
		.imm(35)
	);
	
	I_TYPE(
		.opcode(BLTE),
		.rs(4),
		.rt(0),
		.imm(33)
	);
	
	 
  

    $stop;
end


	task I_TYPE;
		input op_t opcode;
		input logic  [4:0] rs;
		input logic  [4:0] rt;
		input logic signed [15:0]imm;

		instruction[31:26] = opcode;
		instruction[25:21] = rs;
		instruction[20:16] = rt;
		instruction[15:0] = imm;

		#(1*TCLK); 
	
	endtask
  
   task R_TYPE;
		input func_t func;
		input logic [4:0] sa;
		input logic [4:0] rs;
		input logic [4:0] rt;
		input logic [4:0] rd;

		instruction[31:26] = 6'd0;
		instruction[25:21] = rs;
		instruction[20:16] = rt;
		instruction[15:11] = rd;
		instruction[10:6] = sa;
		instruction[5:0] = func;
		
		#(1*TCLK); 
	
  endtask
  
    task J_TYPE;
		input op_t opcode;
		input logic [25:0] address;


		instruction[31:26] = opcode;
		instruction[25:0] = address;

		
		#(1*TCLK); 
	
  endtask


endmodule
