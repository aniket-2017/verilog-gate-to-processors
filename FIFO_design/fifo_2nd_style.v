`timescale 1ns / 1ps
    module fifo_8(data_out,full, empty, fifo_th, fifo_of, fifo_uf,clk, rst, wr, rd, data_in);  
          input wr, rd, clk, rst;  
          input[3:0] data_in;  
          output[3:0] data_out;  
          output full, empty, fifo_th, fifo_of, fifo_uf;  
          wire [4:0] wr_pt,rd_pt;  
          wire fifo_we,fifo_rd;   
              write_pointer top1(wr_pt,fifo_we,wr,full,clk,rst);  
              read_pointer top2(rd_pt,fifo_rd,rd,empty,clk,rst);  
              memory_array top3(data_out, data_in, clk,fifo_we,fifo_rd, wr_pt,rd_pt);  
              status_signal top4(full, empty, fifo_th, fifo_of, fifo_uf, wr, rd, fifo_we, fifo_rd, wr_pt,rd_pt,clk,rst);  
     endmodule  

    module memory_array(data_out, data_in, clk,fifo_we,fifo_rd, wr_pt,rd_pt);  
          input[3:0] data_in;  
          input clk,fifo_we,fifo_rd;  
          input[4:0] wr_pt,rd_pt;  
          output[3:0] data_out;  
          reg[3:0] data_out2[7:0];  
          reg[3:0] data_out;  
              always @(posedge clk)  
              begin  
               if(fifo_we)
                    begin  
                        data_out2[wr_pt[3:0]] <=data_in ;  
                    end
                    
                else if(fifo_rd)
                    begin
                        assign data_out = data_out2[rd_pt[3:0]];  
                    end
                end
     endmodule  

    module read_pointer(rd_pt,fifo_rd,rd,empty,clk,rst);  
          input rd,empty,clk,rst;  
          output[4:0] rd_pt;  
          output fifo_rd;  
          reg[4:0] rd_pt;  
          assign fifo_rd = (~empty)& rd;  
          always @(posedge clk or negedge rst)  
              begin  
               if(~rst) rd_pt <= 0;
               else if(fifo_rd)  
                rd_pt <= rd_pt + 1;  
               else  
                rd_pt <= rd_pt;  
              end  
    endmodule  

    module status_signal(full, empty, fifo_th, fifo_of, fifo_uf, wr, rd, fifo_we, fifo_rd, wr_pt,rd_pt,clk,rst);  
          input wr, rd, fifo_we, fifo_rd,clk,rst;  
          input[4:0] wr_pt, rd_pt;  
          output full, empty, fifo_th, fifo_of, fifo_uf;  
          wire fbit_comp, overflow_set, underflow_set;  
          wire pointer_equal;  
          wire[4:0] pointer_result;  
          reg full, empty, fifo_th, fifo_of, fifo_uf;  
              assign fbit_comp = wr_pt[4] ^ rd_pt[4];  
              assign pointer_equal = (wr_pt[3:0] - rd_pt[3:0]) ? 0:1;  
              assign pointer_result = wr_pt[4:0] - rd_pt[4:0];  
              assign overflow_set = full & wr;  
              assign underflow_set = empty&rd;  
              always @(*)  
                  begin  
                   full =fbit_comp & pointer_equal;  
                   empty = (~fbit_comp) & pointer_equal;  
                   fifo_th = (pointer_result[4]||pointer_result[3]) ? 1:0;  
                  end  
              always @(posedge clk or negedge rst)  
                  begin  
                  if(~rst) fifo_of <=0;  
                  else if((overflow_set==1)&&(fifo_rd==0))  
                   fifo_of <=1;  
                   else if(fifo_rd)  
                    fifo_of <=0;  
                    else  
                     fifo_of <= fifo_of;  
                  end  
              always @(posedge clk or negedge rst)  
                  begin  
                  if(~rst) fifo_uf <=0;  
                  else if((underflow_set==1)&&(fifo_we==0))  
                   fifo_uf <=1;  
                   else if(fifo_we)  
                    fifo_uf <=0;  
                    else  
                     fifo_uf <= fifo_uf;  
                  end  
     endmodule  

    module write_pointer(wr_pt,fifo_we,wr,full,clk,rst);  
          input wr,full,clk,rst;  
          output[4:0] wr_pt;  
          output fifo_we;  
          reg[4:0] wr_pt;  
          assign fifo_we = (~full)&wr;  
          always @(posedge clk or negedge rst)  
              begin  
               if(~rst) wr_pt <= 0;  
               else if(fifo_we)  
                wr_pt <= wr_pt + 1;  
               else  
                wr_pt <= wr_pt;  
              end  
     endmodule  
