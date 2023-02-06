`timescale 1ns / 1ps

module fa1(x,y,z,s,c);
    input x,y,z;
	 output s,c;
	 wire [3:0]w;
	 
	 ha1 h1(x,y,w[0],w[1]);
	 ha1 h2(w[0],z,s,w[2]);
	 
	 assign c = w[2]|w[1];
endmodule
