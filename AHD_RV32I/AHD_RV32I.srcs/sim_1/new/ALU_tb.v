`default_nettype none
`timescale 1ns / 1ps


module ALU_tb(

    );
    reg clk;
    reg[31:0] input1;
    reg[31:0] input2; 
    reg[31:0] result_out;
    reg zero;
    reg[3:0] ALU_op;
    
    ALU UUT(.input1(input1),
    .input2(input2), 
    .result_out(result_out),
    .zero(zero),
    .ALU_op(ALU_op));
    
    always @* begin
    input1 = 32'habcd;
    input2 = 32'h1234;
    #5
    ALU_op = 4'b0000;
    #5             
    ALU_op = 4'b1001;
    #5             
    ALU_op = 4'b0111;
    #5             
    ALU_op = 4'b0110;
    #5             
    ALU_op = 4'b0100;
    #5             
    ALU_op = 4'b0010;
    #5             ;
    ALU_op = 4'b0011;
    #5             
    ALU_op = 4'b0101;
    #5             
    ALU_op = 4'b1000;
    #5             
    ALU_op = 4'b1010;
    #5             ;
    ALU_op = 4'b1011;
    #5             
    ALU_op = 4'b1101;
    #5             
    ALU_op = 4'b1100;
    
    end
endmodule
