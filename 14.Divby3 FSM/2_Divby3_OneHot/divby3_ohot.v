`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 26.04.2025 20:16:03
// Design Name: 
// Module Name: divby3_ohot
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


module divby3_ohot(
    input  wire clk,
    input  wire rstn,
    input  wire in  ,
    output wire out
    );
    
    reg [2:0] state,next_state;
    parameter IDLE = 3'b001;
    parameter S1   = 3'b010;
    parameter S2   = 3'b100;
    
    always@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            state <= IDLE;
        end else begin
            state <= next_state;            
        end
    end
    
    always@* begin
        case(state)
            IDLE : begin
                       if(in)
                           next_state = S1;
                       else 
                           next_state = IDLE;    
            end
            S1   : begin
                       if(in)
                           next_state = IDLE;
                       else 
                           next_state = S2;                           
            end
            S2   : begin
                       if(in)
                           next_state = S2;
                       else 
                           next_state = S1;                                       
            end
            default: begin
                       next_state = IDLE;
            end   
        endcase
    end
    
    assign out = (state == IDLE)? 1'b1 : 1'b0;
endmodule