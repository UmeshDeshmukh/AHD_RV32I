`default_nettype none
`timescale 1ns / 1ps

module R_File(
    input wire clk,
    input wire rf_wr_en,rf_en,
    
    input wire[4:0] Rs1_addr,
    input wire[4:0] Rs2_addr,
    input wire[4:0] Rd_addr,
    
    input wire[31:0] Rd_data,
    output wire[31:0] Rs1_data,
    output wire[31:0] Rs2_data
    );
    
    reg[31:0] reg_file[31:0];

    
    /*always @(posedge clk)begin
     
     if(rf_wr_en) begin
      if(Rd_addr != 0)begin
       reg_file[Rd_addr] <= Rd_data;
      end
      else begin
       reg_file[0] <= 0;
      end
     end
     else begin
      if(Rs1_addr == 0)begin
       Rs1_data <= 0;
      end
      else begin
       Rs1_data <= reg_file[Rs1_addr];
      end
     
      if(Rs2_addr == 0)begin
       Rs2_data <= 0;
      end
      else begin
       Rs2_data <= reg_file[Rs2_addr];
      end 
     end
     
    end*/
    
    
    always @(posedge clk)begin
     
     if(rf_wr_en && rf_en) begin
      if(Rd_addr != 0)begin
       reg_file[Rd_addr] <= Rd_data;
      end
      else begin
       reg_file[0] <= 0;
      end
     end
    end 
    
    assign Rs1_data = reg_file[Rs1_addr];
    assign Rs2_data = reg_file[Rs2_addr];    
endmodule
