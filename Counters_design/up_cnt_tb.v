`timescale 1ns / 1ps

module cntr_tb();
    reg rst, clk, up_dn;
    wire [2:0] cnt;
    
up_dn_rst dut(.rst(rst), .clk(clk),.up_dn(up_dn),.load(load), .cnt(cnt));
initial
    begin
    clk = 0;
    forever  #10 clk = ~clk; 
    end
    
    initial
    begin
    rst = 1; #20
    rst = 0; 
    up_dn= 1;
    #100 up_dn= 0;
    #85 up_dn= 1; 
    #33 rst = 1;
    end
endmodule
