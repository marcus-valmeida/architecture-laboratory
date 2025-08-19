// implementar uma memória puramente combinacional, com endereços parametrizáveis entre 10bits e 32bits.

module Instr_Mem (
    input logic [31:0] A,
	output logic [31:0] RD
);
	 // criando o vetor que irá receber as instancias.
	 reg [31:0] memory [0:6];

	 initial begin
	     $readmemh("test_vector.txt", memory);
	 end	  
	 
	 // Usando circuito Combinacional para criar uma saída que possua todos os operadores.
	 // Ao usar o A[31:2] estou fazendo um deslocamento a direita, que é o mesmo que dividir o endereço por 4.
	 assign RD = memory[A[31:2]];

endmodule