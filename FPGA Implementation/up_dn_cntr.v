`timescale 1ns / 1ps

module up_dwn_cntr(
    input rst, // reset input
    input clk,  // input clock from FPGA
    input up_dn, // input for up down 
    output reg [2:0] cnt
    );
    
    wire slow_clk; // slow clk given to counter
    
  slow_clk U1(clk,slow_clk); // calling slow clock module to reduce the frequency
    
  always@(posedge slow_clk)  // for every positive transition of slow clk
    begin
        if(rst)
            cnt <= 3'b000;
        else if(up_dn)
            cnt <= cnt + 3'b001; 
        else if(~up_dn)
            cnt <= cnt - 3'b001;  
        end
endmodule
