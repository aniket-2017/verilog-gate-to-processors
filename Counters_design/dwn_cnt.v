`timescale 1ns / 1ps
module up_dn_rst(
    input rst, // reset input
    input clk, up_dn, // clock and up_down signal
    output reg [2:0] cnt // count output
    );
    
    always@(posedge clk)
    begin
        if(rst | cnt == 3'b111) // reset counter if rst==0 or count = 111
            cnt <= 3'b000;
        else if(up_dn)  // up counter
            cnt <= cnt + 3'b001; 
        else if(~up_dn) // down counter
            cnt <= cnt - 3'b001;  
        end
endmodule
