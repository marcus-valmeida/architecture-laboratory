module pc(
	//entradas
	input [31:0] in,
	input clk, rst,
	
	//saidas
	output reg [31:0] pc
);

always @(posedge clk, negedge rst)
	begin
	if(rst == 1'b0)
		begin	
			pc <= 32'd0;
		end 
	else 
		begin
			pc <= in;
		end
	end
		
endmodule