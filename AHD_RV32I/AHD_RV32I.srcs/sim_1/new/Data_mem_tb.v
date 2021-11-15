`default_nettype none
`timescale 1ns / 1ps

module Data_mem_tb(

    );

wire clk, DMem_wr_en;
wire[3:0] byte_en;
wire[31:0] Data_addr;
wire[31:0] DMem_wr_data;
wire[31:0] DMem_rd_data; 

Data_mem Data_mem_uut(
.clk(clk), 
.DMem_wr_en(DMem_wr_en),
.DMem_wr_en(DMem_wr_en),
.byte_en(byte_en),
.Data_addr(Data_addr),
.DMem_wr_data(DMem_wr_data),
.DMem_rd_data(DMem_rd_data));



endmodule