module tb_top;

    reg CS;
    reg [5:0] Address_Row;
    reg [5:0] Address_Col;
    reg [7:0] data_in;
    reg RW;
    wire [7:0] data_out;

    top uut (
        .CS(CS),
        .Address_Row(Address_Row),
        .Address_Col(Address_Col),
        .data_in(data_in),
        .RW(RW),
        .data_out(data_out)
    );

    initial begin
        CS = 1;
        #5;

        CS = 0;
        #5;

        Address_Row = 6'b00_0001;
        Address_Col = 6'b00_0010;
        RW = 0;
        data_in = 8'b1000_0000;
        #5;
        $display("CS : %b\t RW : %b\t  Address_Row : %b\t   Address_Col : %b\t  data_in : %b\t  data_out : %b\t ", CS, RW, Address_Row, Address_Col, data_in, data_out);


        Address_Row = 6'b00_0001;
        Address_Col = 6'b00_0010;
        RW = 1;
        data_in = 8'b0100_0000;
        #5;
        $display("CS : %b\t RW : %b\t  Address_Row : %b\t   Address_Col : %b\t  data_in : %b\t  data_out : %b\t ", CS, RW, Address_Row, Address_Col, data_in, data_out);


        Address_Row = 6'b00_0010;
        Address_Col = 6'b00_0001;
        RW = 0;
        data_in = 8'b1000_0000;
        #5;

        $display("CS : %b\t RW : %b\t  Address_Row : %b\t   Address_Col : %b\t  data_in : %b\t  data_out : %b\t ", CS, RW, Address_Row, Address_Col, data_in, data_out);

        
    end

endmodule