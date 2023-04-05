`timescale 1ns / 1ps

module encoder_4x2(X,A);
    input [3:0] X;
    output reg [1:0] A;
    
    always @(X)
    begin
    casex(X)
        4'b0001: A<=2'b00;
        4'b001x: A<=2'b01;
        4'b01xx: A<=2'b10;
        4'b1xxx: A<=2'b11;
        default: A<=2'b00;    
    endcase
    end   
endmodule
