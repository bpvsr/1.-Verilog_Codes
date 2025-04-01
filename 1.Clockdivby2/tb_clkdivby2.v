`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 01.04.2025 06:48:28
// Design Name: 
// Module Name: tb_clkdivby2
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


module tb_clkdivby2();

    reg  clk;        // 100MHz
    reg  rstn;      
    wire clk_out;    // 50MHz 

    clkdivby2 DUT(
    .clk     (clk    ),
    .rstn    (rstn   ),
    .clk_out (clk_out)
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
