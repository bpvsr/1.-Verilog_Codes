`timescale 1ns / 1ps
module tb();

reg clk;
reg rstn;
reg [7:0] divisor;
reg [7:0] dividend;
wire [7:0] quotient;
wire [7:0] remainder;

controller DUT(clk,rstn,divisor,dividend,quotient,remainder);

initial
begin
    clk = 1'b0;
    forever #5 clk = ~clk;
end

initial
begin
    rstn = 1'b0;
    #10;
    rstn = 1'b1;
    dividend = 8'hFF;
    divisor = 8'd3;
    #10;
end

initial
begin
    #120 $finish;
end

endmodule
