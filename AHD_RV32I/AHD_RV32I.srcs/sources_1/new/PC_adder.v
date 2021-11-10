`default_nettype none
`timescale 1ns / 1ps

module PC_adder(
    input wire clk,
    input wire[31:0] imm, ALU_res,
    output wire[31:0] curr_PC,
    input wire[31:0] nxt_PC
    );
    wire[31:0]PC1,PC2;
    
    always @(posedge clk)begin
     curr_PC = nxt_PC;
    end
    
    always @* begin
     PC1 = curr_PC + 4;
    end
    
    always @* begin
     PC2 = curr_PC + imm;
    end
endmodule
