`timescale 1ns / 1ps
module bin2gray #(parameter WIDTH = 4)(
    input  [WIDTH-1:0] in,
    output [WIDTH-1:0] out   
);
    assign out[WIDTH-1] = in[WIDTH-1];
    genvar i;
    generate
        for(i=WIDTH-2;i>=0;i=i-1) begin
            assign out[i] = in[i+1] ^ in[i];
        end
    endgenerate
endmodule
