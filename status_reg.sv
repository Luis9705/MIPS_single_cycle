module status_reg(
	input logic clk,
	input logic asyn_n_rst,
	input logic Z_in,
	input logic C_in,
	input logic N_in,
	input logic O_in,
	output logic Z,
	output logic C,
	output logic N,
	output logic O
	);
	
	
	always_ff @(posedge clk or negedge asyn_n_rst) begin
		if(!asyn_n_rst) begin
			{Z,C,N,O} <= 4'b0;
//			Z <= 1'b0;
//			C <= 1'b0;
//			N <= 1'b0;
//			O <= 1'b0;
		end else begin
			{Z,C,N,O} <= {Z_in, C_in, N_in, O_in};
//			Z <= Z;
//			C <= C;
//			N <= N;
//			O <= O;
		end
	end
	
endmodule
