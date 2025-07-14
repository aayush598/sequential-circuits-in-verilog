module alu_4bit (
    input [3:0] A,       // 4-bit input A
    input [3:0] B,       // 4-bit input B
    input [2:0] ALU_Sel, // 3-bit selector for operation
    output reg [3:0] ALU_Out, // 4-bit output
    output reg CarryOut       // Carry flag (for addition only)
);

always @(*) begin
    case(ALU_Sel)
        3'b000: {CarryOut, ALU_Out} = A + B;      // Addition
        3'b001: {CarryOut, ALU_Out} = A - B;      // Subtraction
        3'b010: {CarryOut, ALU_Out} = {1'b0, A & B}; // AND
        3'b011: {CarryOut, ALU_Out} = {1'b0, A | B}; // OR
        3'b100: {CarryOut, ALU_Out} = {1'b0, A ^ B}; // XOR
        3'b101: {CarryOut, ALU_Out} = {1'b0, ~A};    // NOT A
        3'b110: {CarryOut, ALU_Out} = A + 1;         // Increment A
        3'b111: {CarryOut, ALU_Out} = A - 1;         // Decrement A
        default: {CarryOut, ALU_Out} = 5'b00000;
    endcase
end

endmodule
