`timescale 1ns / 1ps

module s2p #(parameter width = 8)(serin, clk, parout,rst, load);

 input wire serin; //input serial data
 input rst; // reset pin
 input clk; // clock input
 output reg [width-1:0] parout;  // parallel output data
 input load;  // load input
 reg [width-1:0] bufferreg; // buffer register
 
always@(posedge clk)
begin
      if(rst == 1)  //if reset than parallel output is 0
           begin
               bufferreg = 0;
           end
       else if(load) //if load=1 store serial data in buffer register
           begin
               bufferreg <= {bufferreg[width-2:0],serin}; //append serial input bit to MSB of buffer register
           end
       else if(load ==0)
           parout<= bufferreg; //assign buffer register to parallel output  
end
endmodule
