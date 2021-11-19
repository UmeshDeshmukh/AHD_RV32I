`default_nettype none
`timescale 1ns / 1ps

// Rs1_addr = 0; Rs2_addr = 0; Rs1_data; Rs2_data; Rd_addr = ; Rd_data= ; rf_wr_en = ;
module R_File_tb(
    
    );
reg clk;
wire rf_wr_en;
wire[4:0] Rs1_addr;
wire[4:0] Rs2_addr;
wire[4:0] Rd_addr;
wire[31:0] Rd_data;
reg[31:0] Rs1_data;
reg[31:0] Rs2_data; 

R_File R_File_uut(
.clk(clk),
.rf_wr_en(rf_wr_en),
.Rs1_addr(Rs1_addr),
.Rs2_addr(Rs2_addr),
.Rd_addr(Rd_addr),
.Rd_data(Rd_data),
.Rs1_data(Rs1_data),
.Rs2_data(Rs2_data)
);

always begin : clk_gen
            clk<=0;
            #5
            clk<=1;
            #5;
       end

/*initial begin:TEST_CASES   
 Rs1_addr = 0;
 Rs2_addr = 0;
 Rs1_data;
 Rs2_data;
 Rd_addr = ;
 rf_wr_en = ;
end*/
always  begin
        file_ptr = $fopen("R_File_test_data.txt","r");
        if(file_ptr==0)begin
            $display("can not open test file");
            $finish;
        end
        while(!$feof(file_ptr)) begin
            $fscanf(file_ptr,"%h %h\n",file_din,file_dout);
            assign d_in=file_din;
            #230
            if(d_out!=file_dout) begin
                $display("The test case did not pass, %h!=%h",d_out,file_dout);
                $finish;
            end
        end
        $display("All tests completed successfully");
        $finish;
    end
    
endmodule
