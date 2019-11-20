module PC(
input logic clk,
	input logic asyn_n_rst,
	input logic [31:0] D,
	output logic [31:0] PC
	);
	
	
	always_ff @(posedge clk or negedge asyn_n_rst) begin	
		if(!asyn_n_rst) PC <= 32'b0;
		else PC <= D;
	end
	
endmodule
