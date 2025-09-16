`default_nettype none



module clock_divider (
    input wire clk,
    input wire rst,
    output reg slow_en
);
    reg [7:0] div_count;
    always @(posedge clk) begin
        if (rst) begin
            div_count <= 0;
            slow_en <= 0;
        end
        else if (div_count == 8'b10000000) begin // ~1 Hz at 100 MHz
            div_count <= 0;
            slow_en <= 1;
        end
        else begin
            div_count <= div_count + 1;
            slow_en <= 0;
        end
    end
endmodule

