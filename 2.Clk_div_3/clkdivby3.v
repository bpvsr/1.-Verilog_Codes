`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja pvsr
// 
// Create Date: 02.04.2025 06:50:17
// Design Name: 
// Module Name: clkdivby3
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


module clkdivby3(
    input  wire clk,
    input  wire rstn,
    output reg  [1:0] q,
    output wire q33dot3,
    output wire q50   
    ); 
    
    always@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            q <= 2'b00;
        end else begin
            q[1] <= q[0];
            q[0] <= ~q[1] & ~q[0];
        end
    end
    reg q1;
    always@(negedge clk or negedge rstn) begin
        if(!rstn) begin
            q1 <= 1'b0;    
        end else begin
            q1 <= q[0];
        end
    end 
    
    assign q33dot3 = q[0];
    assign q50     = q[0] | q1;
    
endmodule
