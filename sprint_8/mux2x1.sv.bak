module mux2x1 #(parameter N=32)(
  
  input logic[N-1:0] in0,
  input logic[N-1:0] in1,
  input sel,
  output logic[N-1:0] out
  
);
  
  always @(*) begin
    if(sel == 1'b0)
      out = in0;
      
    else 
      out = in1;
    
  end
      
endmodule
  
