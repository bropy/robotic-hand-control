module Tenzo2 (
    input wire clk,
    output reg o_limit2          // Limit signal for Main module
);
    reg [7:0] o_is_tenzo2_max = 8'b00000000;

    always @(posedge clk) begin
        if (o_is_tenzo2_max >= 8'b00110010) begin
            o_limit2 <= 1; // Max pressure reached
        end else begin
            o_is_tenzo2_max <= o_is_tenzo2_max + 1; // Increment pressure reading
            o_limit2 <= 0; // Pressure is within limit
        end
    end
endmodule