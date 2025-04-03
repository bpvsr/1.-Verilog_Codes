module adder(
    output wire carry,sum,
    input a,b,c
);
	  wire sum1,carry1;
     assign sum1   = a ^ b ^ c;
     assign carry1 = (a&b) | (b&c) | (c&a);
	  
	  assign sum   = sum1;
	  assign carry = carry1;
	  
  
endmodule