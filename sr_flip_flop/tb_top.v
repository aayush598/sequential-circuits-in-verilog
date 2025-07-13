module sr_ff_tb;

    reg s;
    reg r;
    reg clk = 0;
    wire q;
    wire Q;
    
always #5 clk=~clk;

sr_ff UUT
(
    .s(s),
    .r(r),
    .clk(clk),
    .q(q),
    .Q(Q)
);
initial begin
    s<=0;
    r<=0;
    #5;
     
    s<=0;
    r<=1;
    #20;
    
    s<=1;
    r<=0;
    #20;
    
    s<=1;
    r<=1;
    #20;
$finish;
end
endmodule