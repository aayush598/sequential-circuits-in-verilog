module top (
    input CS,
    input [5:0] Address_Row,
    input [5:0] Address_Col,
    input [7:0] data_in,
    input RW,
    output reg [7:0] data_out
);

reg [7:0] Memory [0:63][0:63];

always @(*) begin
    if (~CS) begin
        if (RW) begin
            data_out = Memory[Address_Row][Address_Col];
        end
        else begin
            Memory[Address_Row][Address_Col] = data_in;
            data_out = 8'h00;
        end
    end
    
end
    
endmodule