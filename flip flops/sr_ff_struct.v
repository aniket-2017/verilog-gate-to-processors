`timescale 1ns / 1ps

module sr_ff_struct(q, qbar, s, r, clk);
    input s,r,clk; 
    output q, qbar;

    wire nand1_out; // output of nand1 
    wire nand2_out; // output of nand2 
    
    nand (nand1_out,clk,s); 
    nand (nand2_out,clk,r); 
    nand (q,nand1_out,qbar);
    nand (qbar,nand2_out,q);

endmodule
