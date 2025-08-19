module clock_50(
	input  wire clk_in, //entrada 50Mhz
   
   output reg  clk_out //saida 1hz
);

    localparam integer MAX_COUNT = 24_999_999;
    reg [24:0] counter; 

    always @(posedge clk_in) begin
         
		  if (counter == MAX_COUNT) 
		  begin
            counter <= 0;
            clk_out <= ~clk_out;
        end 
		  else begin
            counter <= counter + 1;
        end
    end
endmodule
