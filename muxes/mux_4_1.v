`timescale 1ns / 1ps
module mux_4_1(
	 input d_0,d_1,d_2,d_3,
	 input [1:0]s,
	 output reg y
    );
	
	always @(d_0,d_1,d_2,d_3,s)
		case(s)
		2'b00:  y=d_0;
		2'b01:  y=d_1;
		2'b10:  y=d_2;
		2'b11:  y=d_3;
		endcase

endmodule
