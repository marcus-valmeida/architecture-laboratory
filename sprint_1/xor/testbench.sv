// Testbench para o XOR 2x1 - Entradas manuais 
module XOR2x1_TB; 
 
  // Sinais 
  logic  Ia, Ib; 
  logic Out; 
   
  // Instância da porta XOR 2x1 
  XOR2x1 tes(.in0(Ia), .in1(Ib), .out(Out)); 
   
  initial 
    begin 
      //Salva os sinais do TB em um arquivo .vcd 
      $dumpfile("test.vcd"); $dumpvars(1); 
       
      //Monitora os sinais de entrada e saída 
      $monitor("time=%3d, Ia=%h, Ib=%h, Out=%h",$time,Ia,Ib,Out); 
       
      //Geração dos sinais de entra (estímulos) 
      Ia=1'b0; Ib=1'b0; 
      #10; 
      Ia=1'b1; Ib=1'b0; 
      #10; 
      Ia=1'b0; Ib=1'b1; 
      #10; 
      Ia=1'b1; Ib=1'b1; 
      #10; 
      $display("Terminou"); 
    end     
endmodule 
	