`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: Bharadwaja Pisupati
// 
// Create Date: 07.04.2025 14:38:41
// Design Name: 
// Module Name: divby4
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


module divby4(
    input  wire clk,
    input  wire rstn,
    input  wire din,
    output wire detect_divby4
    );
    
    reg [1:0] state,next_state;
    
    parameter S0 = 2'b00;
    parameter S1 = 2'b01;
    parameter S2 = 2'b10;
    parameter S3 = 2'b11;
    
    
    always@(posedge clk or negedge rstn) begin
        if(!rstn) begin
            state <= S0;
        end else begin
            state <= next_state;
        end
    end
    
    always@* begin
        case(state)
            S0  :   begin
                        if(din) 
                            next_state = S1;
                        else 
                            next_state = S0;
            end
            S1  :   begin
                        if(din) 
                            next_state = S3;
                        else 
                            next_state = S2;
            end
            S2  :   begin
                        if(din)
                            next_state = S1;
                        else 
                            next_state = S0; 
            end
            S3  :   begin
                        if(din)
                            next_state = S3;
                        else 
                            next_state = S2;      
            end
            default : begin
                          next_state = S0;
            end     
        endcase
    end
    
    
    assign detect_divby4 = (state == S0) ? 1'b1:1'b0;
endmodule
