`timescale 1ns / 1ps


module inferred_latch(
    input wire clk,
    input wire sig1,sig2,
    output reg[31:0] out,out2,
    input wire[31:0]data_in);
    
    always@(posedge clk)begin
     if(sig1)begin
      out<= data_in;
     end
    
    end
    
    always @* begin
     if(sig2)begin
      out2= data_in;
     end
    end
endmodule
