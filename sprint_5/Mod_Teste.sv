`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste (
//Clocks
input CLOCK_27, CLOCK_50,
//Chaves e Botoes
input [3:0] KEY,
input [17:0] SW,
//Displays de 7 seg e LEDs
output [6:0] HEX0, HEX1, HEX2, HEX3, HEX4, HEX5, HEX6, HEX7,
output [8:0] LEDG,
output [17:0] LEDR,
//Serial
output UART_TXD,
input UART_RXD,
inout [7:0] LCD_DATA,
output LCD_ON, LCD_BLON, LCD_RW, LCD_EN, LCD_RS,
//GPIO
inout [35:0] GPIO_0, GPIO_1
);
assign GPIO_1 = 36'hzzzzzzzzz;
assign GPIO_0 = 36'hzzzzzzzzz;
assign LCD_ON = 1'b1;
assign LCD_BLON = 1'b1;
logic [7:0] w_d0x0, w_d0x1, w_d0x2, w_d0x3, w_d0x4, w_d0x5,
w_d1x0, w_d1x1, w_d1x2, w_d1x3, w_d1x4, w_d1x5;
LCD_TEST MyLCD (
.iCLK ( CLOCK_50 ),
.iRST_N ( KEY[0] ),
.d0x0(w_d0x0),.d0x1(w_d0x1),.d0x2(w_d0x2),.d0x3(w_d0x3),.d0x4(w_d0x4),.d0x5(w_d0x5),
.d1x0(w_d1x0),.d1x1(w_d1x1),.d1x2(w_d1x2),.d1x3(w_d1x3),.d1x4(w_d1x4),.d1x5(w_d1x5),
.LCD_DATA( LCD_DATA ),
.LCD_RW ( LCD_RW ),
.LCD_EN ( LCD_EN ),
.LCD_RS ( LCD_RS )
);

wire [31:0] entradaA_ULA, entradaMux;
wire [31:0] entradaB_ULA;
wire [31:0] saida_ula;

RegisterFile teste(
	.wa3(SW[16:14]),
	.clk(KEY[1]),
	.rst(KEY[3]),
	.we3(1'b1),
	.wd3(SW[7:0]),
	.ra1(SW[13:11]),
	.ra2(3'b010),
	.rd1(entradaA_ULA),
	.rd2(entradaMux)
	
	);

assign w_d0x0 = entradaA_ULA[7:0];
assign w_d0x1 = entradaB_ULA[7:0];

mux2x1 teste2(
		.in0(entradaMux),
		.in1(8'h07),
		.out(entradaB_ULA),
		.sel(SW[17])
		
);

Ula teste1(
	.w_rd1SrcA(entradaA_ULA),
	.w_SrcB(entradaB_ULA),
	.ULAControl(SW[10:8]),
	.Z(LEDG[0]),
	.ULAResult(saida_ula)
	);
assign w_d0x4 =saida_ula[7:0];


	
decodificador_display7seg saida_hex0(
		.sw(SW[3:0]),
		.hex0(HEX0)
		);	
		
decodificador_display7seg saida_hex1(
		.sw(SW[7:4]),
		.hex0(HEX1)
		);	
		
//ativaçao do clock
assign LEDG[8] = ~KEY[1];


endmodule