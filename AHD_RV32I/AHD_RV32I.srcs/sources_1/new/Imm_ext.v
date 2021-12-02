`default_nettype none
`timescale 1ns / 1ps

module Imm_ext(
    input wire[31:0] imm_i_type_i,
    input wire[31:0] imm_s_type_i,
    input wire[31:0] imm_b_type_i,
    input wire[31:0] imm_u_type_i,
    input wire[31:0] imm_j_type_i, 
    input wire[11:0] imm_in,
    output reg[31:0] imm_out,
    input wire[2:0] imm_sel
    );
    //assign imm_out = {{20{0}},imm_in};
    always @* begin
     case(imm_sel)
      3'b001:imm_out <= imm_i_type_i; 
      3'b010:imm_out <= imm_s_type_i;
      3'b011:imm_out <= imm_b_type_i; 
      3'b100:imm_out <= imm_u_type_i;
      3'b101:imm_out <= imm_j_type_i;
      default:imm_out <= imm_i_type_i;
     endcase    
    end
    
endmodule
