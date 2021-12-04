`default_nettype none
`timescale 1ns / 1ps

module PC_adder(
    input wire clk,rst,pc_en,
    input wire[31:0] imm_in, ALU_res,
    input wire[1:0]PC_src_sel,
    input wire halt,pc_en,
    output wire[31:0] PC_o
    );
    reg[31:0]PC1,PC2;
    reg[31:0]curr_PC, nxt_PC;
            
    always @(posedge clk)begin
    if(!rst)
     if(!halt)curr_PC <= nxt_PC;
     else curr_PC <= curr_PC;
    else curr_PC = 0;
    end
    
    always @* begin
     PC1 = curr_PC + 4;
    end
    
    always @* begin
     PC2 = curr_PC + imm_in;
    end
    
    always @* begin
    case(PC_src_sel)
     2'b00: nxt_PC = PC1;
     2'b01: nxt_PC = PC2;
     2'b10: nxt_PC = ALU_res;
     default:nxt_PC = PC1;
    endcase
    end
       
    assign PC_o = curr_PC;
    
endmodule
