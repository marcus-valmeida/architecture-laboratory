
module ControlUnit(
  //entradas
  input [6:0] OP, Funct7,
  input [2:0] Funct3,
  //saídas
  output reg [1:0]ImmSrc,
  output reg [2:0]ULAControl,
  output reg ULASrc, RegWrite, MemWrite, ResultSrc, Branch
);
  
  always @(*)
    begin
      casez({OP,Funct3,Funct7})
			//tipo R
        17'b0110011_000_0000000: begin RegWrite = 1'b1; ImmSrc = 2'b??; ULASrc = 1'b0; ULAControl = 3'b000; MemWrite = 1'b0; ResultSrc = 1'b0; Branch = 1'b0; end // ADD
        17'b0110011_000_0100000: begin RegWrite = 1'b1; ImmSrc = 2'b??; ULASrc = 1'b0; ULAControl = 3'b001; MemWrite = 1'b0; ResultSrc = 1'b0; Branch = 1'b0; end // SUB
        17'b0110011_111_0000000: begin RegWrite = 1'b1; ImmSrc = 2'b??; ULASrc = 1'b0; ULAControl = 3'b010; MemWrite = 1'b0; ResultSrc = 1'b0; Branch = 1'b0; end // AND
        17'b0110011_110_0000000: begin RegWrite = 1'b1; ImmSrc = 2'b??; ULASrc = 1'b0; ULAControl = 3'b011; MemWrite = 1'b0; ResultSrc = 1'b0; Branch = 1'b0; end // OR
        17'b0110011_010_0000000: begin RegWrite = 1'b1; ImmSrc = 2'b??; ULASrc = 1'b0; ULAControl = 3'b101; MemWrite = 1'b0; ResultSrc = 1'b0; Branch = 1'b0; end // SLT
		  //tipo I
        17'b0010011_000_???????: begin RegWrite = 1'b1; ImmSrc = 2'b00; ULASrc = 1'b1; ULAControl = 3'b000; MemWrite = 1'b0; ResultSrc = 0; Branch = 1'b0; end // ADDi
		  17'b0000011_010_???????: begin RegWrite = 1'b1; ImmSrc = 2'b00; ULASrc = 1'b1; ULAControl = 3'b000; MemWrite = 1'b0; ResultSrc = 1; Branch = 1'b0; end // LW
		  //tipo S
		  17'b0100011_010_???????: begin RegWrite = 1'b0; ImmSrc = 2'b01; ULASrc = 1'b1; ULAControl = 3'b000; MemWrite = 1'b1; ResultSrc = 1'b?; Branch = 1'b0; end // SW
		  //tipo B
		  17'b1100011_000_???????: begin RegWrite = 1'b0; ImmSrc = 2'b10; ULASrc = 1'b0; ULAControl = 3'b001; MemWrite = 1'b0; ResultSrc = 1'b?; Branch = 1'b1; end // BEQ
        //default: begin RegWrite = 1; ImmSrc = 1'b?; ULASrc = 0; ULAControl = 3'b000; MemWrite = 0; ResultSrc = 0; end // ADD
        
      endcase
    end 
    
    
    endmodule
	 