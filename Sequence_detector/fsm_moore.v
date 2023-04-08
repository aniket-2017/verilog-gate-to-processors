`timescale 1ns / 1ps
//moore state machine sequence detector for 11010 sequence
module fsm_2(clk,rst,inp,outp,state,count);
   input clk, rst, inp; // inputs for fsm
   output outp;  // output
   output [2:0] state; // states of fsm
   output [2:0] count;
   
     reg [2:0] count =0;
	 reg [2:0] state;
	 reg outp;
	 
	 always @(posedge clk, posedge rst)   // detects 11010 sequence using 5 state fsm machine
		begin
		
		if(rst) begin //if rst=1 then initial state is 000
			state<=3'b000;
			end
		
		else
		begin
			case(state) // if rst=0, check the input sequence
			
			3'b000:
			begin 
			if(inp)begin
			     state<=3'b001; //change to next state
			     end
			else begin
			     state<=3'b000;
			     end
			end
			
			3'b001:
			begin 
			if(inp)begin
			     state<=3'b010; //change to next state
			     end
			else begin
			     state<=3'b000;
			     end
			end
            
            3'b010:
			begin 
			if(~inp)begin
			     state<=3'b011; //change to next state
			     end
			else begin
			     state<=3'b001;
			     end
			end
			
			3'b011:
			begin 
			if(inp)begin
			     state<=3'b100; //change to next state
			     end
			else begin
			     state<=3'b000;
			     end
			end
			
			3'b100:
			begin 
			if(inp)begin
			     state<=3'b001;
			     end
			else begin
			     state<=3'b101;
			     end
			end
			
			3'b101:
			begin
			     state<=3'b000; //change to next state
			end
			
			default:
				begin
				state<=3'b000;
				end
			endcase
		end
	end
	
	always @(state)
         begin
             if(rst) begin
                 outp <= 0; // is rst = 1 output is 0
             end
             else if (state == 3'b101) begin //if fsm reaches the last state output is 1
                 outp <= 1;
             end
             else begin
                 outp <= 0; // else output is 0
             end
         end
    
    always@(posedge clk)
    begin
        if(outp)
            count<= count+1;
    end
endmodule
