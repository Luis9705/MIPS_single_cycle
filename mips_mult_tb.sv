import definitions_pkg::*;
// Define simulation scale
`timescale 1ns/100ps


module mips_mult_tb;

	int i;
	logic clk;
	logic asyn_n_rst;
	 logic [31:0] instruction;
	 logic [31:0] dm_q;
	 logic [31:0] PC;
	 logic [15:0] dm_address;
	 logic [31:0] dm_d;
	 logic dm_we;
	 
	 localparam HEX_CODE_FILE="mult.dat";
	 
	 localparam A = 9;
	 localparam B = -11;
	

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
	
	instruction_memory dut_im(
	.address(PC),
	.q(instruction)
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
		mips_mult_tb.dut_mips_single.rf.RF[ i ] = 32'd0;
	end
	
	for( i = 0; i < 512; i = i + 1 ) begin
		mips_mult_tb.dut_data_memory.mem[ i ] = 32'd0;
	end
	
	mips_mult_tb.dut_data_memory.mem[0] = A;
	mips_mult_tb.dut_data_memory.mem[1] = B;
	
	
	for( i = 0; i < 128; i = i + 1 ) begin
		mips_mult_tb.dut_im.mem[ i ] = 32'd0;
	end
	
	$readmemh(HEX_CODE_FILE, mips_mult_tb.dut_im.mem);
	
	#(1*TCLK);
	asyn_n_rst = 0;
	#(1*TCLK);
	asyn_n_rst = 1;
	
	

	
end

endmodule
