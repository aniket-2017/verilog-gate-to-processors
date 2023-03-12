`timescale 1ns / 1ps
//mealy state machine sequence detector for 11010 sequence
module fsm_1(clk,rst,inp,outp,state);
   input clk, rst, inp;  //inputs to seq detector
   output outp;             // outpur
   output [2:0] state;      // States
	
	 reg [2:0] state;
	 reg outp;
	 
	 always @(posedge clk, posedge rst)   // detects 11010 sequence using 5 state fsm machine
		begin
		
		if(rst) begin         // is rst =1
			state<=3'b000;   // Set to initial State A
			outp<=0;
			end
		
		else
		begin
			case(state)
			
			3'b000:      // State A
			begin 
			if(inp)begin
			     state<=3'b001;
			     outp<=0;
			     end
			else begin
			     state<=3'b000;
			     outp<=0;
			     end
			end
			
			3'b001:      // State B
			begin 
			if(inp)begin
			     state<=3'b010;
			     outp<=0;
			     end
			else begin
			     state<=3'b000;
			     outp<=0;
			     end
			end
            
            3'b010:       // State C
			begin 
			if(~inp)begin
			     state<=3'b011;
			     outp<=0;
			     end
			else begin
			     state<=3'b001;
			     outp<=0;
			     end
			end
			
			3'b011:      // State D
			begin 
			if(inp)begin
			     state<=3'b100;
			     outp<=0;
			     end
			else begin
			     state<=3'b000;
			     outp<=0;
			     end
			end
			
			3'b100:      // State E
			begin 
			if(inp)begin
			     state<=3'b001;
			     outp<=0;
			     end
			else begin
			     state<=3'b000;
			     outp<=1;     // outpur is 1 When fsm reaches last state
			     end
			end
			
			default:    // Default state
				begin
				state<=3'b000;
				outp<=0;
				end
			endcase
		end
	end
endmodule
