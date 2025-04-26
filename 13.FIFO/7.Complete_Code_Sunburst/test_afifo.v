`timescale 1ns / 1ps

module test_afifo();

    parameter DSIZE1 = 8;
    parameter ASIZE1 = 4;

    wire [DSIZE1-1:0] rdata   ;
    wire wfull                ;
    wire rempty               ;
    reg [DSIZE1-1:0] wdata    ;
    reg winc                  ; 
    reg wclk                  ;  
    reg wrst_n                ;
    reg rinc                  ; 
    reg rclk                  ; 
    reg rrst_n                ;

 fifo1 #(DSIZE1,ASIZE1) DUT ( 
                    .rdata (rdata  )  ,
                    .wfull (wfull  )  ,
                    .rempty(rempty )  ,
                    .wdata (wdata  )  ,
                    .winc  (winc   )  , 
                    .wclk  (wclk   )  , 
                    .wrst_n(wrst_n )  ,
                    .rinc  (rinc   )  , 
                    .rclk  (rclk   )  , 
                    .rrst_n(rrst_n )
                 );
                 
    initial
    begin
        rclk  = 1'b0;
        forever #5 rclk = ~rclk;
    end                 
    
    initial
    begin
        wclk  = 1'b0;
        forever #5 wclk = ~wclk;
    end

    task reset();
    begin
        fork
        @(posedge rclk) rrst_n <= 1'b0;
        @(posedge wclk) wrst_n <= 1'b0;
        join 
    end    
    endtask
    
    task write2fifo(input [DSIZE1-1:0] datain);
    begin
        @(posedge wclk) wrst_n <= 1'b1;winc <= 1'b1;wdata <= datain;rinc <= 1'b0;
        
    end    
    endtask
    
    task read4mfifo();
    begin
        @(posedge rclk) rrst_n <= 1'b1;rinc <= 1'b1;winc <= 1'b0;
    end    
    endtask
    
    integer i,j;
    initial
    begin
        reset();
        for(i=0;i<16;i=i+1) begin
            write2fifo(i);
        end
        for(j=0;j<16;j=j+1) begin
            read4mfifo();
        end
        $finish;
    end                 
    
endmodule
