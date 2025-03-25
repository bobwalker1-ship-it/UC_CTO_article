module devctl2_config (
    input wire clk,
    input wire reset,
    input wire [3:0] timeout_range,   // 4 bits for timeout range (e.g., Range A to D)
    input wire [3:0] timeout_value,   // 4 bits for timeout value within the range
    output reg [15:0] devctl2         // DevCtl2 is a 16-bit register
);

    // Fields in DevCtl2 based on PCIe specification:
    // Bits [7:4]: Completion Timeout Range
    // Bits [3:0]: Completion Timeout Value

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            devctl2 <= 16'b0; // Reset the DevCtl2 register to default
        end else begin
            // Set Completion Timeout Range and Completion Timeout Value
            devctl2[7:4] <= timeout_range;  // Map timeout range to bits [7:4]
            devctl2[3:0] <= timeout_value;  // Map timeout value to bits [3:0]
        end
    end
Endmodule
