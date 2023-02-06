`timescale 1ns / 1ps

module parity_checker_tb;

	// Inputs
	reg a;
	reg b;
	reg c;
	reg d;

	// Outputs
	wire z;

	// Instantiate the Unit Under Test (UUT)
	parity_checker uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.d(d), 
		.z(z)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c = 0;
		d = 0;

		// Wait 100 ns for global reset to finish
		#100;
   end   
		// Add stimulus here
		always 
			#400 a=!a;
		always
			#200 b=!b;
		always
			#100 c=!c;
		always
			#50  d=!d;      
endmodule

