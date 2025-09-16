`default_nettype none


module bcd_counter (
    input wire clk,           // Clock input
    input wire rst,           // Synchronous reset
    input wire en,            // Enable counting
    input wire up_down,       // 1 for up, 0 for down
    output reg [3:0] digit1,  // Tens digit (BCD)
    output reg [3:0] digit0   // Units digit (BCD)
);
    always @(posedge clk) begin
        if (rst) begin
            digit1 <= 4'b0000;
            digit0 <= 4'b0000;
        end
        else if (en) begin
            if (up_down) begin
                if (digit0 == 4'b1001 && digit1 == 4'b1001) begin
                    digit1 <= 4'b0000;
                    digit0 <= 4'b0000;
                end
                else if (digit0 == 4'b1001) begin
                    digit1 <= digit1 + 1;
                    digit0 <= 4'b0000;
                end
                else begin
                    digit0 <= digit0 + 1;
                end
            end
            else begin
                if (digit0 == 4'b0000 && digit1 == 4'b0000) begin
                    digit1 <= 4'b1001;
                    digit0 <= 4'b1001;
                end
                else if (digit0 == 4'b0000) begin
                    digit1 <= digit1 - 1;
                    digit0 <= 4'b1001;
                end
                else begin
                    digit0 <= digit0 - 1;
                end
            end
        end
    end
endmodule
