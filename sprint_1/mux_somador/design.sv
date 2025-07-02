module mux2x1(
  input  logic [3:0] in0,
  input  logic [3:0] in1,
  input  logic       sel,
  output logic [3:0] out
);
  
  always_comb begin
    if (sel == 1'b0)
      out = in0;
    else
      out = in1;
  end
endmodule

module somador4bits(
  input  logic [3:0] a,
  input  logic [3:0] b,
  output logic [3:0] saida
);
  always_comb begin
    saida = a + b;
  end
endmodule

module mux_somador (
  input  logic [3:0] entradaA,
  input  logic [3:0] entradaB,
  input  logic [3:0] entradaC,
  input  logic sel_mux,
  output logic [3:0] resultado_final
);

  logic [3:0] saida_mux;

  mux2x1 mux (
    .in0(entradaB),
    .in1(entradaC),
    .sel(sel_mux),
    .out(saida_mux)
  );

  somador4bits somador (
    .a(entradaA),
    .b(saida_mux),
    .saida(resultado_final)
  );

endmodule

