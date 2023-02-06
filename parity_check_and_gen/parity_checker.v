`timescale 1ns / 1ps

module parity_checker(a,b,c,d,z);
		input a,b,c,d;
		output z;
		wire w1,w2;
		
		xor_2 g1(a,b,w1);
		xor_2 g2(c,d,w2);
		xor_2 g3(w1,w2,z);

endmodule

module xor_2(x,y,z);
	input x,y;
	output z;
	assign z = ~x&y | x&~y;
	
endmodule