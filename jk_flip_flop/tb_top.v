`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 13.07.2025 19:19:20
// Design Name: 
// Module Name: jk_ff_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module jk_tb;
reg j;
reg k;
wire q;
wire Q;
reg clk=0;
always #5 clk=~clk;

jk_ff UUT
(
.j(j),
.k(k),
.clk(clk),
.q(q),
.Q(Q)
);
initial begin
j<=0;
k<=0;
#5;
j<=0;
k<=1;
#10;
j<=1;
k<=0;
#20;
j<=1;
k<=1;
#20;
$finish;
end
endmodule
