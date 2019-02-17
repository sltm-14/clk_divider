module clkDivider
#(
	parameter FRECUENCY_IN = 20,
	parameter FRECUENCY_OUT = 5
)
(
	input i_reset,
	input i_clk,
	
	output logic  o_frequency
);
	logic [31:0]counter = 0;
	localparam CONST = (FRECUENCY_IN/FRECUENCY_OUT)/2;

	always@(posedge i_clk, posedge i_reset)
	begin
		if(i_reset == 1'b1)
		begin
			o_frequency <= 0;
			counter <= 0;
		end
		else if(counter == (CONST - 1'b1))
		begin
			o_frequency <= ~o_frequency;
			counter <= 0;
		end
		else
		begin
			counter <= counter + 1'b1;
			o_frequency <= o_frequency;
		end
	end
	
endmodule