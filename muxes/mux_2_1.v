`timescale 1ns / 1ps

module mux_2_1( input a, input b, input s,output y);

	assign y=(s)?a:b;

endmodule
