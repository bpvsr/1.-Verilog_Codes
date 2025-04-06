`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.03.2024 14:59:34
// Design Name: 
// Module Name: counter
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

module counter(input clk, input rstn, input en,output reg [2:0] count,output reg count_full);

always@(posedge clk or negedge rstn)// asynchronous 
begin
    if(!rstn)
        count <= 8'h00;
    else if(en)
        count <= count + 1'b1;
    else 
        count <= count;    
end

always@(posedge clk or negedge rstn)
begin
    if(!rstn)
        count_full <= 1'b0;
    else if(count == 7)
        count_full <= 1'b1;
    else 
        count_full <= 1'b0;    
end
endmodule
