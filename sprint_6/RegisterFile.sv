module RegisterFile(
	//entrada 
	input [4:0] wa3,ra1,ra2,
	input we3,clk,rst,
	input [31:0] wd3,
	//saidas 
	output [31:0] rd1, rd2,
	output [31:0] x0, x1, x2, x3, x4, x5, x6, x7

);
reg [31:0] registradores [31:0];

 
always @(posedge clk,negedge rst)
	begin
		
		if(rst == 1'b0)
		begin
			
			integer i;
			for(i = 0; i < 32; i = i+1)
				registradores[i] <= 32'd0;
			
		end
		
		else if(wa3!= 5'd0 &&  we3!=1'd0)
		
			begin
			
			registradores[wa3] <= wd3;
			
			end
		
	
	end
	assign rd1 = (ra1 == 5'd0) ? 32'd0: registradores[ra1];
	assign rd2 = (ra2 == 5'd0) ? 32'd0: registradores[ra2];
	
	 // saídas para debug
    assign x0 = registradores[0][7:0];
    assign x1 = registradores[1][7:0];
    assign x2 = registradores[2][7:0];
    assign x3 = registradores[3][7:0];
    assign x4 = registradores[4][7:0];
    assign x5 = registradores[5][7:0];
    assign x6 = registradores[6][7:0];
    assign x7 = registradores[7][7:0];



endmodule


