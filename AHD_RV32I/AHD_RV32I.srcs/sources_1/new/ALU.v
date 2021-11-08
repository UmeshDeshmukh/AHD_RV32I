`default_nettype none
`timescale 1ns / 1ps

module ALU(
    input wire[31:0] input1,
    input wire[31:0] input2, 
    output reg[31:0] result_out,
    input wire[3:0] ALU_op
    );
    always @*begin
    case(ALU_op)
     4'b0000: result_out = input1 + input2; //ADD ADDI
     4'b1001: result_out = input1 - input2; //SUB
     4'b0111: result_out = input1 & input2; //AND ANDI
     4'b0110: result_out = input1 | input2; //OR ORI
     4'b0100: result_out = input1 ^ input2; //XOR XORI
     4'b0010: result_out = (input1 < input2)?1:0; //SLT set less than
    endcase
    end
    
    
endmodule
