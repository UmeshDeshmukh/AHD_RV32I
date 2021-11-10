`default_nettype none
`timescale 1ns / 1ps

module Imm_ext(
    input wire[11:0] imm_in,
    output wire[31:0] imm_out
    );
    assign imm_out = {{20{0}},imm_in};
endmodule
