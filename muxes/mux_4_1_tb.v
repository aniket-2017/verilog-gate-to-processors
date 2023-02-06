`timescale 1ns / 1ps

module mux_4_1_tb;

	// Inputs
	reg d_0;
	reg d_1;
	reg d_2;
	reg d_3;
	reg [1:0] s;

	// Outputs
	wire y;

	// Instantiate the Unit Under Test (UUT)
	mux_4_1 uut (
		.d_0(d_0), 
		.d_1(d_1), 
		.d_2(d_2), 
		.d_3(d_3), 
		.s(s), 
		.y(y)
	);

	initial begin
		// Initialize Inputs
		d_0 = 1;
		d_1 = 0;
		d_2 = 1;
		d_3 = 0;
		s = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		s= 2'b00;
		repeat(3)
		#100 s=s+2'b01;

	end
      
endmodule

