`timescale 1ns / 1ps

module tb_multiply();
    reg [1:0] op1,op2;
    wire [3:0] P;
    
    multiply_2bit dut(op1,op2,P);
    initial
    begin
        op1 = 0; op2 = 0;
        #20 op1 = 2'b01; op2 = 2'b00;
        #20 op1 = 2'b01; op2 = 2'b01;
        #20 op1 = 2'b11; op2 = 2'b01;
        #20 op1 = 2'b10; op2 = 2'b10;
        #20
        $finish;
    end
endmodule
