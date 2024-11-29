module Visual(
    input wire clk,
    input wire [7:0] i_distance,
    output reg o_canGripp
);
    always @(posedge clk) begin
        if (i_distance <= 8'b00001010 && i_distance >= 8'b00000100) begin
            // 10 cm (1010) to 4 cm (0100)
            o_canGripp = 1;
        end
        else begin
            o_canGripp = 0;
        end
    end
endmodule
