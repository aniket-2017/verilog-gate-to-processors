`timescale 1ns / 1ps

module tb_encode();
    reg [3:0] X;
    wire [1:0] A;
    
    encoder_4x2 dut(X,A);
    
    initial 
    begin
    #20 X = 4'b0001;
    #20 X = 4'b1001;
    #20 X = 4'b0101;
    #20 X = 4'b1001;
    #20;
    
    end
endmodule
