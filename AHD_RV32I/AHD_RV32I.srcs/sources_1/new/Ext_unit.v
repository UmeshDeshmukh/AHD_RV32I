`default_nettype none
`timescale 1ns / 1ps

localparam  sign_ext = 1;
localparam  zero_ext = 0;

module Ext_unit(
    input wire[19:0]imm,
    input wire ext_op,
    output reg[31:0] ext_out
    );
    always @(*) begin
     if(ext_op)begin
      ext_out = {{12{imm[19]}},{imm[19:0]}};
     end
     else begin
      ext_out = {{12{0}},imm[19:0]};
     end
    end
endmodule
