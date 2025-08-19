
module ControlUnit(
  //entradas
  input [6:0] OP, Funct7,
  input [2:0] Funct3,
  //saídas
  output reg [2:0]ULAControl,
  output reg ULASrc, RegWrite, ImmSrc, MemWrite, ResultSrc
);
  
  always @(*)
    begin
      casez({OP,Funct3,Funct7})
			//tipo R
        17'b0110011_000_0000000: begin RegWrite = 1; ImmSrc = 1'b?; ULASrc = 0; ULAControl = 3'b000; MemWrite = 0; ResultSrc = 0; end // ADD
        17'b0110011_000_0100000: begin RegWrite = 1; ImmSrc = 1'b?; ULASrc = 0; ULAControl = 3'b001; MemWrite = 0; ResultSrc = 0;  end // SUB
        17'b0110011_111_0000000: begin RegWrite = 1; ImmSrc = 1'b?; ULASrc = 0; ULAControl = 3'b010; MemWrite = 0; ResultSrc = 0;  end // AND
        17'b0110011_110_0000000: begin RegWrite = 1; ImmSrc = 1'b?; ULASrc = 0; ULAControl = 3'b011; MemWrite = 0; ResultSrc = 0;  end // OR
        17'b0110011_010_0000000: begin RegWrite = 1; ImmSrc = 1'b?; ULASrc = 0; ULAControl = 3'b101; MemWrite = 0; ResultSrc = 0;  end // SLT
		  //tipo I
        17'b0010011_000_???????: begin RegWrite = 1; ImmSrc = 0; ULASrc = 1; ULAControl = 3'b000; MemWrite = 0; ResultSrc = 0;  end // ADDi
		  17'b0000011_010_???????: begin RegWrite = 1; ImmSrc = 0; ULASrc = 1; ULAControl = 3'b000; MemWrite = 0; ResultSrc = 1;  end // LW
		  //tipo S
		  17'b0100011_010_???????: begin RegWrite = 0; ImmSrc = 1; ULASrc = 1; ULAControl = 3'b000; MemWrite = 1; ResultSrc = 1'b?;  end // SW
        default: begin RegWrite = 1; ImmSrc = 1'b?; ULASrc = 0; ULAControl = 3'b000; MemWrite = 0; ResultSrc = 0; end // ADD
        
      endcase
    end 
    
    
    endmodule
	 