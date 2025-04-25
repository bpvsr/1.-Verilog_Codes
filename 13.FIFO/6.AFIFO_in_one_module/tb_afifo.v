`timescale 1ns / 1ps
module tb_afifo();

                reg wclk         ;
                reg rclk         ;
                reg wrstn        ;
                reg rrstn        ;
                reg wr_en        ;
                reg rd_en        ;
                reg [3:0] data_in;
                wire full        ;
                wire empty       ;
                wire [3:0] data_out    ; 

    afifo DUT(  .wclk    (wclk    )        ,
                .rclk    (rclk    )        ,
                .wrstn   (wrstn   )        ,
                .rrstn   (rrstn   )        ,
                .wr_en   (wr_en   )        ,
                .rd_en   (rd_en   )        ,
                .data_in (data_in )        ,
                .full    (full    )        ,
                .empty   (empty   )        ,
                .data_out(data_out)   
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
                 @(posedge rclk) rrstn <= 1'b0;
                 @(posedge wclk) wrstn <= 1'b0;
                 join 
             end    
             endtask
             
             task write2fifo(input [3:0] datain);
             begin
                 @(posedge wclk) wrstn <= 1'b1;wr_en <= 1'b1;data_in <= datain;rd_en <= 1'b0;
             end    
             endtask
             
             task read4mfifo();
             begin
                 @(posedge rclk) wrstn <= 1'b1;rd_en <= 1'b1;wr_en <= 1'b0;
             end    
             endtask
             
             integer i,j;
             initial
             begin
                 reset();
                 for(i=0;i<8;i=i+1) begin
                     write2fifo(i);
                 end
                 for(j=0;j<8;j=j+1) begin
                     read4mfifo();
                 end
                 $finish;
             end                 
             
                 
endmodule
