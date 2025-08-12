module clock_50hz_para_1hz(
	input  wire clk_in, //entrada 50Mhz
   input  wire rst,
   output reg  clk_out //saida 1hz
);

    localparam integer MAX_COUNT = 24_999_999;
    reg [24:0] counter; 

    always @(posedge clk_in or posedge rst) begin
        if (rst == 1) 
		  begin
            counter <= 0;
            clk_out <= 0;
        end 
		  else if (counter == MAX_COUNT) 
		  begin
            counter <= 0;
            clk_out <= ~clk_out;
        end 
		  else begin
            counter <= counter + 1;
        end
    end
endmodule
