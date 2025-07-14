`timescale 1ns / 1ps

module tb_alu_4bit;

reg [3:0] A;
reg [3:0] B;
reg [2:0] ALU_Sel;
wire [3:0] ALU_Out;
wire CarryOut;

alu_4bit uut (
    .A(A),
    .B(B),
    .ALU_Sel(ALU_Sel),
    .ALU_Out(ALU_Out),
    .CarryOut(CarryOut)
);

initial begin
    // Monitor the inputs and output
    $monitor("Time = %0d | A = %b, B = %b, ALU_Sel = %b => ALU_Out = %b, CarryOut = %b",
             $time, A, B, ALU_Sel, ALU_Out, CarryOut);

    // Test all ALU operations
    A = 4'b0101; B = 4'b0011;

    // Addition
    ALU_Sel = 3'b000; #10;

    // Subtraction
    ALU_Sel = 3'b001; #10;

    // AND
    ALU_Sel = 3'b010; #10;

    // OR
    ALU_Sel = 3'b011; #10;

    // XOR
    ALU_Sel = 3'b100; #10;

    // NOT A
    ALU_Sel = 3'b101; #10;

    // Increment A
    ALU_Sel = 3'b110; #10;

    // Decrement A
    ALU_Sel = 3'b111; #10;

    $finish;
end

endmodule
