//import rtype_pkg::*;

module data_memory #(DATA_LENGTH=32, MEM_LENGTH = 512)(
	input clk,
	input logic dm_we,
	input logic [15:0] dm_address,
	input logic [DATA_LENGTH-1:0] dm_d,
	output logic [DATA_LENGTH-1:0] dm_q
	);
	
	reg [DATA_LENGTH-1:0] mem [MEM_LENGTH-1:0];
	
	
	assign dm_q = mem[dm_address];
	

	always_ff @(posedge clk)begin	
		if(dm_we) mem[dm_address] <= dm_d;

	end

endmodule
