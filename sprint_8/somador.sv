module somador(
	// entradas
	input logic [31:0] in0, in1,
	
	
	//saidas
	output logic [31:0] out
);

assign out = in0 + in1;
		
		
endmodule

