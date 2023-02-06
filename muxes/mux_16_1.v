`timescale 1ns / 1ps

module mux_16_1(
		input din_15,din_14,din_13,din_12,din_11,din_10,din_9,din_8,din_7,
		input din_6,din_5,din_4,din_3,din_2,din_1,din_0,
		input [3:0]sel,
		output Y,
		wire w0,w1,w2,w3
    );
	
	mux_4_1 m1(din_0,din_1,din_2,din_3,sel[1:0],w0);		
	mux_4_1 m2(din_4,din_5,din_6,din_7,sel[1:0],w1);
	mux_4_1 m3(din_8,din_9,din_10,din_11,sel[1:0],w2);
	mux_4_1 m4(din_12,din_13,din_14,din_15,sel[1:0],w3);
	
	mux_4_1 m5(w0,w1,w2,w3,sel[3:2],Y);
	
endmodule
