`default_nettype none
`timescale 1ns / 1ps

module Data_mem(
    input wire clk, DMem_wr_en,
    input wire[3:0] byte_en,
    input wire[31:0] Data_addr,
    input wire[31:0] DMem_wr_data,
    output wire[31:0] DMem_rd_data 
    );
    
    
    
    parameter DMem_size = 2048;
    
    reg[7:0] DMem0[127:0];
    reg[7:0] DMem1[127:0];
    reg[7:0] DMem2[127:0];
    reg[7:0] DMem3[127:0];
        
    //synchronous memory write 
    always @(posedge clk)begin
     if(DMem_wr_en)begin
      if(byte_en[0])DMem0[Data_addr] <= DMem_wr_data[07:00];
      if(byte_en[1])DMem1[Data_addr] <= DMem_wr_data[15:08];
      if(byte_en[2])DMem2[Data_addr] <= DMem_wr_data[23:16];
      if(byte_en[3])DMem3[Data_addr] <= DMem_wr_data[31:24]; 
     end
    end 
    //asynchronous memory read
    assign DMem_rd_data = {DMem3[Data_addr],DMem2[Data_addr],DMem1[Data_addr],DMem0[Data_addr]};
endmodule
