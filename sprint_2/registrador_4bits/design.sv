// Code your design here
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
  
  