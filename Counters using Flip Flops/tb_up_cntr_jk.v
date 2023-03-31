`timescale 1ns / 1ps

module test_dff();
    reg clk,rst;
    wire [2:0] Q;
    
up_cntr_jk dut(clk,rst,Q);

    initial begin
        clk = 0;
        forever #5 clk=~clk;        
    end
    
    initial begin
        rst = 1; // initial reset all D flip flops
        repeat(5) @(posedge clk);
        rst = 0;
        repeat(25) @(posedge clk);  // repeat at every positive edge
        #100 rst = 1; #40
        $finish;          
        
    end
endmodule
