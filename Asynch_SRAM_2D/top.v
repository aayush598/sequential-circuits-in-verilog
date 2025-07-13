module top (
    input CS,
    input RW_en,
    input [5:0] Address,
    input [7:0] Data_in,
    output reg [7:0] Data_out
);

    reg [7:0] Memory [0:63];

    always @(*) begin
        if (~CS) begin
            if (RW_en) begin
                Data_out = Memory[Address];
            end
            else begin
                Memory[Address] = Data_in;
                Data_out = 8'b0000_0000;
            end
        end
    end
endmodule