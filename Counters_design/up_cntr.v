`timescale 1ns / 1ps

module up_cntr(
    input rst,
    input clk,
    output reg [2:0] cnt
    );
    
    always@(posedge clk)
    begin
        if(rst)
            cnt <= 3'b000;
        else
            cnt <= cnt + 3'b001;    
        end
endmodule
