`timescale 1ns / 1ps

module up_dwn_cntr(
    output reg clk_cnt,
    output reg [27:0] cc,
    input rst,
    input clk,
    input up_dn,
    output reg [2:0] cnt
    );
    
    always @(posedge clk)
    begin
        cc <= cc + 28'd1;
        if(cc == 200000000)
            clk_cnt =~ clk_cnt ;
        end
    
    always@(posedge clk_cnt, posedge rst)
    begin
        if(rst | cnt == 3'b111)
            cnt <= 3'b000;
        else if(up_dn)
            cnt <= cnt + 3'b001; 
        else if(~up_dn)
            cnt <= cnt - 3'b001;  
        end
endmodule
