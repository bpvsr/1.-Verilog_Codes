`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 07.04.2025 12:45:51
// Design Name: 
// Module Name: tb_divby3
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


module tb_divby3();
    reg  clk ;
    reg  rstn;
    reg  in  ;
    wire out ;
    
    divby3 DUT(
        .clk (clk ),
        .rstn(rstn),
        .in  (in  ),
        .out (out )
    );
      
      
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end  
    initial begin
        @(posedge clk) rstn <= 1'b0;in <= 1'b0;
        @(posedge clk) rstn <= 1'b1;in <= 1'b1;
        @(posedge clk) rstn <= 1'b1;in <= 1'b1;
        @(posedge clk);
        $finish;        
    end  
        
endmodule
