module RegisterFile_tb;

	//entradas
	reg [4:0] wa3,ra1,ra2;
	reg we3,clk,rst;
	reg [31:0] wd3;
	
	//saida

	wire [7:0] saida_rd1, saida_rd2;
	
	RegisterFile teste(
		
		.wa3(wa3),
		.ra1(ra1),
		.ra2(ra2),
		.we3(we3),
		.clk(clk),
		.rst(rst),
		.wd3(wd3),
		.saida_rd1(saida_rd1),
		.saida_rd2(saida_rd2)
		
		
	);
	
	 // Gera clock de 10ns
	always #5 clk = ~clk;
	
	initial 
		begin
		
		//$display("Início do Testbench");
     //$dumpfile("registerfile_TB.vcd"); // Para GTKWave
      //$dumpvars(0, RegisterFile_TB);
		//inicializa os sinais
			clk = 0; rst = 0;	we3 = 0;	wa3 = 0;	wd3 = 0;	ra1 = 0;	ra2 = 0;
			
			#10 rst=0;
			#20 rst=1;
			
			//escreve o valor 000000CA no registrador 1
			#10 wa3 = 5'd1;
				wd3 = 32'h000000CA;
				we3 = 1;
			
			#10 we3 = 0;// desliga a escrita 
			
			//escreve o valor 000000FE no registrador 7
			#10 wa3 = 5'd7;
				wd3 = 32'h000000FE;
				we3 = 1;
			
			#10 we3 = 0;//desliga escrita
			
			//tenta escrever o valor 000000DB no registrador 0
			#10 wa3 = 5'd0;
				wd3 = 32'h000000DB;
				we3 = 1;
			
			#10 we3 = 1;//desliga escrita
			
		  

		end
		
	endmodule
			
			
			
			
			
			
			
			
			
	


