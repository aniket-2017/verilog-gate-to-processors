`timescale 1ns / 1ps

module slow_clk(
    input clk_in,
    output reg clk_out
    );
    
  reg [27:0] count;  // counter to count upto 200000000
    always@(posedge clk_in)
    begin
        count <= count +1; // increase counter
        if(count == 200000000)
            begin
            clk_out =~clk_out; //output clk transition
            count <= 0; //empty out count
            end
        end
endmodule
