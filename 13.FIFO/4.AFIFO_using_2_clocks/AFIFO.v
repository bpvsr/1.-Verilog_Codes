`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 24.04.2025 15:43:19
// Design Name: 
// Module Name: AFIFO
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


module AFIFO(
    input  wire wclk,
    input  wire rclk,
    input  wire rstn,
    input  wire wr_en,
    input  wire rd_en,
    input  wire [7:0] data_in,
    output wire full,
    output wire empty,
    output wire [7:0] data_out
 );
    reg [7:0] mem [0:31];
    //Size of the write pointer 
    reg [5:0] wr_pntr;
    reg [5:0] rd_pntr;
    //Updation of Write Pointer 
    always@(posedge wclk or negedge rstn) begin
        if(!rstn) begin
            wr_pntr <= 5'd0;
        end else if(wr_en && !full)begin
            wr_pntr <= wr_pntr+1;
        end else begin
            wr_pntr <= wr_pntr; 
        end   
    end
    //Updating Read Pointer
    always@(posedge rclk or negedge rstn) begin
        if(!rstn) begin
            rd_pntr <= 5'd0;
        end else if(rd_en && !empty)begin
            rd_pntr <= rd_pntr+1;
        end else begin
            rd_pntr <= rd_pntr; 
        end   
    end    
     //Writng into the memory
    always@(posedge wclk) begin
        if(wr_en)
            mem[wr_pntr[4:0]] <= data_in;
    end
    //Reading from the memory
    assign data_out = mem[rd_pntr[4:0]];
    //Empty and Full 
    assign empty = (wr_pntr == rd_pntr) ? 1'b1 : 1'b0;
    assign full  = (wr_pntr[5] == !rd_pntr[5]) &&(wr_pntr[4:0] == rd_pntr[4:0]); 
     
endmodule
