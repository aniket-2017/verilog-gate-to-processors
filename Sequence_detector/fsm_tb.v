`timescale 1ns / 1ps

module fsm_tb();
    reg clk,rst,inp; // definig the reg and wires
    wire outp;
    wire [2:0] state;
    
fsm_2 dut(clk,rst,inp,outp,state); // initializing the DUT
 
initial
begin
    rst =1; // initial reset the circuit
    clk =0;
    forever 
    #5 clk=~clk; // give clock input
end

initial 
begin
    #10 rst = 0;
    repeat(100)
        begin
            #10 inp = $random; // give random binary sequence as input
        end
end
endmodule
