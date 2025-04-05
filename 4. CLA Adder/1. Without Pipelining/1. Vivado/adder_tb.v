`timescale 1ns / 1ps


module adder_tb();
    reg [7:0] a           ;
    reg [7:0] b           ;
    reg cin               ;
    wire [8:0] sum        ;
    wire carry            ;

    step_1  DUT  (
        .   a     (a    )      ,
        .   b     (b    )      ,
        .   cin   (cin  )      ,
        .   sum   (sum  )      ,
        .   carry (carry)     
    );
 
    integer i;
    initial begin
        for(i=0;i<10;i=i+1) begin
            a={$random}%256;
            b={$random}%256;
            cin={$random}%2;
            #10;
            compare();
        end
    $finish(0);
    end
    
    task compare();
    begin
 /*    #10;
    $display("a = %0d b = %0d cin = %0d, sum = %0d, a+b+cin = %0d",a,b,cin,sum,a+b+cin);*/
        if(sum == a+b+cin)
    begin
        $display("################################");
        $display("Code Working Perfect Hurray....!");
        //$display("computed = %0d actual = %0d",computed,actual);
        $display("################################");
    end
    else
    begin 
        $display("################################");        
        $display("Wrong Output..... !");  
        //$display("computed = %0d actual = %0d",computed,actual);      
        $display("################################");    
    end
    end
    endtask             
/*initial
    begin
    $monitor("a=%b b=%b ",a,b);
    end*/
endmodule
