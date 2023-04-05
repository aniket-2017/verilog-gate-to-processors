`timescale 1ns / 1ps

module multiply_2bit(
    input [1:0] op1,op2,
    output [3:0] P
    );
    wire w1,w2,w3,w4;
    
    assign P[0] = op1[0]&op2[0];
    assign w1 = op1[0]&op2[1];
    assign w2 = op2[0]&op1[1];
    assign w3 = op1[1]&op2[1];
    HA h1(w1,w2,P[1],w4);
    HA h2(w3,w4,P[2],P[3]);
    
endmodule

module HA(a,b,s,c);
    input a,b;
    output s,c;
    
    assign s = a^b;
    assign c = a&b;
    
endmodule
