import definitions_pkg::*;


module alu(
	input logic  [31:0] a,
	input logic  [31:0] b,
	input alu_op_t op,
	output logic Z,
	output logic C,
	output logic N,
	output logic O,
	output logic lte,
	output logic equal,
	output logic [31:0] r
	);
	
	logic extend;
	logic [32:0] extended_sum;
		
		
	logic [31:0] sum_result;
	always_comb begin
		case(op)
			ADD: 	r	=	sum_result;
			SUB:	r	=	a-b;
			AND:	r	=	a&b;
			OR:	r	=	a|b;
			XOR:	r	=	a^b;
			SLL:	r	=	b<<a;
			SRL:	r	=	b>>a;
			SLA:	r	=	$signed(b)<<<a;
			SRA:	r	= 	$signed(b)>>>a;
			LU:	r	=	{b[15:0],16'b0};
			LL:	r	=	{16'b0,b[15:0]};
			default: r = 'z;
		endcase
	end
	
	always_comb begin
		extended_sum = {1'b0, a} + {1'b0, b};//zero extend the sum
		C = extended_sum[32];
		{extend, sum_result} = {a[31], a} + {b[31], b};//sign extend the sum
		O = ({extend, sum_result[31]} == 2'b01);
	end
		assign Z	= (r==0);
		assign N = r[31];
		//assign N = (r[31] && (op ==ADD || op ==SUB));
		assign equal = (a==b);
		
		assign lte = (b <= a);
	
endmodule
