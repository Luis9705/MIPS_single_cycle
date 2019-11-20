package definitions_pkg;


// Define a data type called semaphore
// Possible values for semaphore are
// GREEN, YELLOW and RED
typedef enum logic [5:0] {
	R_TYPE  = 6'd0,
	ADDI = 6'd1,
	SUBI = 6'd2,	
	ANDI = 6'd3,
	ORI  = 6'd4,
	XORI = 6'd5,
	LUI  = 6'd6,
	LLI  = 6'd7,
	LWR  = 6'd8,
	SWR  = 6'd9,
	LWI  = 6'd10,
	SWI  = 6'd11,
	BEQ  = 6'd12,
	BNE  = 6'd13,
	J    = 6'd14,
	JAL  = 6'd15,
	RET  = 6'd16,
	BLTE = 6'd17
} op_t;



typedef enum logic [5:0] {
	ADD_R  = 6'd0,
	SUB_R  = 6'd1,	
	AND_R  = 6'd2,
	OR_R   = 6'd3,
	XOR_R  = 6'd4,
	SLL_R  = 6'd5,
	SRL_R  = 6'd6,
	SLA_R  = 6'd7,
	SRA_R  = 6'd8
} func_t;

typedef enum logic [3:0] {
	ADD =	4'b0000,
	SUB =	4'b0001,	
	AND =	4'b0010,
	OR =	4'b0011,
	XOR =	4'b0100,
	SLL =	4'b0101,
	SRL =	4'b0110,
	SLA =	4'b0111,
	SRA =	4'b1000,
	LU =	4'b1001,
	LL =	4'b1010,
	NO_OP = 4'b1011
} alu_op_t;

typedef enum logic [1:0] {
	INCREMENT =	2'd0,
	BRANCH    = 2'd1,
	JUMP 		 = 2'd2,
	RETURN 	 = 2'd3

} pc_sel_t;

typedef enum logic [1:0] {
	ALU_RESULT  =	2'd0,
	DATA_MEM    =  2'd1,
	R31_DATA 	=  2'd2

} data_write_t;

typedef enum logic [1:0] {
	RD_VALUE    =	2'd0,
	RT_VALUE   =  2'd1,
	R31_ADDR 	=  2'd2

} rd_t;

typedef enum logic {
	IMM_VALUE    =	1'd0,
	QT_VALUE   =  1'd1

} b_t;

typedef enum logic {
	ADDR_RT_VALUE =  1'd0,
	ADDR_R31      =  1'd1

} rt_t;


endpackage
