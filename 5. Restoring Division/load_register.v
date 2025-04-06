`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2024 14:45:55
// Design Name: 
// Module Name: load_register
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


module load_reg1(input clk,
                     input rstn, 
                     input load_start,
                     input load_mid, 
                     input [7:0] dividend,
                     input [7:0] divisor,
                     input [7:0] in_a,
                     input [7:0] in_q,
                     output reg [7:0] out_a,
                     output reg [7:0] out_q,
                     output reg [7:0] out_m);
         always@(posedge clk or negedge rstn)
         begin
            if(!rstn)
            begin
                out_a <= 8'h00;
                out_q <= 8'h00;
                out_m <= 8'h00;
            end
            else if(load_start)
            begin
                out_a <= 8'h00;
                out_q <= dividend;
                out_m <= divisor;
            end
            else if(load_mid)
            begin
                out_a <= in_a;
                out_q <= in_q;
                out_m <= divisor;
            end
            else 
            begin
                out_a <= out_a;
                out_q <= out_q;
                out_m <= out_m;
            end    
         end                 
endmodule
