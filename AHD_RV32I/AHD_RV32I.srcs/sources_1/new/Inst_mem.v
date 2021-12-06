`default_nettype none
`timescale 1ns / 1ps

module Inst_mem(
    input wire clk,
    input wire[31:0] Inst_addr,
    output reg[31:0] Inst 
    );
    reg[31:0]IMem[511:0];
    initial begin
     $readmemh("i_mem.mem",IMem);
    end
    always @(posedge clk)begin
     Inst <= IMem[Inst_addr]; 
    end
endmodule
