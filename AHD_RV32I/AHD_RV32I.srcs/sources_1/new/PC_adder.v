`default_nettype none
`timescale 1ns / 1ps

module PC_adder(
    input wire clk,
    input wire[31:0] imm, ALU_res,
    output reg[31:0] curr_PC,
    input wire[1:0]PC_src_sel,
    input wire halt
    );
    reg[31:0]PC1,PC2;
    reg[31:0] nxt_PC;
    always @(posedge clk)begin
     if(!halt)curr_PC <= nxt_PC;
    end
    
    always @* begin
     PC1 = curr_PC + 4;
    end
    
    always @* begin
     PC2 = curr_PC + imm;
    end
    
    always @* begin
    case(PC_src_sel)
     2'b00: nxt_PC = PC1;
     2'b01: nxt_PC = PC2;
     2'b10: nxt_PC = ALU_res;
     default:nxt_PC = PC1;
    endcase
    end
       
    
endmodule
