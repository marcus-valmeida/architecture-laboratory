// Code your design here
module registrador4bits(
	input clk,
	input rst,
  	input enable,
	input entrada,
  	output reg [3:0] saida);
  
  always @(posedge clk, negedge rst)
    begin
      if(!rst)
        saida <= 0;
      else if(enable)
        saida <= {saida [2:0],entrada};
    end 
endmodule
  
  