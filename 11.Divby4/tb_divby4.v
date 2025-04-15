`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2025 14:45:52
// Design Name: 
// Module Name: tb_divby4
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


module tb_divby4();
   
    reg clk;
    reg rstn;
    reg din;
    wire detect_divby4;
    
    divby4 DUT(
        .clk           (clk          ),
        .rstn          (rstn         ),
        .din           (din          ),
        .detect_divby4 (detect_divby4)
    );
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end
    
    initial begin
        @(posedge clk) rstn = 1'b0;din=1'b0;
        @(posedge clk) rstn = 1'b1;din=1'b0;
        @(posedge clk) rstn = 1'b1;din=1'b1;
        @(posedge clk) rstn = 1'b1;din=1'b0;
        @(posedge clk) rstn = 1'b1;din=1'b0;
        @(posedge clk);
        $finish;
    end
endmodule
