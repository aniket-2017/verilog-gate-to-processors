`timescale 1ns / 1ps

module ha1(x,y,s,c);
		input x,y;
		output s,c;
	
		assign c= x&y;
		xor1 g1(x,y,s);

endmodule

module xor1(a,b,c);
	input a,b;
	output c;
	assign c= ~a&b | a&~b;
	
endmodule
