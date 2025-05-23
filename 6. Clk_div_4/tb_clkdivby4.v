`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 06.04.2025 14:35:28
// Design Name: 
// Module Name: tb_clkdivby4
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


module tb_clkdivby4();

    reg  clk;
    reg  rstn;
    wire out_clk;
    
    clkdivby4 DUT(
        .clk    (clk    ),
        .rstn   (rstn   ),
        .out_clk(out_clk)
    );
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        @(posedge clk) rstn <= 1'b0;
        @(posedge clk) rstn <= 1'b1;
        #100 $finish;
    end
endmodule
