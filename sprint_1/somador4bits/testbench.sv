// Code your testbench here
// or browse Examples
// Testbench para o XOR 2x1 - Entradas manuais 
module tb_somador4bits; 
  logic [3:0] Ia;
  logic [3:0] Ib;
  logic [3:0] Out;
 
  // Sinais 
 
   
  
   somador4bits tes(.a(Ia), .b(Ib), .saida(Out)); 
   
  initial 
    begin 
      //Salva os sinais do TB em um arquivo .vcd 
      $dumpfile("test.vcd"); $dumpvars(1); 
       
      //Monitora os sinais de entrada e saída 
      $monitor("time=%3d, Ia=%h, Ib=%h, Out=%h",$time,Ia,Ib,Out); 
       
      //Geração dos sinais de entra (estímulos) 
      Ia=4'b0110; Ib=4'b0001;  
       #10; 
      Ia=4'b0000; Ib=4'b0111; 
      #10; 
      Ia=4'b0110; Ib=4'b0001; 
      #10; 
      Ia=4'b0001; Ib=4'b0001; 
      #10; 
      $display("Terminou"); 
    end     
endmodule 
	