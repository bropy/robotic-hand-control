module Servo (
    input wire clk,
    input wire i_servo           // Servo control signal from Main
);
    always @(posedge clk) begin
        if (i_servo) begin
            $display("Servo is ON"); // Debug message
        end else begin
            $display("Servo is OFF"); // Debug message
        end
    end
endmodule