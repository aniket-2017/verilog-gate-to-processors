module nand_gate(c,a,b); 
    input a,b; 
    output c; 
    assign c = ~(a&b); 
endmodule

module not_gate(f,e); 
    input e; 
    output f; 
    assign f= ~e; 
endmodule

module d_ff_struct(q,qbar,d,clk);
    input d,clk; 
    output q, qbar; 
    
    wire x,y;
    not_gate not1(dbar,d); 
    nand_gate nand1(x,clk,d); 
    nand_gate nand2(y,clk,dbar); 
    nand_gate nand3(qbar,q,y); 
    nand_gate nand4(q,qbar,x); 
endmodule
