`timescale 1ns / 1ps

module addr_4_bit_tb;

	// Inputs
	reg [3:0] A;
	reg [3:0] B;
	reg cin;

	// Outputs
	wire [3:0] s;
	wire cout;

	// Instantiate the Unit Under Test (UUT)
	addr_4_bit uut (
		.A(A), 
		.B(B), 
		.cin(cin), 
		.s(s), 
		.cout(cout)
	);

	initial begin
		// Initialize Inputs
		A = 0;
		B = 0;
		cin = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		#20 A= 4'b1000; B= 4'b1100;
		repeat(10) begin
			#20 A= A + 4'b0001;
		end	
		$finish;
	end
      
endmodule

