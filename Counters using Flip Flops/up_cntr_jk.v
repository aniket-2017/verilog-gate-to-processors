`timescale 1ns / 1ps

module up_cntr_jk(clk,rst,Q);
    input clk,rst;
    output [2:0] Q;
    
    wire [2:0] q;
    
    jk_ff jk1(1,1,clk,rst,q[0]);
    jk_ff jk2(1,1,~q[0],rst,q[1]);
    jk_ff jk3(1,1,~q[1],rst,q[2]);
    
    assign Q = {q[2],q[1],q[0]};
endmodule

module jk_ff(J,K,clk,rst,Q);
    input J,K,clk,rst;
    output Q;
    wire w;
     
    assign w = (J&~Q)|(~K&Q);
    d_ff dff1(clk,w,rst,Q);
    
endmodule

module d_ff(
    input clk,
    input D,
    input rst,
    output reg Q 
    );
    
    always @(posedge clk or negedge rst)
    begin
        if(rst)
            Q = 1'b0;
        else
            Q = D;     
    end
endmodule
