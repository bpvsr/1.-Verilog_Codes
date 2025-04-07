`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 06.04.2025 14:31:57
// Design Name: 
// Module Name: clkdivby4
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


module clkdivby4(
    input  wire clk,
    input  wire rstn,
    output wire out_clk
    );
    
    reg q1,q0;
    
    always@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            q1 <= 1'b0;
            q0 <= 1'b0;
        end else begin
            q1 <= q1 ^ q0;
            q0 <= ~q0;
        end
    end
    
    assign out_clk = q1;
endmodule
