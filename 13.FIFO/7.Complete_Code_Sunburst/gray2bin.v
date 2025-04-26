`timescale 1ns / 1ps
module gray2bin #(parameter WIDTH = 4)(
    input  [WIDTH-1:0] g,
    output [WIDTH-1:0] b
    );
    
    assign b[WIDTH-1] = g[WIDTH-1];
    
    genvar i;
    generate
        for(i=WIDTH-2;i>=0;i=i-1)
        begin
            assign b[i] = b[i+1] ^ g[i]; 
        end
    endgenerate
endmodule
