`timescale 1ns / 1ps


module kgp_adder_gen(
    input  wire [1:0] a   ,
    input  wire [1:0] b   ,
    output reg  [1:0] c   
);
always@*  begin
    case({a[1],a[0],b[1],b[0]})
        4'b0000 : c=2'b00;
        4'b0001 : c=2'b00;
        4'b0010 : c=2'b00;
        4'b0011 : c=2'b11;
        4'b0100 : c=2'b00;
        4'b0101 : c=2'b01;
        4'b0110 : c=2'b01;
        4'b0111 : c=2'b11;
        4'b1000 : c=2'b00;
        4'b1001 : c=2'b01;
        4'b1010 : c=2'b01;
        4'b1011 : c=2'b11;
        4'b1100 : c=2'b00;
        4'b1101 : c=2'b11;
        4'b1110 : c=2'b11;
        4'b1111 : c=2'b11;
        default : c=2'b00;
    endcase   
end
endmodule
