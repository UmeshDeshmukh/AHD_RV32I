`default_nettype none
`timescale 1ns / 1ps

module Data_mem(
    input wire clk, DMem_wr_en,
    input wire[31:0] Data_addr,
    input wire[31:0] DMem_wr_data,
    output reg[31:0] DMem_rd_data 
    );
    reg[31:0] DMem[127:0];
    
    always @(posedge clk)begin
     if(DMem_wr_en)begin
      DMem[Data_addr] <= DMem_wr_data;
     end
     else begin
      DMem_rd_data <= DMem[Data_addr];
     end
    end 
endmodule
