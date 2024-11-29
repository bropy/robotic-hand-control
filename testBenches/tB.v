module tB;
    // Testbench Signals
    reg clk;
    reg command;                // 1 = Lift, 0 = Drop
    reg [7:0] i_distance;       // Distance for Visual module
    reg i_press;                // External pressure signal
    wire i_canGripp;            // Output from Visual
    wire o_limit1, o_limit2;    // Outputs from Tenzo1 and Tenzo2
    wire o_servo;               // Output from Main to Servo

    // Clock Generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk;  // Toggle clock every 5 time units
    end

    // Instantiate Modules
    Visual u_visual (
        .clk(clk),
        .i_distance(i_distance),
        .o_canGripp(i_canGripp)
    );

    Tenzo1 u_tenzo1 (
        .clk(clk),
        .i_press(i_press),
        .o_limit1(o_limit1)
    );

    Tenzo2 u_tenzo2 (
        .clk(clk),
        .o_limit2(o_limit2)
    );

    Main u_main (
        .clk(clk),
        .command(command),
        .i_canGripp(i_canGripp),
        .i_is_tenzo1_max(o_limit1),
        .i_is_tenzo2_max(o_limit2),
        .o_servo(o_servo)
    );

    // Stimulus
    initial begin
        // Test Case 1: Command = Lift, Valid Distance, No Pressure Limits
        command = 1;            // Lift
        i_distance = 8'b00001000; // 8 cm (Valid for gripping)
        i_press = 0;            // No external pressure
        #20;

        // Test Case 2: Command = Lift, Invalid Distance
        i_distance = 8'b00000011; // 3 cm (Too close, cannot grip)
        i_press = 0;
        #20;

        // Test Case 3: Command = Lift, External Pressure Triggered
        i_distance = 8'b00001000; // 8 cm (Valid for gripping)
        i_press = 1;             // External pressure signal triggers limit
        #20;

        // Test Case 4: Command = Drop
        command = 0;            // Drop
        i_distance = 8'b00001000;
        i_press = 0;
        #20;

        // Test Case 5: Command = Lift, Valid Again
        command = 1;            // Lift
        i_distance = 8'b00000101; // 5 cm (Valid for gripping)
        i_press = 0;
        #20;

        $finish;                // End simulation
    end
endmodule
