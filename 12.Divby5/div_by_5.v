`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 07.04.2025 16:58:14
// Design Name: 
// Module Name: div_by_5
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


module div_by_5(
    input  wire clk,
    input  wire rstn,
    input  wire din,
    output wire div_by_5
);

    reg [2:0] state,next_state;
    
    parameter R0 = 3'b000;
    parameter R1 = 3'b001;
    parameter R2 = 3'b010;
    parameter R3 = 3'b011;
    parameter R4 = 3'b100;
    
    always@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            state <= R0;
        end else begin
            state <= next_state;
        end
    end
    
    always@* begin
        case(state)
            R0  :   begin
                        if(din)
                            next_state = R1;
                        else 
                            next_state = R0;
            end
            R1  :   begin
                        if(din)
                            next_state = R3;
                        else 
                            next_state = R2;    
            end
            R2  :   begin
                        if(din)
                            next_state = R0;
                        else 
                            next_state = R4; 
            end
            R3  :   begin
                        if(din)
                            next_state = R2;
                        else 
                            next_state = R1;
            end
            R4  :   begin
                        if(din)
                            next_state = R4;
                        else 
                            next_state = R3;
            end  
        endcase
    end
    
    
    assign div_by_5 = (state == R0) ? 1'b1 : 1'b0;
endmodule
