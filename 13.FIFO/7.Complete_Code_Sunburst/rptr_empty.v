module rptr_empty #(parameter ADDRSIZE = 3)(   
    output reg                 rempty  ,
    output      [ADDRSIZE-1:0] raddr   ,
    output reg  [ADDRSIZE :0]  rptr    ,
    input       [ADDRSIZE :0]  rq2_wptr,
    input       rinc                   , 
    input       rclk                   , 
    input       rrst_n    
);
    reg [ADDRSIZE:0] rbin;
    wire [ADDRSIZE:0] rgraynext, rbinnext;

    //-------------------
    // GRAYSTYLE2 pointer
    //-------------------
    //computing rbinnext and rgraynext and assigning it to 
    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) 
            {rbin, rptr} <= 0;
        else 
            {rbin, rptr} <= {rbinnext, rgraynext};
    end
    // Memory read-address pointer (okay to use binary to address memory)
    assign raddr = rbin[ADDRSIZE-1:0];
    //finding next binary address if rinc = 1 and rempty = 0
    assign rbinnext = rbin + (rinc & ~rempty);
    //finding the gray address 
    assign rgraynext = (rbinnext>>1) ^ rbinnext;
    //---------------------------------------------------------------
    //   FIFO empty when the next rptr == synchronized wptr or on reset
    //---------------------------------------------------------------
    //                   rq2_wptr should be in grey code
    assign rempty_val = (rgraynext == rq2_wptr); 
    
    always @(posedge rclk or negedge rrst_n) begin
        if (!rrst_n) 
            rempty <= 1'b1;
        else 
            rempty <= rempty_val;
    end
    
endmodule