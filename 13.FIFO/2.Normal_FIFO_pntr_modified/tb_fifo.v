`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 24.04.2025 11:09:47
// Design Name: 
// Module Name: tb_fifo
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


module tb_fifo();
        reg clk            ;
        reg rstn           ;
        reg wr_rd          ;
        reg [7:0] data_in  ;
        wire full          ;
        wire empty         ;
        wire [7:0] data_out;
        
        FIFO DUT(
            .clk     (clk     ),
            .rstn    (rstn    ),
            .wr_rd   (wr_rd   ),
            .data_in (data_in ),
            .full    (full    ),
            .empty   (empty   ),
            .data_out(data_out)
        );
            
       initial begin
           clk = 1'b0;
           forever #5 clk = ~clk;
       end      
       integer i;
       initial begin
           @(posedge clk) rstn <= 1'b0;
           for(i=0;i<32;i=i+1) begin
               @(posedge clk) rstn <= 1'b1;wr_rd <= 1'b1;data_in <= i; 
           end
           @(posedge clk);
           for(i=0;i<32;i=i+1) begin
               @(posedge clk) rstn <= 1'b1;wr_rd <= 1'b0;data_in <= i; 
           end      
           @(posedge clk);     
           @(posedge clk);     
           @(posedge clk);     
           $finish;
       end 
endmodule
