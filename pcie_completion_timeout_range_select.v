module pcie_completion_timeout_range_select (
    input wire [1:0] timeout_select, // 2-bit input to select timeout range
    output reg [31:0] timeout_value  // 32-bit output for timeout value
);
// Define timeout ranges
    localparam TIMEOUT_RANGE_0 = 32'h0000_1000; // Example timeout value for range 0
    localparam TIMEOUT_RANGE_1 = 32'h0000_2000; // Example timeout value for range 1
    localparam TIMEOUT_RANGE_2 = 32'h0000_4000; // Example timeout value for range 2
    localparam TIMEOUT_RANGE_3 = 32'h0000_8000; // Example timeout value for range 3
always @(*) begin
        case (timeout_select)
            2'b00: timeout_value = TIMEOUT_RANGE_0;
            2'b01: timeout_value = TIMEOUT_RANGE_1;
            2'b10: timeout_value = TIMEOUT_RANGE_2;
            2'b11: timeout_value = TIMEOUT_RANGE_3;
            default: timeout_value = 32'h0000_0000; // Default case
        endcase
    end
endmodule
