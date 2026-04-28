`timescale 1ns/1ps

module bpsk_sqr_tb;

reg clk;
reg data_bit;
wire signed [7:0] carrier;   // FIXED
wire signed [7:0] out;

reg [2:0] index;

bpsk dut (
    .clk(clk),
    .data_bit(data_bit),
    .carrier(carrier),
    .out(out)
);

cos car(
    .clk(clk),
    .index(index),
    .carrier(carrier)
);

// clock
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// index generation (VERY IMPORTANT)
initial index = 0;

always @(posedge clk)
    index <= index + 1;

// data stimulus
initial begin
    data_bit = 0;

    #35 data_bit = 1;
    #40 data_bit = 0;
    #40 data_bit = 1;
    #40 data_bit = 0;

    #40 $finish;
end

endmodule