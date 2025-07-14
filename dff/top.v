`timescale 1ns / 1ps

module d_ff(
input D,
input clk,
output reg q,
output wire Q
);
assign Q=~q;
always @(posedge clk) begin
q<=D;

end
endmodule
