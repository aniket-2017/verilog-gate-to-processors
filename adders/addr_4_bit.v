`timescale 1ns / 1ps

module addr_4_bit(
		input [3:0]A,
		input [3:0]B,
		input cin,
		output [3:0]s,
		output cout
    );
		wire [3:1]c;
		
	fa1 f1(A[0],B[0],cin,s[0],c[1]);
	fa1 f2(A[1],B[1],c[1],s[1],c[2]);
	fa1 f3(A[2],B[2],c[2],s[2],c[3]);
	fa1 f4(A[3],B[3],c[3],s[3],cout);
	
endmodule
