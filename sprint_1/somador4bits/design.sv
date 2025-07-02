// Code your design here
// Code your testbench here
// or browse Examples
module somador4bits(
  input logic [3:0] a,
  input logic [3:0] b,
  output[3:0] saida
);
  
  assign saida = a + b;
endmodule