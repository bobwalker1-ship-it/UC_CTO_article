module pcie_endpoint (
    input wire clk,
    input wire reset,
    input wire [31:0] tlp_header,
    input wire tlp_valid,
    input wire tlp_completion,
    output reg [7:0] tlp_id
);

    reg [7:0] id_counter;
    reg [7:0] assigned_id;

    always @(posedge clk or posedge reset) begin
        if (reset) begin
            id_counter <= 8'd0;
            assigned_id <= 8'd0;
            tlp_id <= 8'd0;
        end else begin
            if (tlp_valid && !tlp_completion) begin
                // Assign an ID to the TLP header for non-posted read
                assigned_id <= id_counter;
                tlp_id <= id_counter;
                id_counter <= id_counter + 1;
            end else if (tlp_completion) begin
                // Release the ID once there is a non-posted read completion
                tlp_id <= 8'd0;
            end
        end
    end

endmodule
