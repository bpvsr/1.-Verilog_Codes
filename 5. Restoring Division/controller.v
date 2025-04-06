`timescale 1ns / 1ps
module controller(input clk, input rstn, input [7:0] divisor, input [7:0] dividend,output reg [7:0] quotient, output reg [7:0] remainder );

parameter s0 = 2'b00, s1 = 2'b01, s2 = 2'b10, s3 = 2'b11;
reg load_start,load_mid,en;
wire count_full,out_m;
wire [2:0] count;
wire [7:0] ls_a,ls_q;
wire [7:0] out_a,out_q;
wire [7:0] out_q1,out_a1,out_sub;
reg [1:0] state,next_state;

load_reg1 one(clk,rstn,load_start,load_mid,dividend,divisor,out_a1,out_q1,out_a,out_q,out_m);
lshift two(out_a,out_q,ls_a,ls_q );
two_comp three(ls_a,divisor,out_sub );
counter four(clk,rstn,en,count,count_full);
select_mux five({ls_q[7:1],1'b0},{ls_q[7:1],1'b1},out_sub[7],out_q1);//out_q1 
select_mux six(ls_a,out_sub,out_sub[7],out_a1);// out_a1

always@(posedge clk or negedge rstn)
begin
    if(!rstn)
        state <= s0;
    else 
        state <= next_state;    
end

always@(*)
begin
    if(!rstn)
    begin
    load_start = 1'b0;
    load_mid = 1'b0;
    en = 1'b0;
    end
    else 
    begin
        case(state)
            s0  :   begin
                       load_start = 1'b0;
                       load_mid = 1'b0;
                       en = 1'b0;
                       next_state = s1;          
                    end
            s1  :  begin
                       load_start = 1'b1;
                       load_mid = 1'b0;
                       en = 1'b1;
                       next_state = s2;                      
                   end        
            s2 :   begin
                        if(count_full)
                        begin
                            next_state = s3;
                        end     
                        else 
                        begin
                            next_state = s2;
                           load_start = 1'b0;
                           load_mid = 1'b1;
                           en = 1'b1;
                        end    
                    end
            s3  :   begin
                       load_start = 1'b0;
                       load_mid = 1'b0;
                       en = 1'b0;
                       quotient = out_q;
                       remainder = out_a;                         
                    end                
        endcase
    end
end
endmodule
