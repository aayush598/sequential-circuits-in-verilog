`timescale 1ns / 1ps


module sr_ff(
input s,
input r,
input clk,
output reg q,
output Q
    );
assign Q=~q;

always@(posedge clk) begin
    case ({s,r})
        2'b00: q<=q;
        2'b01: q<=1'b0;   //Reset 
        2'b10: q<=1'b1;   //set
        2'b11: q<=1'bx;
    endcase
end 
endmodule
