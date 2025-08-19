module mux4x2 #(parameter N=32)(
  
  input logic[N-1:0] in0,
  input logic[N-1:0] in1,
  input logic[N-1:0] in2,
  input logic[N-1:0] in3,
  
  input logic[1:0] sel,
  output logic[N-1:0] out
  
);
  
  always @(*) begin
    case (sel)
      2'b00: out = in0;
      2'b01: out = in1;
      2'b10: out = in2;
      2'b11: out = in3;
      default: out = 2'b00;
    endcase
	  
  end
      
endmodule
  