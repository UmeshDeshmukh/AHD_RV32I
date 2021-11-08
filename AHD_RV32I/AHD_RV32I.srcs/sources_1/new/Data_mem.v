`default_nettype none
`timescale 1ns / 1ps

module Data_mem(
    input wire DMem_wr_en,
    input wire[31:0] Data_addr,
    input wire[31:0] DMem_wr_data,
    output reg[31:0] DMem_rd_data 
    );
    
endmodule
