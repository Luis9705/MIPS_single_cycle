module extend #(parameter N_IN=16, parameter N_OUT = 32)(
		input logic [N_IN-1:0]	immediate,
		input sign,
		output logic [N_OUT -1:0]	extended	
		);
		
		logic [N_OUT -1:0] zero_extended;
		logic [N_OUT -1:0] sign_extended;
		
		
		always_comb begin
			if(sign) extended = sign_extended;
			else extended = zero_extended;
		
		end
		

		assign zero_extended = {{N_OUT - N_IN{1'b0}},immediate};
		assign sign_extended = immediate[N_IN-1] ? {{N_OUT - N_IN{1'b1}},immediate}:{{N_OUT - N_IN{1'b0}},immediate};
endmodule
