`timescale 1ns / 1ps

module tb_sram22;

  // Parameters
  localparam DATA_WIDTH = 64;
  localparam ADDR_WIDTH = 10;
  localparam WMASK_WIDTH = 8;

  // Inputs
  reg clk;
  reg rstb;
  reg ce;
  reg we;
  reg [WMASK_WIDTH-1:0] wmask;
  reg [ADDR_WIDTH-1:0] addr;
  reg [DATA_WIDTH-1:0] din;

  // Output
  wire [DATA_WIDTH-1:0] dout;

  // Instantiate the module
  sram22_1024x64m4w8 uut (
    .clk(clk),
    .rstb(rstb),
    .ce(ce),
    .we(we),
    .wmask(wmask),
    .addr(addr),
    .din(din),
    .dout(dout)
  );

  // Clock generation
  always #5 clk = ~clk;

  // Test logic
  initial begin
    $display("Starting SRAM Testbench...");

    // Initialize inputs
    clk = 0;
    rstb = 0;
    ce = 0;
    we = 0;
    wmask = 8'b00000000;
    addr = 0;
    din = 0;

    // Apply reset
    #10 rstb = 1;

    // Write Operation
    #10;
    ce = 1;
    we = 1;
    addr = 10'd5;
    din = 64'hDEADBEEFCAFEBABE;
    wmask = 8'b11111111; // Enable all byte writes
    #10;

    // Read Operation
    we = 0;
    wmask = 8'b00000000;
    #10;

    // Print result
    $display("Read Data at address %0d: %h", addr, dout);

    // Finish simulation
    #10;
    $finish;
  end

endmodule
