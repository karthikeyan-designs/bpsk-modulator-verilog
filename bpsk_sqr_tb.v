`timescale 1ns/1ps

module bpsk_sqr_tb;

reg clk;
reg data_bit;
reg signed [7:0] carrier;
wire signed [7:0] out;

bpsk dut (
    .clk(clk),
    .data_bit(data_bit),
    .carrier(carrier),
    .out(out)
);

// clock generation
initial begin
    clk = 0;
    forever #5 clk = ~clk;
end

// square-wave carrier generation
// initialize
initial carrier = 8'sd10;

// toggle every clock
always @(negedge clk)
    carrier <= -carrier;
// data bit stimulus
initial begin
    data_bit = 0;

    #35 data_bit = 1;
    #40 data_bit = 0;
    #40 data_bit = 1;
    #40 data_bit = 0;

    #40 $finish;
end

endmodule