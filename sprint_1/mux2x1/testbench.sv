// Testbench para o MUX 2x1 - Entradas manuais
module mux2x1_TB;
// Sinais
  	logic [3:0] Ia, Ib;
  	logic sele;
  	logic [3:0]Out;
// Instância do MUX 2x1
	mux2x1 tes(.in0(Ia),
           .in1(Ib), 
           .sel(sele),
           .out(Out));
	initial
		begin
//Salva os sinais do TB em um arquivo .vcd
			$dumpfile("test.vcd"); $dumpvars(1);
//Monitora os sinais de entrada e saída
          $monitor("time=%3d,sele=%b, Ia=%h, Ib=%h, Out=%h",$time, sele,Ia,Ib,Out);
//Geração dos sinais de entra (estímulos)
			Ia = 4'b0000; Ib = 4'b1111; sele = 1'b0; #10;
        	Ia = 4'b0000; Ib = 4'b1111; sele = 1'b1; #10;
        	Ia = 4'b1010; Ib = 4'b0101; sele = 1'b0; #10;
        	Ia = 4'b1010; Ib = 4'b0101; sele = 1'b1; #10;
        	Ia = 4'b1100; Ib = 4'b0011; sele = 1'b0; #10;
        	Ia = 4'b1100; Ib = 4'b0011; sele = 1'b1; #10;
			$display("Terminou");
		end
endmodule
