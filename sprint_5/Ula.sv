module Ula(
    //entradas
    input [31:0] w_rd1SrcA,w_SrcB,
    input [2:0] ULAControl,

    //saída
    output Z,
    output [31:0] ULAResult			

);

always @(*)
	begin
	case(ULAControl)
		
		3'b000: ULAResult = w_rd1SrcA + w_SrcB;
		3'b001: ULAResult = w_rd1SrcA + ~w_SrcB + 1 ; //SrcA - SrcB
		3'b010: ULAResult = w_rd1SrcA & w_SrcB;
		3'b011: ULAResult = w_rd1SrcA | w_SrcB;
		3'b101: ULAResult = (w_rd1SrcA < w_SrcB) ? 32'b1 : 32'b0;
		default: ULAResult = 32'b0;
 
		endcase
	
	Z = (ULAResult == 32'b0) ? 1: 0;

	end
endmodule