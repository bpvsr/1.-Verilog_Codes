`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2024 14:37:35
// Design Name: 
// Module Name: lshift
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


module lshift(input [7:0] a, input [7:0] q,output [7:0] out_a, output [7:0] out_q );
    assign {out_a,out_q} = {a,q} << 1;
endmodule
