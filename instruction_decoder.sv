import definitions_pkg::*;


module instruction_decoder(
	input op_t op,
	input func_t func,
	output alu_op_t alu_op
	);
	

	always_comb begin
		case(op)
			R_TYPE:begin
				case(func)
					ADD_R: 	alu_op	=	ADD;
					SUB_R:	alu_op	=	SUB;
					AND_R:	alu_op	=	AND;
					OR_R:	alu_op	=	OR;
					XOR_R:	alu_op	=	XOR;
					SLL_R:	alu_op	=	SLL;
					SRL_R:	alu_op	=	SRL;
					SLA_R:	alu_op	=	SLA;
					SRA_R:	alu_op	= 	SRA;
					default alu_op = NO_OP;
				endcase
			end
			ADDI: alu_op	=	ADD;
			SUBI:	alu_op	=	SUB;
			ANDI:	alu_op	=	AND;
			ORI:	alu_op	=	OR;
			XORI:	alu_op	=	XOR;
			LUI:	alu_op	=	LU;
			LLI:	alu_op	=	LL;
			default alu_op = NO_OP;

		endcase
	end

endmodule
