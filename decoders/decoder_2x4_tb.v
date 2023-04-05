`timescale 1ns / 1ps

module decoder_2x4_tb();
    reg [1:0] x;
    reg en;
    wire [3:0] y;

decoder_2x4 dut(x,en,y);

    initial begin
        en = 0; #20;
        en = 1; #20
        x = 2'b00; #30
        x = 2'b11; #30
        x = 2'b10; #30
        x = 2'b01; #30;
        $finish;
    end
endmodule
