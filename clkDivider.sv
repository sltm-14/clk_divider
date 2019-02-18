//-----------------------------------------------
// NOMBRE DEL MODULO: clkDivider.sv
// DESCRIPCION: Implementeacion de divisor de frecuencia
// ENTRADAS: i_clk_FPGA (Reloj inicial) reset (reinicio del programa)
// SALIDAS:  o_clk (Reloj de salida)
// VERSION:  1.0
// AUTORES:  Andrés Hernandez, Carem Bernabe
// FECHA:    18 / 02 / 19
//----------------------------------------------

module clkDivider
#(
	parameter FRECUENCY_IN  = 20,
	parameter FRECUENCY_OUT = 5
)
(
	// Input signals
	input i_reset, 
	input i_clk_FPGA,
	
	// Output signal
	output logic  o_clk
);
	
	logic [31:0]counter = 0; // Frequency counter
	localparam CONST    = (FRECUENCY_IN/FRECUENCY_OUT)/2; // Counter limit

	always@(posedge i_clk_FPGA, posedge i_reset)
	begin
		if(i_reset == 1'b1) // Reset counter
		begin
			o_clk   <= 0;
			counter <= 0;
		end
		else if(counter == (CONST - 1'b1)) // If counter gets to the limit
		begin
			o_clk   <= ~o_clk; // o_clk suffles its state
			counter <= 0;      // counter is set to 0
		end
		else
		begin
			counter <= counter + 1'b1; //add one to counter
			o_clk   <= o_clk;		   //o_clk keeps its value
		end
	end
	
endmodule