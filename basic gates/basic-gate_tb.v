`timescale 1ns / 1ps
module basic_gate_tb();

	// Inputs
	reg a;
	reg b;

	// Outputs
	wire g1;
	wire g2;
	wire g3;
	wire g4;
	wire g5;

	// Instantiate the Unit Under Test (UUT)
	or_and_not uut (.a(a),.b(b),.g1(g1),.g2(g2),.g3(g3),.g4(g4),.g5(g5));

	initial begin
		// Initialize Inputs
		a = 0;
		b = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		 #100 a=0; b=1;
		 #100 a=1; b=0;
		 #100 a=1; b=1;

	end
      
endmodule

