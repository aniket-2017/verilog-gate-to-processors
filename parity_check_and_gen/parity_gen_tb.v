`timescale 1ns / 1ps

module parity_gen_tb;

	// Inputs
	reg a;
	reg b;
	reg c;

	// Outputs
	wire p;

	// Instantiate the Unit Under Test (UUT)
	parity_gen uut (
		.a(a), 
		.b(b), 
		.c(c), 
		.p(p)
	);

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;
		c = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		a=0; b=0; c=0; #100
		a=0; b=0; c=1; #100
		a=0; b=1; c=0; #100
		a=0; b=1; c=1; #100
		a=1; b=0; c=0; #100
		a=1; b=0; c=1; #100
		a=1; b=1; c=0; #100
		a=1; b=1; c=1; 

	end
      
endmodule

