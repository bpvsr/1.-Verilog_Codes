`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja PVSR
// 
// Create Date: 02.04.2025 06:53:47
// Design Name: 
// Module Name: tb_clkdivby3
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


module tb_clkdivby3();
    
    reg  clk    ;
    reg  rstn   ;
    wire [1:0] q;
    wire q33dot3;
    wire q50    ;
        
    clkdivby3 DUT(
        .clk     (clk    ),
        .rstn    (rstn   ),
        .q       (q      ),
        .q33dot3 (q33dot3),
        .q50     (q50    )
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
