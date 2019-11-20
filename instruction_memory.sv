module instruction_memory#(parameter WORDSIZE=32, NWORDS=128 )(
	input logic [6:0] address,
	output logic [31:0] q
	);
	
	logic[WORDSIZE-1:0] mem[NWORDS-1:0];

	
	assign q = mem[address];
	
endmodule