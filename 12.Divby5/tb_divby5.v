`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 07.04.2025 17:05:45
// Design Name: 
// Module Name: tb_divby5
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


module tb_divby5();

   
    reg  clk     ;
    reg  rstn    ;
    reg  din     ;
    wire div_by_5;


    div_by_5 DUT(
        .clk     (clk     ),
        .rstn    (rstn    ),
        .din     (din     ),
        .div_by_5(div_by_5)
    );
    
    initial begin
        clk = 1'b0;
        forever #5 clk = ~clk;
    end

    initial begin
        @(posedge clk) rstn = 1'b0;din = 1'b0;
        @(posedge clk) rstn = 1'b1;din = 1'b1;
        @(posedge clk) rstn = 1'b1;din = 1'b0;
        @(posedge clk) rstn = 1'b1;din = 1'b1;
        @(posedge clk) rstn = 1'b1;din = 1'b0;
        @(posedge clk) rstn = 1'b1;din = 1'b0;
        @(posedge clk);
        $finish;
    end
    
endmodule
