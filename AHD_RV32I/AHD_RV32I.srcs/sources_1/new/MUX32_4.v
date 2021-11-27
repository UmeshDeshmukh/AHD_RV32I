`default_nettype none
`timescale 1ns / 1ps

module MUX32_4(
    input wire[1:0] m4_sel, 
    input wire[31:0] mux4_in1,
    input wire[31:0] mux4_in2,
    input wire[31:0] mux4_in3,
    input wire[31:0] mux4_in4,
    output reg[31:0] mux4_out    
    );
    always @* begin
     case(m4_sel[1:0])
      2'b00: mux4_out = mux4_in1;
      2'b01: mux4_out = mux4_in2;
      2'b10: mux4_out = mux4_in3;
      2'b11: mux4_out = mux4_in4;
     endcase
    end
endmodule
