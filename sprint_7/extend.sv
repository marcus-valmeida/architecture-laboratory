//module extend(
	//entradas
	//input [11:0] imm12b,
	
	//saida
	//output [31:0] imm32b
//);

//assign imm32b = imm12b[11] ? {20{1'b1}, imm12b} : {20{1'b0}, imm12b};


//endmodule
module extend(

	//entradas
	input [11:0] imm12b,
	
	//saida
	output reg [31:0] imm32b
);


always @(*) begin
    if (imm12b[11])
        imm32b = {20'b11111111111111111111, imm12b};
    else
        imm32b = {20'b00000000000000000000, imm12b};
end

endmodule
