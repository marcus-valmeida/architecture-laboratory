module instancia_SW_HEX(
	input [6:0]SW,
	output [6:0]HEX0
);



assign HEX0 = ~SW;

endmodule