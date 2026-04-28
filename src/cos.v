// Cosine carrier generator using LUT (Look-Up Table)
// Generates an 8-sample approximated cosine waveform

module cos_carrier (
    input clk,                      // Clock input
    input  [2:0] index,             // 3-bit index (0 to 7) for LUT addressing
    output reg signed [7:0] carrier // Signed 8-bit cosine output
);

// LUT-based cosine approximation
// Values represent one full cosine cycle sampled at 8 points
// Amplitude scaled to ~100 (approximate)

always @(negedge clk) begin
    case(index)
        3'd0: carrier <=  8'sd0;     // 0°
        3'd1: carrier <=  8'sd70;    // 45°
        3'd2: carrier <=  8'sd100;   // 90° (peak)
        3'd3: carrier <=  8'sd70;    // 135°
        3'd4: carrier <=  8'sd0;     // 180°
        3'd5: carrier <= -8'sd70;    // 225°
        3'd6: carrier <= -8'sd100;   // 270° (negative peak)
        3'd7: carrier <= -8'sd70;    // 315°
    endcase
end

endmodule