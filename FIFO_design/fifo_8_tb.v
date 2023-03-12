`timescale 1ns / 1ps

module _tb_8_bit();
    reg wr_en,rd_en;
    reg [3:0] wr_data;
    reg clk,rst;
    wire empty,full;
    wire [3:0] rd_data;
    wire [2:0] cnt;
    
 fifo_8_1 dut(wr_en,rd_en,clk,wr_data,rd_data,empty,full,rst,cnt);
 
 initial
 
 begin
    clk=0; wr_en = 0; rd_en=0;
    forever #10 clk= ~clk;
 end
 
 initial begin
    rst = 1;
    wr_data = 4'b0000;
    #100;
    
    rst= 0;
    wr_data = 4'b0000;
    repeat(10)
    begin
        wr_en =1; rd_en = 0;  
        #20 wr_data = wr_data + 1;
    end 
       
    wr_en=0; rd_en=0;
    #100
    repeat(5)
    begin 
        wr_en =0; rd_en = 1;  
        #20;
        end
        
    wr_en=0; rd_en=0; 
    end

endmodule
