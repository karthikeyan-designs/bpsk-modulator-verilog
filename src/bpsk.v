// BPSK Modulator
// Performs Binary Phase Shift Keying:
//   data_bit = 1 → transmit carrier as it is (0° phase)
//   data_bit = 0 → transmit inverted carrier (180° phase)

module bpsk (
    input   clk,                         // System clock
    input   data_bit,                    // Input binary data (0 or 1)
    input   signed [7:0] carrier,        // Input carrier signal (cosine waveform)
    output reg signed [7:0] out          // BPSK modulated output
);

// Sequential logic: updates on rising edge of clock
always @(posedge clk) begin
    if (data_bit)
        out <= carrier;     // Bit '1' → no phase change
    else
        out <= -carrier;    // Bit '0' → 180° phase inversion
end

endmodule