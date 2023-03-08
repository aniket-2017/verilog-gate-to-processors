`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   00:10:10 01/26/2023
// Design Name:   fsm_seq_dec
// Module Name:   D:/NITR data/VLSI preparation/Xilinx/fsm000/fsm_seq_tb.v
// Project Name:  fsm000
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: fsm_seq_dec
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module fsm_seq_tb;

	// Inputs
	reg clk;
	reg rst;
	reg inp;

	// Outputs
	wire outp;

	// Instantiate the Unit Under Test (UUT)
	fsm_seq_dec uut (
		.clk(clk), 
		.rst(rst), 
		.inp(inp), 
		.outp(outp)
	);
	
	initial 
	begin
			forever 
			 #100 clk =~ clk;
	end
	initial begin
		// Initialize Inputs
		clk = 0;
		rst = 1;
		inp = 1;

		// Wait 100 ns for global reset to finish

		#100 inp= 0;
		#100 rst= 0;
		// Add stimulus here

	end
      
endmodule

