//-------------------------------------------------------------------------
//				www.verificationguide.com   testbench.sv
//-------------------------------------------------------------------------
//tbench_top or testbench top, this is the top most file, in which DUT(Design Under Test) and Verification environment are connected. 
//-------------------------------------------------------------------------

//including interfcae and testcase files
`include "clkDivider.sv"


module tbench_top;
  
  //clock and reset signal declaration
  bit clk;
  bit reset;

  wire clk_out;
  
  //clock generation
  always #5 clk = ~clk;
  
  //reset Generation
  initial begin
    reset = 1;
    #5 reset =0;
  end
  
  
  
  //DUT instance, interface signals are connected to the DUT ports
  clkDivider CD (
   .i_reset(reset),
   .i_clk(clk),
  
   .o_frequency(clk_out)
);
  
  //enabling the wave dump
  initial begin 
    $dumpfile("dump.vcd"); $dumpvars;
  end
endmodule