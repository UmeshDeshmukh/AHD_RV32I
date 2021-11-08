`default_nettype none
`timescale 1ns / 1ps


module MUX32(
    input wire[31:0] mux_in1,
    input wire[31:0] mux_in2,
    output reg[31:0] mux_out,
    input wire m_sel
    );
    
    always @* begin
    if(m_sel)begin
     mux_out = mux_in1;
    end
    else begin
     mux_out = mux_in2;
    end
    end
endmodule
