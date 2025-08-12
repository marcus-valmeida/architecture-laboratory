`default_nettype none //Comando para desabilitar declaração automática de wires
module Mod_Teste(
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

wire [31:0] fio_pc;
wire [31:0] fio_rd;
wire [2:0] fio_ULAControl;
wire fio_ULASrc , fio_RegWrite;
wire [31:0] fio_ULAResult;
wire [31:0] fio_rd1, fio_rd2;
wire [31:0] fio_saida_extend;
wire [31:0] fio_saida_mux;


pc tes(	
	.clk(~KEY[1]),
	.rst(KEY[2]),
	.pc(fio_pc)
);
	
//saida lcd do pc
assign w_d0x4 = fio_pc[7:0];
	
inst_mem teste(
	.pc(fio_pc),
	.rd(fio_rd)
);

ControlUnit teste2(
	.OP(fio_rd[6:0]),
	.Funct3(fio_rd[14:12]),
	.Funct7(fio_rd[31:25]),
	.ULAControl(fio_ULAControl),
	.ULASrc(fio_ULASrc),
	.RegWrite(fio_RegWrite)
);

RegisterFile teste3(
	.ra1(fio_rd[19:15]),
	.ra2(fio_rd[24:20]),
	.wa3(fio_rd[11:7]),
	.wd3(fio_ULAResult),
	.rd1(fio_rd1),
	.rd2(fio_rd2),
	.clk(~KEY[1]),
	.rst(KEY[2]),
	.we3(fio_RegWrite),
	.x0(w_d0x0), 
	.x1(w_d0x1), 
	.x2(w_d0x2), 
	.x3(w_d0x3),
   .x4(w_d1x0), 
	.x5(w_d1x1), 
	.x6(w_d1x2), 
	.x7(w_d1x3)
);

extend teste4(
	.imm12b(fio_rd[31:20]),
	.imm32b(fio_saida_extend)
);

mux2x1 teste5(
	.in0(fio_rd2),
	.in1(fio_saida_extend),
	.sel(fio_ULASrc),
	.out(fio_saida_mux)

);

Ula test(
	.w_rd1SrcA(fio_rd1),
	.w_SrcB(fio_saida_mux),
	.ULAControl(fio_ULAControl),
	.ULAResult(fio_ULAResult)
);

decodificador_display7seg teste6(.sw(fio_rd[3:0]), .hex0(HEX0));
decodificador_display7seg teste7(.sw(fio_rd[7:4]), .hex0(HEX1));
decodificador_display7seg teste8(.sw(fio_rd[11:8]), .hex0(HEX2));
decodificador_display7seg teste9(.sw(fio_rd[15:12]), .hex0(HEX3));
decodificador_display7seg teste10(.sw(fio_rd[19:16]), .hex0(HEX4));
decodificador_display7seg teste11(.sw(fio_rd[23:20]), .hex0(HEX5));
decodificador_display7seg teste12(.sw(fio_rd[27:24]), .hex0(HEX6));
decodificador_display7seg teste13(.sw(fio_rd[31:28]), .hex0(HEX7));

		
//ativaçao do clock
assign LEDG[8] = ~KEY[1];
assign LEDR[4] = fio_RegWrite;
assign LEDR[3] = fio_ULASrc;
assign LEDR[2:0] = fio_ULAControl;
//assign LEDR[12:5] = 


endmodule