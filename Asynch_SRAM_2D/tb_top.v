module tb_top;

    reg CS;
    reg RW_en;
    reg [7:0] Data_in;
    reg [5:0] Address;
    wire [7:0] Data_out;

    top uut (
        .CS(CS),
        .RW_en(RW_en),
        .Data_in(Data_in),
        .Address(Address),
        .Data_out(Data_out)
    );

    initial begin
        CS = 1;
        #5;

        CS = 0;
        RW_en =0;
        Data_in = 8'b0000_0100;
        Address = 6'b00_0001;


        #5 $display("CS : %b\t RW_en : %b\t Data_in : %b\t Address : %b\t Data_out : %b\t", CS, RW_en, Data_in, Address, Data_out);

        CS = 1'b0;
        RW_en =1'b1;
        Data_in = 8'b0000_0101;
        Address = 6'b00_0001;

        #5 $display("CS : %b\t RW_en : %b\t Data_in : %b\t Address : %b\t Data_out : %b\t", CS, RW_en, Data_in, Address, Data_out);

        
    end

endmodule