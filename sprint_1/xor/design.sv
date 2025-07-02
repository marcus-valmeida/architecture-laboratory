// Porta XOR 2x1 
module XOR2x1 (input in0, in1, output out); 
   assign out = in0 ^ in1; //out = (in0 & ~in1) | (~in0 & in1) 
endmodule 