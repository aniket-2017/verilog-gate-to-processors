`timescale 1ns / 1ps

module s2p_tb #(parameter width = 8)();
    reg serin;
    reg clk,rst,load;
    wire [width-1:0] parout;
    
s2p dut(serin, clk, parout,rst, load);

    initial begin
    clk=0; rst=1; load=0; serin=0;
    forever #10 clk=~clk; 
    end
  
    initial begin
    #20 rst = 0;
    #20 load =1; 
    #20 serin =1;
    #20 serin=0;
    #20 serin =1;
    #20 serin=0;
    #20 serin =1;
    #20 serin=1;
    #20 serin =1;
    #20 serin=0; #20 load =0; #20 rst=1;    
    end
endmodule
