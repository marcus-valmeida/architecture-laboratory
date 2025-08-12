
module ControlUnit(
  //entradas
  input [6:0] OP, Funct7,
  input [2:0] Funct3,
  //saídas
  output reg [2:0]ULAControl,
  output reg ULASrc, RegWrite
);
  
  always @(*)
    begin
      casez({OP,Funct3,Funct7})
        17'b0110011_000_0000000: begin RegWrite = 1; ULASrc = 0; ULAControl = 3'b000; end // ADD
        17'b0110011_000_0100000: begin RegWrite = 1; ULASrc = 0; ULAControl = 3'b001; end // SUB
        17'b0110011_111_0000000: begin RegWrite = 1; ULASrc = 0; ULAControl = 3'b010; end // AND
        17'b0110011_110_0000000: begin RegWrite = 1; ULASrc = 0; ULAControl = 3'b011; end // OR
        17'b0110011_010_0000000: begin RegWrite = 1; ULASrc = 0; ULAControl = 3'b101; end // SLT
        17'b0010011_000_???????: begin RegWrite = 1; ULASrc = 1; ULAControl = 3'b000; end // ADDi
        default: begin RegWrite = 1; ULASrc = 0; ULAControl = 3'b000; end // ADD
        
      endcase
    end 
    
    
    endmodule
	 