import definitions_pkg::*;

module controller(
	input clk,
	input op_t op,
	input func_t func,
	input logic equal,
	input logic lte,
	output logic we,
	output logic muxSel_sa,
	output logic dm_we,
	output rd_t muxSel_rd,
	output rt_t muxSel_rt,
	output b_t muxSel_b,
	output data_write_t muxSel_result,
	output logic muxSel_dm_address,
	output pc_sel_t muxSel_pc,
	output logic sel_sign
	);
	
		
	always_comb begin	
		case(op)
			R_TYPE:begin
				case(func)
					SLL : muxSel_sa = 1'b1;
					SRL : muxSel_sa = 1'b1;
					SLA : muxSel_sa = 1'b1;
					SRA : muxSel_sa = 1'b1;
					default : muxSel_sa = 1'b0;
				endcase
			end
			default muxSel_sa = 1'b0;
		endcase
	end
	
	always_comb begin	
		case(op)
			R_TYPE:muxSel_rd = RD_VALUE;
			JAL   :muxSel_rd = R31_ADDR;
			default muxSel_rd = RT_VALUE;
		endcase
	end
	
	always_comb begin	
		case(op)
			R_TYPE:muxSel_b = QT_VALUE;
			BEQ : muxSel_b = QT_VALUE;
			BNE : muxSel_b = QT_VALUE;
			BLTE : muxSel_b = QT_VALUE;
			default muxSel_b = IMM_VALUE;
		endcase
	end
	
	always_comb begin	
		case(op)
			RET : muxSel_rt = ADDR_R31;
			default muxSel_rt = ADDR_RT_VALUE;
		endcase
	end
	
	always_comb begin	
		case(op)
			SWR : we = 1'b0;
			SWI : we = 1'b0;
			BEQ : we = 1'b0;
			BNE : we = 1'b0;
			BLTE: we = 1'b0;
			J   : we = 1'b0;
			RET : we = 1'b0;
			default we = 1'b1;
		endcase
	end
	
	always_comb begin	
		case(op)
			SWR : dm_we = 1'b1;
			SWI :  dm_we = 1'b1;
			default dm_we = 1'b0;
		endcase
	end
	
	always_comb begin	
		case(op)
			LWR : muxSel_result = DATA_MEM;
			LWI : muxSel_result = DATA_MEM;
			JAL : muxSel_result = R31_DATA;
			default muxSel_result = ALU_RESULT;
		endcase
	end
	
	always_comb begin	
		case(op)
			LWR : muxSel_dm_address = 1'b1;
			SWR : muxSel_dm_address = 1'b1;
			LWI : muxSel_dm_address = 1'b0;
			SWI : muxSel_dm_address = 1'b0;
			default muxSel_dm_address = 1'b0;
		endcase
	end
	
	always_comb begin	
		case(op)
			BEQ : muxSel_pc = (equal)  ? BRANCH : INCREMENT;
			BNE : muxSel_pc = (~equal) ? BRANCH : INCREMENT;
			BLTE: muxSel_pc = (lte) ? BRANCH : INCREMENT;
			J   : muxSel_pc = JUMP;
			JAL : muxSel_pc = JUMP;
			RET : muxSel_pc = RETURN;
			default muxSel_pc = INCREMENT;
		endcase
	end
	
	always_comb begin	
		case(op)
			ANDI : sel_sign = 1'b0;
			ORI  : sel_sign = 1'b0;
			XORI : sel_sign = 1'b0;
			default sel_sign = 1'b1;
		endcase
	end

	
endmodule
