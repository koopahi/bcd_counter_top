`default_nettype none


module tt_um_koopahi_bcd_counter_top (
    input  wire [7:0] ui_in,    // Dedicated inputs
    output wire [7:0] uo_out,   // Dedicated outputs
    input  wire [7:0] uio_in,   // IOs: Input path
    output wire [7:0] uio_out,  // IOs: Output path
    output wire [7:0] uio_oe,   // IOs: Enable path (active high: 0=input, 1=output)
    input  wire       ena,      // always 1 when the design is powered, so you can ignore it
    input  wire       clk,      // clock
    input  wire       rst_n     // reset_n - low to reset
);

    assign uio_out = 8'b0000_0000;
    assign uio_oe = 8'b1111_1111;
    
    wire rst = !rst_n;
    bcd_counter_top bcd_counter_top (
        .clk(clk),           
        .rst(rst),           
        .up_down(ui_in[0]),       
        .digit1(uo_out[7:4]), 
        .digit0(uo_out[3:0])  
    ); 

endmodule
