`default_nettype none
`timescale 1ns / 1ps

module PC_adder(
    input wire[31:0] curr_PC,
    output wire[31:0] nxt_PC
    );
    assign nxt_PC = curr_PC + 4;
endmodule
