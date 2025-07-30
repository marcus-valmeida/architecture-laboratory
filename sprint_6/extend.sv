module extend(
	//entradas
	input [11:0] imm12b,
	
	//saida
	output reg [31:0] imm32b
	);

assign imm32b = imm12b[11] ? {20{1'b1}, imm12b} : {22{1'b0}, imm12b};

endmodule