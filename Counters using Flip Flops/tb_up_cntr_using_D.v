`timescale 1ns / 1ps

module test_dff();
    reg clk,rst;
    wire [3:0] Q;
    
up_cntr_d dut(clk,rst,Q);

    initial begin
        clk = 0;
        forever #5 clk=~clk;        
    end
    
    initial begin
        rst = 1; // initial reset all D flip flops
        repeat(5) @(posedge clk);
        rst = 0;
        repeat(25) @(posedge clk);  // repeat at every positive edge
        #100 rst = 1;
        
    end
endmodule
