//-----------------------------------------------
// NOMBRE DEL MODULO: TB_clkdivider.sv
// DESCRIPCION: Este modulo es el test bench para clkDivider.sv
// ENTRADAS: clk (Reloj inicial) reset (reinicio del programa)
// SALIDAS:  clk_out (Reloj de salida)
// VERSION:  1.0
// AUTORES:  Andrés Hernandez, Carem Bernabe
// FECHA:    18 / 02 / 19
//----------------------------------------------

`include "clkDivider.sv"

module tbench_top;
  // Input signals
  bit clk;
  bit reset;

  // Output signal
  wire clk_out;
  
  // Clock generation
  always #5 clk = ~clk;

  // Reset Generation
  initial begin
    reset = 1;
    #5 reset =0;
  end

  //clkDivider instance
  clkDivider CD (
   .i_reset(reset),
   .i_clk_FPGA(clk),
  
   .o_clk(clk_out)
  );
  
  //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule