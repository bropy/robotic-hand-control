module Tenzo1 (
    input wire clk,
    input wire i_press,        // Indicates if external pressure is applied
    output reg o_limit1        // Limit signal for Main module
);
    reg [7:0] o_is_tenzo1_max = 8'b00000000;

    always @(posedge clk) begin
        if (i_press) begin
            // If pressure is externally triggered, stop incrementing
            o_limit1 <= 1; // Indicate max pressure
        end else if (o_is_tenzo1_max >= 8'b00110010) begin
            // Auto-stop if internal pressure exceeds the limit
            o_limit1 <= 1; // Indicate max pressure
        end else begin
            o_is_tenzo1_max <= o_is_tenzo1_max + 1; // Increment pressure reading
            o_limit1 <= 0; // Pressure is within limit
        end
    end
endmodule
