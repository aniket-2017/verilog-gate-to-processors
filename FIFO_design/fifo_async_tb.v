`timescale 1ns / 1ps
module fifo_async_tb();
    wire  [3:0] Data_out; // output data
    wire  Empty_out;
    reg ReadEn_in; //read enable
    reg RClk;      // Read clock
    reg [3:0] Data_in; // write data
    wire Full_out;
    reg WriteEn_in;  // write enable
    reg WClk;        // Write clock
    reg Clear_in;   //Count reset.

aFifo dut(Data_out,Empty_out,ReadEn_in,RClk,Data_in,Full_out,WriteEn_in,WClk,Clear_in);

initial 
    begin
    Clear_in = 1;  //clear the counter
    WriteEn_in = 0; ReadEn_in = 0; //no read and write operation
    WClk =0;
        forever #5 WClk= ~WClk;  // Write clock freq
    end 

initial 
    begin
    RClk = 1;
        forever #8 RClk= ~RClk; // Read clock freq
    end
    
initial
    begin
        #100 Clear_in = 0;
        WriteEn_in =1; ReadEn_in = 0;  // Write operation
        Data_in = 8'b0010; // data input
        repeat(8)
            begin
            Data_in = Data_in +1; #20;
            end
        WriteEn_in = 0; ReadEn_in = 0;  // no operation
        #50;
        WriteEn_in = 0; ReadEn_in = 1; // Read Operation
        #250;      
        WriteEn_in = 0; ReadEn_in = 0; //No operation
        #50;
        $finish();
    end
endmodule
