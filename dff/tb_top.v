`timescale 1ns / 1ps

module tb_dff;

reg D;
reg clk=0;
wire q;
wire Q;

 d_ff UUT(
 .D(D),
 .clk(clk),
 .q(q), 
 .Q(Q)
 );
 always #5 clk=~clk;
 
 initial begin
  D=0; #12;
  D=1; #10;
  D=0; #10;
  D=1; #10;
  D=1; #10;
  D=0; #10;
  #14;
  $finish;
 end
endmodule
