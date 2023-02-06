`timescale 1ns / 1ps

module or_and_not(a,b,g1,g2,g3,g4,g5);
    input a,b;
    output g1,g2,g3,g4,g5;
	 
assign g1 = a | b;
assign g2 = a & b;
assign g3 = ~a&~b | a&b;
assign g4 = ~(a & b);
assign g5 = ~a&b | a&~b ;

endmodule
