`timescale 1ns / 1ps

module _tb_8_bit();
     reg     clk;  
     reg     rst;  
     reg     wr;  
     reg     rd;  
     reg     [3:0] data_in;  
     wire     [3:0] data_out;  
     wire     empty;  
     wire     full;
     wire     fifo_th;  
     wire     fifo_of;
     wire     fifo_uf; 
     
fifo_8 dut (data_out,full, empty, fifo_th, fifo_of, fifo_uf,clk, rst, wr, rd, data_in);
 
 initial
     begin 
               rst     = 1'b0;  
               wr     = 1'b0;  
               rd     = 1'b0;  
               data_in     = 4'd0;  
               clk=0; 
            forever #5 clk= ~clk;
     end
     
    initial  
        begin
            rst = 1;
            #100;
            rst =0;
            
    repeat(20) 
        begin
            #20
            wr = 1'b1;  
            data_in = data_in + 8'd1;  
            #50 
            wr = 1'b0;  
        end  
     
     repeat(5)
        begin
           #20 
           rd = 1'b1;  
           #40  
           rd = 1'b0; 
        end         
     end
endmodule
