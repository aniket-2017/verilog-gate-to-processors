`timescale 1ns / 1ps

module p2s #(parameter width = 8)(Parin, clk, serout,rst, load);

 input[width-1:0] Parin; //input parallel data
 wire[width-1:0] Parin;
 input rst; // reset pin
 input clk; // clock input
 output reg serout;  // serial output data
 input load;  // load input
 reg [width-1:0] bufferreg; 
 
always@(posedge clk)
begin
      if(rst == 1)  //if reset than serial output is 0
           begin
               bufferreg = 0;
               serout =0;
           end
       else if(load) //if load=1 store parallel data in buffer register
            bufferreg<=Parin;

       else 
           begin
              serout <= bufferreg[width-1];
              bufferreg <= (bufferreg<<1); //left shift the contents of buffer register
           end
end
endmodule
