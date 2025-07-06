module registrador4bits(
	input clk,
	input rst,
  	input enable,
  input [3:0]entrada,
  	output reg [3:0] saida);
  
  always @(posedge clk, negedge rst)
    begin
      if(!rst)
        saida <= 0;
      else if(enable)
        saida <= entrada;
    end 
endmodule


module decodificador_7segmentos (
    input  [3:0] entrada_decodificador,   
    output reg [6:0] display   
);

always @(*) begin
    case (entrada_decodificador)				//6543210
        4'b0000: display  = 7'b1000000; // 0
        4'b0001: display  = 7'b1111001; // 1
        4'b0010: display  = 7'b0100100; // 2
        4'b0011: display  = 7'b0110000; // 3
        4'b0100: display  = 7'b0011001; // 4
        4'b0101: display  = 7'b0010010; // 5
        4'b0110: display  = 7'b0000010; // 6
        4'b0111: display  = 7'b1111000; // 7
        4'b1000: display  = 7'b0000000; // 8
        4'b1001: display  = 7'b0010000; // 9
        4'b1010: display  = 7'b0001000; // A
        4'b1011: display  = 7'b0000011; // b
        4'b1100: display  = 7'b1000110; // C
        4'b1101: display  = 7'b0100001; // d
        4'b1110: display  = 7'b0000110; // E
        4'b1111: display  = 7'b0001110; // F
        default: display  = 7'b1111111; // tudo apagado
    endcase
end

endmodule

module registrador_display(
	input wire [6:0] SW,// SW[3:0] entrada , SW[4] clock , SW[5] reset, SW[6] enable
	output wire [6:0] HEX0 
);

	wire [3:0] saida_registrador;
	
registrador4bits teste_registrador(

		.entrada(SW[3:0]),
		.clk(SW[4]),
		.rst(SW[5]),
		.enable(SW[6]),
		.saida(saida_registrador)
		
	);
	
decodificador_7segmentos teste_decodificador(

	.entrada_decodificador(saida_registrador),
	.display(HEX0)
	);
	
endmodule