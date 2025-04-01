`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 01.04.2025 06:40:06
// Design Name: 
// Module Name: clkdivby2
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
module clkdivby2(
    input  wire clk,
    input  wire rstn,
    output wire clk_out
    );
    
    reg clk_t;
    always@(posedge clk or negedge rstn) begin
         if(!rstn) begin
             clk_t <= 1'b0;
         end else begin
             clk_t <= ~clk_t;
         end
    end
    assign clk_out = clk_t;
endmodule
