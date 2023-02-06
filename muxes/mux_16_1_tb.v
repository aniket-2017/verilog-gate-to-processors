`timescale 1ns / 1ps

module mux_16_1_tb;

	// Inputs
	reg din_15;
	reg din_14;
	reg din_13;
	reg din_12;
	reg din_11;
	reg din_10;
	reg din_9;
	reg din_8;
	reg din_7;
	reg din_6;
	reg din_5;
	reg din_4;
	reg din_3;
	reg din_2;
	reg din_1;
	reg din_0;
	reg [3:0] sel;

	// Outputs
	wire Y;

	// Instantiate the Unit Under Test (UUT)
	mux_16_1 uut (
		.din_15(din_15), 
		.din_14(din_14), 
		.din_13(din_13), 
		.din_12(din_12), 
		.din_11(din_11), 
		.din_10(din_10), 
		.din_9(din_9), 
		.din_8(din_8), 
		.din_7(din_7), 
		.din_6(din_6), 
		.din_5(din_5), 
		.din_4(din_4), 
		.din_3(din_3), 
		.din_2(din_2), 
		.din_1(din_1), 
		.din_0(din_0), 
		.sel(sel), 
		.Y(Y)
	);

	initial begin
		// Initialize Inputs
		din_15 = 0;
		din_14 = 0;
		din_13 = 0;
		din_12 = 1;
		din_11 = 0;
		din_10 = 1;
		din_9 = 0;
		din_8 = 0;
		din_7 = 1;
		din_6 = 0;
		din_5 = 1;
		din_4 = 0;
		din_3 = 0;
		din_2 = 1;
		din_1 = 0;
		din_0 = 1;
		sel = 0;

		// Wait 100 ns for global reset to finish
		#100;
        
		// Add stimulus here
		sel=4'b0000;
		repeat(15)
		#100 sel = sel + 4'b0001;

	end
      
endmodule

