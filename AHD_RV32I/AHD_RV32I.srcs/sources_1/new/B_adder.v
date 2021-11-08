`default_nettype none
`timescale 1ns / 1ps

module B_adder(
    input wire[31:0] curr_PC,Imm,
    output wire[31:0] sum
    );
    
    assign sum = curr_PC + (Imm << 1);
endmodule
