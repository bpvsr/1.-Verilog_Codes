`timescale 1ns / 1ps

module step_1(
    input     wire    [7:0] a,
    input     wire    [7:0] b,
    input     wire    cin,
    output    wire    [8:0] sum,
    output    wire    carry
);
              
 wire  [1:0] temp [8:0] ;
         
 assign  temp[0] = {2{cin}}; 
 kgp_adder_gen g1({cin,cin},{a[0],b[0]},temp[1]);
 kgp_adder_gen g2({a[0],b[0]},{a[1],b[1]},temp[2]);
 kgp_adder_gen g3({a[1],b[1]},{a[2],b[2]},temp[3]);
 kgp_adder_gen g4({a[2],b[2]},{a[3],b[3]},temp[4]);
 kgp_adder_gen g5({a[3],b[3]},{a[4],b[4]},temp[5]);
 kgp_adder_gen g6({a[4],b[4]},{a[5],b[5]},temp[6]);
 kgp_adder_gen g7({a[5],b[5]},{a[6],b[6]},temp[7]);
 kgp_adder_gen g8({a[6],b[6]},{a[7],b[7]},temp[8]);
 
 wire [1:0] temp1 [8:0] ;
 assign temp1[0] = temp[0] ;
 assign temp1[1] = temp[1] ;
 kgp_adder_gen g9(temp[0],temp[2],temp1[2]);
 kgp_adder_gen g10(temp[1],temp[3],temp1[3]);
 kgp_adder_gen g11(temp[2],temp[4],temp1[4]);
 kgp_adder_gen g12(temp[3],temp[5],temp1[5]);
 kgp_adder_gen g13(temp[4],temp[6],temp1[6]);
 kgp_adder_gen g14(temp[5],temp[7],temp1[7]);
 kgp_adder_gen g15(temp[6],temp[8],temp1[8]);
 
 wire [1:0] temp2 [8:0];
 assign temp2[0] = temp1[0];
 assign temp2[1] = temp1[1];
 assign temp2[2] = temp1[2];
 assign temp2[3] = temp1[3];
 kgp_adder_gen g16(temp1[0],temp1[4],temp2[4]);
 kgp_adder_gen g17(temp1[1],temp1[5],temp2[5]);
 kgp_adder_gen g18(temp1[2],temp1[6],temp2[6]);
 kgp_adder_gen g19(temp1[3],temp1[7],temp2[7]);
 kgp_adder_gen g20(temp1[4],temp1[8],temp2[8]);
 
 assign carry=temp2[8][0] ;
 assign sum[0] = (|temp2[0])^a[0]^b[0] ;
 assign sum[1] = (|temp2[1])^a[1]^b[1] ;
 assign sum[2] = (|temp2[2])^a[2]^b[2] ;
 assign sum[3] = (|temp2[3])^a[3]^b[3] ;
 assign sum[4] = (|temp2[4])^a[4]^b[4] ;
 assign sum[5] = (|temp2[5])^a[5]^b[5] ;
 assign sum[6] = (|temp2[6])^a[6]^b[6] ;
 assign sum[7] = (|temp2[7])^a[7]^b[7] ;
 assign sum[8] = temp2[8][0];
 
endmodule
    