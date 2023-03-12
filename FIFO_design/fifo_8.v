`timescale 1ns / 1ps
module fifo_8_1(wr_en,rd_en,clk,wr_data,rd_data,empty,full,rst,cnt);
    input wr_en,rd_en,clk,rst;   // input signals to FIFO memory
    input [3:0] wr_data;
    output [3:0] rd_data;
    output full,empty;
    reg [2:0] wr_pt;
    reg [2:0] rd_pt;
    reg [3:0] rd_data;
    reg [3:0] fifo[0:7];    // Defining a FIFO memory of depth 4 bit
    output [2:0] cnt;
    
    count cnt1(cnt,rd_pt,wr_pt,clk);
    assign full = (cnt==7);
    assign empty = (cnt==0);
    
    always@(posedge clk)
    begin
    if(rst) 
        begin 
            wr_pt = 0;
            rd_pt = 0;
        end 
        
    else if(wr_en && ~rd_en && ~full)
           begin
              fifo[wr_pt] = wr_data;
              wr_pt = wr_pt + 1;
           end 
    
    else if(~wr_en && rd_en && ~empty)
           begin
              rd_data = fifo[rd_pt];
              rd_pt = rd_pt + 1;
           end 
           
    else if(wr_en && rd_en && ~empty)
           begin
              fifo[wr_pt] = wr_data;
              wr_pt = wr_pt + 1;
              rd_data = fifo[rd_pt];
              rd_pt = rd_pt + 1;
           end
    else if(~wr_en && ~rd_en)
           begin
              wr_pt = wr_pt;
              rd_pt = rd_pt;
           end  
    end
    endmodule 
    
    module count(cnt,rd_pt,wr_pt,clk);
        input [2:0] wr_pt;
        input [2:0] rd_pt;
        output [2:0] cnt;
        reg [2:0] cnt = 0;
        input clk;     
        
        always@(posedge clk)
        begin
            if (rd_pt > wr_pt) 
                begin 
                    cnt<= rd_pt - wr_pt; 
                end 
            
            else if(wr_pt == rd_pt)
                begin 
                    cnt<= cnt; 
                end
                
            else if(wr_pt > rd_pt)
                begin 
                    cnt<= wr_pt - rd_pt; 
                end
        end 
    endmodule
    
    
