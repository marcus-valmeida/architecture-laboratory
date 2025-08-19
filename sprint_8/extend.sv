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
	input [12:0] imm13b,
	
	//saida
	output reg [31:0] imm32b
);


always @(*) begin
    if (imm13b[12])
        imm32b = {20'b11111111111111111111, imm13b};
    else
        imm32b = {20'b00000000000000000000, imm13b};
end

endmodule
