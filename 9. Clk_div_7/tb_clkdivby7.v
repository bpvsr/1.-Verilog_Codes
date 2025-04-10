`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2025 07:04:47
// Design Name: 
// Module Name: tb_clkdivby7
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module tb_clkdivby7();

    reg  clk;        // 100MHz
    reg  rstn;      
    wire clk_out;     

    clkdivby7 DUT(
        .clk     (clk    ),
        .rstn    (rstn   ),
        .out_clk (clk_out)
    );

    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        @(posedge clk) rstn <= 1'b0;
        @(posedge clk) rstn <= 1'b1;
        #200 $finish;
    end

endmodule
