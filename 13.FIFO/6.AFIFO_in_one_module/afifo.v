`timescale 1ns / 1ps
module afifo(   input wire wclk,
                input wire rclk,
                input wire wrstn,
                input wire rrstn,
                input wire wr_en,
                input wire rd_en,
                input  wire [3:0] data_in,
                output reg full,
                output reg empty,
                output wire [3:0] data_out   
             );
    
    reg [4:0] rptr_d1,rptr_d2;
    reg [4:0] wptr_d1,wptr_d2;
    //4
    //Write pointer and Write  
    reg [4:0] wbin,wpntr;
    wire [4:0] wgraynext,wbinnext;
    wire [3:0] waddr;
    wire wfull;

    
     reg [4:0] rbin,rpntr;
     wire [4:0] rgraynext,rbinnext;
     wire [3:0] raddr;
     wire rempty;
     //reg empty;

    reg [3:0] mem [0:15];
    always@(posedge wclk or negedge wrstn) begin
       if(!wrstn) begin
           wbin   <= {5{1'b0}};
           wpntr  <= {5{1'b0}};
           full   <= 1'b0; 
       end else begin
           wbin   <= wbinnext ;
           wpntr  <= wgraynext;
           full   <= wfull;
       end 
    end
    assign wbinnext  = wbin + (wr_en);
    assign wgraynext = (wbinnext>>1) ^  wbinnext;
    assign waddr     = wbin[3:0];
    //Full signal     
    assign wfull = (wgraynext == {~rptr_d2[4:3],rptr_d2[2:0]}) ? 1'b1  :   1'b0;
    //Read pointer and Read  
     always@(posedge rclk or negedge rrstn) begin
       if(!rrstn) begin
           rbin   <= {5{1'b0}};
           rpntr  <= {5{1'b0}};
           empty  <= 1'b1; 
       end else begin
           rbin   <= rbinnext ;
           rpntr  <= rgraynext;
           empty  <= rempty   ; 
       end 
    end
    assign rbinnext  = rbin + (rd_en && ~empty);
    assign rgraynext = (rbinnext>>1) ^  rbinnext;
    assign raddr     = rbin[3:0];
    //Empty signal is pending    
        
    assign rempty = (rgraynext == wptr_d2) ? 1'b1 : 1'b0; 
    
    always@(posedge wclk or negedge wrstn) begin
        if(!wrstn) begin
           rptr_d1 <= 0;
           rptr_d2 <= 0;
         end else begin
           rptr_d1 <= rpntr;
           rptr_d2 <= rptr_d1;        
        end
    end    
    
    always@(posedge rclk or negedge rrstn) begin
        if(!rrstn) begin
           wptr_d1 <= 0;
           wptr_d2 <= 0;
         end else begin
           wptr_d1 <= wpntr;
           wptr_d2 <= wptr_d1;        
        end
    end
    always@(posedge wclk) begin
        if(wr_en && ~full) begin
            mem[waddr] <= data_in;
        end    
    end
    
    assign data_out = mem[raddr];
    
    
endmodule
