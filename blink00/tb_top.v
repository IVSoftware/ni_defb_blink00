`timescale 1ns / 1ns

////////////////////////////////////////////////////////////////////////////////
// Company  : IVSoftware.com
// Engineer : Tom Gregor 
// EMail    : tgregor@ivsoftware.com
//
// Create Date:   10:20:00 10/21/2016
// Design Name:   top
// Module Name:   C:/Users/gregor/Downloads/National Instruments/NI Digital Electronics FPGA Board/blink00/tb_top.v
// Project Name:  blink00
// Target Device:  
// Tool versions:  
// Description:   Test Bench displays blink in ISim 
//
// Verilog Test Fixture created by ISE for module: top
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module tb_top;

	// Inputs
	reg CLK50MHz;

	// Outputs
	wire LED0;
	wire LED1;
	wire LED2;
	wire LED3;
	wire LED4;
	wire LED5;
	wire LED6;
	wire LED7;

	// Instantiate the Unit Under Test (UUT)
	top uut (
		.CLK50MHz(CLK50MHz), 
		.LED0(LED0), 
		.LED1(LED1), 
		.LED2(LED2), 
		.LED3(LED3), 
		.LED4(LED4), 
		.LED5(LED5), 
		.LED6(LED6), 
		.LED7(LED7)
	);

	initial begin
		// Initialize Inputs
		CLK50MHz = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
    forever begin
      #10 CLK50MHz = ~CLK50MHz;
    end
	end
      
endmodule

