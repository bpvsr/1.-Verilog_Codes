`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 24.04.2025 10:43:19
// Design Name: 
// Module Name: FIFO
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


module FIFO(
    input  wire clk,
    input  wire rstn,
    input  wire wr_rd,
    input  wire [7:0] data_in,
    output wire full,
    output wire empty,
    output wire [7:0] data_out
 );
    reg [7:0] mem [0:31];
    
    reg [5:0] wr_pntr;
    reg [5:0] rd_pntr;
    
    always@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            wr_pntr <= 5'd0;
        end else if(wr_rd)begin
            wr_pntr <= wr_pntr+1;
        end else begin
            wr_pntr <= wr_pntr; 
        end   
    end
    
    always@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            rd_pntr <= 5'd0;
        end else if(!wr_rd)begin
            rd_pntr <= rd_pntr+1;
        end else begin
            rd_pntr <= rd_pntr; 
        end   
    end    
     
    always@(posedge clk) begin
        if(wr_rd)
            mem[wr_pntr[4:0]] <= data_in;
    end
    
    assign data_out = mem[rd_pntr[4:0]];
    
    assign empty = (wr_pntr == rd_pntr) ? 1'b1 : 1'b0;
    assign full  = (wr_pntr[5] == ~rd_pntr[5]) &&(wr_pntr[4:0] == rd_pntr[4:0]); 
     
endmodule
