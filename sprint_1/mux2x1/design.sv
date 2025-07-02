// Code your design here
module mux2x1(
  
  input logic[3:0] in0,
  input logic[3:0] in1,
  input sel,
  output logic[3:0] out,
  
);
  
  always @(*) begin
    if(sel == 1'b0)
      out = in0;
      
    else 
      out = in1;
    
  end
      
endmodule
  
