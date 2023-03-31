`timescale 1ns / 1ps

module up_cntr_d(clk,rst,Q);
    input clk, rst;
    output [3:0] Q;
    
    wire [3:0] q;
    
    d_ff D1(clk,~q[0],rst,q[0]);      // instantiating D FF modules
    d_ff D2(~q[0],~q[1],rst,q[1]);
    d_ff D3(~q[1],~q[2],rst,q[2]);
    d_ff D4(~q[2],~q[3],rst,q[3]);
    
    assign Q = {q[3],q[2],q[1],q[0]};     // assigning the final output to Q
    
endmodule

module d_ff(      // defining d flip flop module
    input clk,    // Clock input
    input D,      // D input
    input rst,    // Reset input
    output reg Q  // Q output
    );
    
    always @(posedge clk or negedge rst) // always check at postive edge of clock or negative egde of reset
    begin
        if(rst)
            Q <= 1'b0;      // reset output to 0
        else
            Q <= D;         // set output Q as D
    end
endmodule
