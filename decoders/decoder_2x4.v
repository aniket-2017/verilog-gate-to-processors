`timescale 1ns / 1ps

module decoder_2x4(x,en,y);
    input[1:0] x;
    input en;
    output reg [3:0] y;
always@(*)
 begin
 case({en,x})
  3'b100:y=4'b0001;
  3'b101:y=4'b0010;
  3'b110:y=4'b0100;
  3'b111:y=4'b1000;
  default:y=4'b0000;
 endcase
end
endmodule
