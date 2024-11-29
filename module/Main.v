module Main(
    input wire clk,
    input wire command,          // 1 = lift, 0 = drop
    input wire i_canGripp,       // From Visual
    input wire i_is_tenzo1_max,  // From Tenzo1
    input wire i_is_tenzo2_max,  // From Tenzo2
    output reg o_servo           // Control Servo
);
    always @(posedge clk) begin
        if (command) begin
            // Command = 1 (Lift)
            if (i_canGripp && !i_is_tenzo1_max && !i_is_tenzo2_max) begin
                o_servo = 1; // Activate servo to lift
            end else begin
                o_servo = 0; // Deactivate servo
            end
        end else begin
            // Command = 0 (Drop)
            o_servo = 0; // Deactivate servo for drop
        end
    end
endmodule
