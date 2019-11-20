import definitions_pkg::*;

module mips_single_cycle(
	input logic asyn_n_rst,
	input logic clk,
	input logic [31:0] instruction,
	input logic [31:0] dm_q,
	output logic [31:0] PC,
	output logic [15:0] dm_address,
	output logic [31:0] dm_d,
	output logic dm_we
	);


	
	op_t op;
	func_t func;
	alu_op_t alu_op;
	logic [31:0] next_pc;
	logic we;
	logic muxSel_sa;
	b_t muxSel_b;
	rd_t muxSel_rd;
	rt_t muxSel_rt;
	data_write_t muxSel_result;
	logic muxSel_dm_address;
	pc_sel_t muxSel_pc;
	logic sel_sign;
	logic [31:0] a;
	logic [31:0] qt;
	logic [31:0] d;
	logic [31:0] r;
	logic [31:0] qs;
	logic [31:0] b;
	logic [15:0] imm;
	logic [25:0] addr;
	logic [31:0] imm_b;
	logic [31:0] sa_extend;
	logic [4:0] sa;
	logic [4:0] rs;
	logic [4:0] rt;
	logic [4:0] rd;
	logic [4:0] rt_in;
	logic Z;
	logic C;
	logic N;
	logic O;
	logic Z_flag;
	logic C_flag;
	logic N_flag;
	logic O_flag;
	logic equal;
	logic lte;
	
	assign op = op_t'(instruction[31:26]);
	assign func = func_t'(instruction[5:0]);
	
	assign rs = instruction[25:21];
	assign rt = instruction[20:16];
	assign sa = instruction[10:6];
	assign imm = instruction[15:0];
	assign addr = instruction[25:0];
	assign dm_d = qt;
	
	always_comb begin	
		if(muxSel_dm_address)
			dm_address = qs[15:0];
		else
			dm_address = imm;
	end
	
	
	extend #(.N_IN(16), .N_OUT(32)) signExtend_imm (
		.immediate(imm),
		.extended(imm_b),
		.sign(sel_sign)
		);
		
	extend #(.N_IN(5), .N_OUT(32)) signExtend_sa (
		.immediate(sa),
		.extended(sa_extend),
		.sign(1'b1)	
		);
	
	controller control_unit(
	.clk(clk),
	.op(op),
	.func(func),
	.equal(equal),
	.lte(lte),
	.we(we),
	.muxSel_sa(muxSel_sa),
	.dm_we(dm_we),
	.muxSel_rd(muxSel_rd),
	.muxSel_rt(muxSel_rt),
	.muxSel_result(muxSel_result),
	.muxSel_b(muxSel_b),
	.muxSel_dm_address(muxSel_dm_address),
	.muxSel_pc(muxSel_pc),
	.sel_sign(sel_sign)
	);
	
	instruction_decoder i_decoder(
	.op(op),
	.func(func),
	.alu_op(alu_op)
	);
	
	
	always_comb begin		
		case(muxSel_result)
			ALU_RESULT : d = r;
			DATA_MEM   : d = dm_q;
			R31_DATA   : d = PC + 32'd1;
			default d = r;
		endcase
	end
	
	always_comb begin		
		case(muxSel_rd)
			RD_VALUE : rd = instruction[15:11];
			RT_VALUE : rd = rt;
			R31_ADDR : rd = 5'd31;
			default rd = rt;
		endcase
	end

	always_comb begin	
		case(muxSel_rt)
			ADDR_RT_VALUE  : rt_in = rt;
			ADDR_R31 : rt_in = 5'd31;
			default rt_in = rt;
		endcase
	end
	
	regfile rf(
	.clk(clk),
	.we(we),
	.rs(rs),
	.rt(rt_in),
	.rd(rd),
	.d(d),
	.qs(qs),
	.qt(qt)
	);
	
	always_comb begin	
		if(muxSel_sa)
			a = sa_extend;
		else
			a = qs;
	end
		
	always_comb begin	
		case(muxSel_b)
			QT_VALUE  : b = qt;
			IMM_VALUE : b = imm_b;
			default b = imm_b;
		endcase
	end
	
	alu alu(
	.a(a),
	.b(b),
	.op(alu_op),
	.Z(Z),
	.C(C),
	.N(N),
	.O(O),
	.equal(equal),
	.lte(lte),
	.r(r)
	);
	
 status_reg status_reg(
	.clk(clk),
	.asyn_n_rst(asyn_n_rst),
	.Z_in(Z),
	.C_in(C),
	.N_in(N),
	.O_in(O),
	.Z(Z_flag),
	.C(C_flag),
	.N(N_flag),
	.O(O_flag)
	);
	
	always_comb begin	
		case(muxSel_pc)
			INCREMENT : next_pc = PC + 32'd1;
			BRANCH    : next_pc = imm_b;
			JUMP      : next_pc = {{6'b0},addr};
			RETURN    : next_pc = qt;
			default     next_pc = PC;
		endcase
	end
	
	PC program_counter(
	.clk(clk),
	.asyn_n_rst(asyn_n_rst),
	.D(next_pc),
	.PC(PC)
	);
	
endmodule

