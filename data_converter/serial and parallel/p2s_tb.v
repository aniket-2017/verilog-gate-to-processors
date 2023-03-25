`timescale 1ns / 1ps

module p2s_tb #(parameter width = 8)();
    reg [width-1:0] Parin;
    reg clk,rst,load;
    wire serout;
    
p2s dut(Parin, clk, serout,rst, load);

    initial begin
    clk=0; rst=1; load=0;
    forever #5 clk=~clk; 
    end
    
    initial begin
    #20; rst = 0;
    #20; Parin =8'b10011010; load =1; 
    #20; load =0;      
    end  
endmodule
