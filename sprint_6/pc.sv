module pc(
	//entradas
	input clk, rst
	
	//saidas
	output reg [2:0] pc
);

always @(negedge clk, posedge rst)
	begin
	if(rst == 1b'1)
		begin	
			pc <= 2'b00;
		end 
	else begin
			pc <= pc + 3'h4;
		end
		
	end
		
endmodule