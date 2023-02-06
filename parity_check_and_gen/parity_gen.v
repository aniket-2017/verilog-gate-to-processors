`timescale 1ns / 1ps

module parity_gen(a,b,c,p);
    input a,b,c;
	 output p;
	 wire w1;
	 
	 xor_1 g1(a,b,w1);
	 xor_1 g2(c,w1,p);
	 
endmodule

module xor_1(x,y,z);
	input x,y;
	output z;
	assign z = ~x&y | x&~y;
	
endmodule
