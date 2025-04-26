//Read to write domain synchronizer 
module sync_r2w #(parameter ADDRSIZE = 4)
                 (  output reg [ADDRSIZE:0] wq2_rptr,
                    input [ADDRSIZE:0] rptr,
                    input wclk, wrst_n
                 );
                reg [ADDRSIZE:0] wq1_rptr;
                always @(posedge wclk or negedge wrst_n) begin
                    if (!wrst_n) begin 
                        {wq2_rptr,wq1_rptr} <= 0;
                    end else begin 
                        {wq2_rptr,wq1_rptr} <= {wq1_rptr,rptr};
                    end    
                end
endmodule