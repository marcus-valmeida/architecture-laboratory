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

//------------------declaracoes das conecxoes-----------------------------------

wire [31:0] w_PC, w_PCp4,w_ImmPC,w_PCn, w_Inst;
wire w_PCSrc, fio_clock, w_Branch, w_Zero;
wire [2:0] w_ULAControl;
wire [1:0] w_ImmSrc;
wire w_ULASrc , w_RegWrite, w_MemWrite, w_ResultSrc;
wire [31:0] w_ULAResult,w_Wd3, w_rd2, w_rd1SrcA, w_SrcB;
wire [12:0] w_MImm;
wire [31:0] w_Imm;
wire [31:0] W_SrcB;
wire[31:0]w_RData;

//-----------------------------------------------------------------------------



clock_50 clock_2hz(
   .clk_in(CLOCK_50), 
   .clk_out(fio_clock) 
);

somador Adder_4(
 .in0(w_PC),
 .in1(3'h4),
 .out(w_PCp4)
);

somador Adder_Imm(
	.in0(w_Imm),
	.in1(w_PC),
	.out(w_ImmPC)
);


mux2x1 #(.N(32)) MuxPCSrc(
	.in0(w_PCp4),
	.in1(w_ImmPC),
	.sel(w_PCSrc),
	.out(w_PCn)
);
pc Pc(	
	.in(w_PCn),
	.clk(fio_clock),
	.rst(KEY[3]),
	.pc(w_PC)
);
	
//saida lcd do pc
assign w_d0x4 = w_PC[7:0];
	
Instr_Mem Inst_Mem(
	.A(w_PC),
	.RD(w_Inst)
);

ControlUnit control_unit(
	//entradas
	.OP(w_Inst[6:0]),
	.Funct3(w_Inst[14:12]),
	.Funct7(w_Inst[31:25]),
	//saidas
	.ULAControl(w_ULAControl),
	.ULASrc(w_ULASrc),
	.RegWrite(w_RegWrite),
	.ImmSrc(w_ImmSrc),
	.MemWrite(w_MemWrite),
	.ResultSrc(w_ResultSrc),
	.Branch(w_Branch)
	
);

RegisterFile register_file(
	//entrada
	
	.ra1(w_Inst[19:15]),
	.ra2(w_Inst[24:20]),
	.wa3(w_Inst[11:7]),
	.wd3(w_Wd3),
	//.clk(~KEY[1]),
	.clk(fio_clock),
	.rst(KEY[3]),
	.we3(w_RegWrite),
	
	//saida
	
	.rd1(w_rd1SrcA),
	.rd2(w_rd2),
	
	//display
	.x0(w_d0x0), 
	.x1(w_d0x1), 
	.x2(w_d0x2), 
	.x3(w_d0x3),
   .x4(w_d1x0), 
	.x5(w_d1x1), 
	.x6(w_d1x2), 
	.x7(w_d1x3)
);
//ajustar
mux4x2 #(.N(13)) mux_extend(
	.in0({w_Inst[31], w_Inst[31:20]}),
	.in1({w_Inst[31], w_Inst[31:25], w_Inst[11:7]}),
	.in2({w_Inst[31], w_Inst[7], w_Inst[30:25], w_Inst[11:8], 1'b0}),
	.in3(12'bx),
	.sel(w_ImmSrc),
	.out(w_MImm)
);

extend MuxImmSrc(
	.imm13b(w_MImm),
	.imm32b(w_Imm)
);

mux2x1 #(.N(32)) MuxULASrc(
	.in0(w_rd2),
	.in1(w_Imm),
	.sel(w_ULASrc),
	.out(W_SrcB)

);

Ula ULa(
	//entrada
	.w_rd1SrcA(w_rd1SrcA),
	.w_SrcB(w_SrcB),
	.ULAControl(w_ULAControl),
	//saida
	.ULAResult(w_ULAResult),
	.Z(w_Zero)
);

//seletor do mux para o pc
assign w_PCSrc = w_Branch & w_Zero;

Data_Mem data_mem(
	//entrada
	.A(w_ULAResult),
	.WD(w_rd2),
	.rst(KEY[3]),
	//.clk(~KEY[1]),
	//saida
	.clk(fio_clock),
	.WE(w_MemWrite),
	.RD(w_RData)
);

mux2x1 #(.N(32)) MuxResSrc(
	.in0(w_ULAResult),
	.in1(w_RData),
	.sel(w_ResultSrc),
	.out(w_Wd3)

);

decodificador_display7seg teste6(.sw(w_Inst[3:0]), .hex0(HEX0));
decodificador_display7seg teste7(.sw(w_Inst[7:4]), .hex0(HEX1));
decodificador_display7seg teste8(.sw(w_Inst[11:8]), .hex0(HEX2));
decodificador_display7seg teste9(.sw(w_Inst[15:12]), .hex0(HEX3));
decodificador_display7seg teste10(.sw(w_Inst[19:16]), .hex0(HEX4));
decodificador_display7seg teste11(.sw(w_Inst[23:20]), .hex0(HEX5));
decodificador_display7seg teste12(.sw(w_Inst[27:24]), .hex0(HEX6));
decodificador_display7seg teste13(.sw(w_Inst[31:28]), .hex0(HEX7));

		

assign LEDR[0] = w_Branch;
assign LEDR[1] = w_ResultSrc;
assign LEDR[2] = w_MemWrite;
assign LEDR[5:3] = w_ULAControl;
assign LEDR[6] = w_ULASrc;
assign LEDR[8:7] = w_ImmSrc;
assign LEDR[9] = w_RegWrite;
assign LEDG[8] = fio_clock;


endmodule