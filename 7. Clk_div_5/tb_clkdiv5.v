`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 06.04.2025 15:30:47
// Design Name: 
// Module Name: tb_clkdiv5
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


module tb_clkdiv5();
    
    reg   clk;
    reg   rstn;
    wire  clk_out;
    
    clkdivby5 DUT(
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
        #100 $finish; 
    end
endmodule
