module registrador4bits_tb;
  reg clk, rst,enable,sel_mux;
  reg [3:0] entradaA,entradaB, entradaC;
  wire [3:0] saida_registrador;
  
  saida tes(.clk(clk), .rst(rst), .enable(enable), .sel_mux(sel_mux), 	.entradaA(entradaA), .entradaB(entradaB), 			      .entradaC(entradaC),.saida_registrador(saida_registrador));
  initial
    begin
       //Salva os sinais do TB em um arquivo .vcd 
      $dumpfile("test.vcd"); $dumpvars(1); 
       
      //Monitora os sinais de entrada e saída 
      $monitor("time=%3d, clk=%h, rst=%h, entradaA=%h,, entradaB=%h, entradaC=%h, saida_registrador=%h, enable=%h, sel_mux=%h", $time, clk, rst, entradaA, entradaB, entradaC, saida_registrador, enable, sel_mux ); 
      
      clk = 0; rst= 1; enable=0;entradaA= 4'b0001;entradaB = 			  4'b0100;entradaC=4'b0100 ;sel_mux =1;
      #1
      rst= 0;
      #1
      entradaA= 4'b0101;entradaB = 4'b0100;entradaC=4'b00010 ;enable= 1; 	  rst= 1;sel_mux =1;
      #10
      entradaA= 4'b0011;entradaB = 4'b0100;entradaC=4'b00010 ;enable= 1; 	  rst= 1;sel_mux =1;
      #10
      entradaA= 4'b0001;entradaB = 4'b0100;entradaC=4'b00010 ; enable= 1; 	  rst= 1;sel_mux =1;
      #10
      entradaA= 4'b0101;entradaB = 4'b0100;entradaC=4'b01000; enable= 1; 	  rst= 1;sel_mux =1 ;
      #10
      entradaA= 4'b0101;entradaB = 4'b0100;entradaC=4'b01000; enable= 1; 	  rst= 1;sel_mux =1;
      #10
      entradaA= 4'b0001;entradaB = 4'b0100;entradaC=4'b01000 ;enable= 1; 	  rst= 1;sel_mux =1;
      #10
      $display("Terminou"); 
      $finish();
    end
  always
    begin
      #5
      clk= ~clk;
    end
endmodule
  