`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company  : IVSoftware.com
// Engineer : Tom Gregor 
// EMail    : tgregor@ivsoftware.com
// 
// Create Date:    09:05:23 10/21/2016 
// Design Name: Blink
// Module Name:    top 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: "Hello World" style introduction to counting.
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: Welcome to Verilog.
//
//////////////////////////////////////////////////////////////////////////////////
module top(
    input CLK50MHz,
    output LED0,
    output LED1,
    output LED2,
    output LED3,
    output LED4,
    output LED5,
    output LED6,
    output LED7
    );

  
  // First slow the 50 MHz clock down to 
  // something we can see with the eye.
  
  // +++++++++++++++++++++++++++++++++++
  // (Function) A register, unlike a "wire", is something that stores a state when you clock it.
  // (Style) We can append '_r' to remind ourselves that this signal is a register  
  reg [22:0] clk_div_r = 0;             
  // +++++++++++++++++++++++++++++++++++
  
  // Using <= to clock a value into a register
  always @ (posedge CLK50MHz) begin   // "On the rising edge of the clock..."
    clk_div_r <= clk_div_r +1;        // "...insert the value on the right into the register on the left" 
  end 
  
  // +++++++++++++++++++++++++++++++++++
  // (Function) We want to place our derived clock on a Global Buffer, an internal bus capable of driving more gates.
  // (Style) we can append '_g' to a signal that is routed on a Global Buffer.
  // (Note) There are more sophisticated ways of managing clocks than this. The simple approach works here.
  wire clk_visible_g;                 
  BUFG i_clk_buffer( .I(clk_div_r[22]), .O(clk_visible_g));
  // +++++++++++++++++++++++++++++++++++
  
  
  // +++++++++++++++++++++++++++++++++++
  // Using the slower, "visible" clock
  // display a count on the 8 single LEDs
  // using an 8-bit register capable of 
  // holding 256 (decimal) values from 0 to 255.
  // (Note 1) These values could be denoted in 
  //          hexadecimal notation as h'00 to h'FF
  // (Note 2) The best practice for expressing any
  //          numeric value is to specify the number
  //          of bits in the expression. So the final
  //          hexadecimal values are from 8'h00 to 8'hFF
  reg [7:0] led_r = 0;  
  always @ (posedge clk_visible_g) begin
    led_r <= led_r +1;
  end 
  // +++++++++++++++++++++++++++++++++++
  
  
  // +++++++++++++++++++++++++++++++++++
  // Use a normal equals sign to assign individual bits to the output ports.
  // The ucf or "User Constraints File" will tell the FPGA which pins we
  // want the signals to come of in the "real world" outside the FPGA.
  assign LED0 = led_r[0]; // For example, we specify that the signal LED0 comes out on pin "C11"
  assign LED1 = led_r[1];
  assign LED2 = led_r[2];
  assign LED3 = led_r[3];
  assign LED4 = led_r[4];
  assign LED5 = led_r[5];
  assign LED6 = led_r[6];
  assign LED7 = led_r[7];
  
  
endmodule
