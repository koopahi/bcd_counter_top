`default_nettype none


module bcd_counter_top (
    input wire clk,           // Fast clock (e.g., 100 MHz)
    input wire rst,           // Synchronous reset
    input wire up_down,       // 1 for up, 0 for down
    output wire [3:0] digit1, // Tens digit (BCD)
    output wire [3:0] digit0  // Units digit (BCD)
);

    wire slow_en;
    clock_divider div (
        .clk(clk),
        .rst(rst),
        .slow_en(slow_en)
    );

    bcd_counter counter (
        .clk(clk),
        .rst(rst),
        .en(slow_en), // Use divided clock enable
        .up_down(up_down),
        .digit1(digit1),
        .digit0(digit0)
    );

endmodule

