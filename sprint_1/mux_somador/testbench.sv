module mux_somador_TB;
  logic [3:0] entradaA, entradaB, entradaC;
  logic       sel_mux;
  logic [4:0] resultado_final;

  
  mux_somador test(
    .entradaA(entradaA),
    .entradaB(entradaB),
    .entradaC(entradaC),
    .sel_mux(sel_mux),
    .resultado_final(resultado_final)
  );

  initial begin
    $dumpfile("test.vcd");
    $dumpvars(1);
    $monitor("time=%3d, sel_mux=%b, entradaA=%b, entradaB=%b, entradaC=%b, resultado=%b",
             $time, sel_mux, entradaA, entradaB, entradaC, resultado_final);

    entradaA = 4'b0011; entradaB = 4'b0101; entradaC = 4'b0001; sel_mux = 0;
    #10;
    entradaA = 4'b0111; entradaB = 4'b0000; entradaC = 4'b0010; sel_mux = 1;
    #10;

    $display("Terminou");
  end
endmodule

