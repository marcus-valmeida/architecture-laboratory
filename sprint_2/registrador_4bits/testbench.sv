module registrador4bits_tb;
  reg clk, rst, entrada,enable;
  wire [3:0] saida;
  
  registrador4bits tes(.clk(clk), .rst(rst), .enable(enable), .entrada(entrada), .saida(saida));
  
  initial
    begin
       //Salva os sinais do TB em um arquivo .vcd 
      $dumpfile("test.vcd"); $dumpvars(1); 
       
      //Monitora os sinais de entrada e saída 
      $monitor("time=%3d, clk=%h, rst=%h, entrada=%h, saida=%h, enable=%h", $time, clk, rst, entrada, saida, enable); 
      
      clk = 0; rst= 1; enable=0;
      #1
      rst= 0;
      #1
      rst= 1; entrada= 1; enable= 1;
      #10
      rst= 1; entrada= 0; enable= 1;
      #10
      rst= 1; entrada= 1; enable= 0;
      #10
      rst= 1; entrada= 0; enable= 1;
      #10
      rst= 1; entrada=0;  enable= 1;
      #10
      rst= 1; entrada=0;  enable= 1;
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
  
      
       

  
