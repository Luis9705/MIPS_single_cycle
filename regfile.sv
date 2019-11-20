//import definitions::*;
module regfile #(parameter SECT=5)(
	input logic clk,
	input logic we,
	input logic [SECT-1:0]	rs,
	input logic [SECT-1:0]	rt,
	input logic	[SECT-1:0]	rd,
	input logic	[31:0]	d,
	output logic	[31:0]	qs,
	output logic	[31:0]	qt
	);
	
	logic [31:0] RF	[31:0];
	
	
	assign qs = RF[rs];
	assign qt = RF[rt];
	
	
	always_ff @(posedge clk)begin	
		if(we) RF[rd] <= d;

	end
		
endmodule
