module bpsk (
    input  wire clk,
    input  wire data_bit,
    input  wire signed [7:0] carrier,
    output reg  signed [7:0] out
);

always @(posedge clk) begin
    if (data_bit)
        out <= carrier;     // bit 1: same carrier
    else
        out <= -carrier;    // bit 0: inverted carrier
end

endmodule