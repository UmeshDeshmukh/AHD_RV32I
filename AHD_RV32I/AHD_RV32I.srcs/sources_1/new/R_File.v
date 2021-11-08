`default_nettype none
`timescale 1ns / 1ps

module R_File(
    input wire clk,
    input wire[4:0] Rs1_addr,
    input wire[4:0] Rs2_addr,
    input wire[4:0] Rd_addr,
    
    input wire[31:0] Rd_data[31:0],
    output reg[31:0] Rs1_data[31:0],
    output reg[31:0] Rs2_data[31:0]
    );
    
    reg[31:0] reg_file[31:0];
 //   reg_file[00] <= 32'b0000;
/*    reg_file[01] <= 0;
    reg_file[02] <= 0;
    reg_file[03] <= 0;
    reg_file[04] <= 0;
    reg_file[05] <= 0;
    reg_file[06] <= 0;
    reg_file[07] <= 0;
    reg_file[08] <= 0;
    reg_file[09] <= 0;
    reg_file[10] <= 0;
    reg_file[11] <= 0;
    reg_file[12] <= 0;
    reg_file[13] <= 0;
    reg_file[14] <= 0;
    reg_file[15] <= 0;
    reg_file[16] <= 0;
    reg_file[17] <= 0;
    reg_file[18] <= 0;
    reg_file[19] <= 0;
    reg_file[20] <= 0;
    reg_file[21] <= 0;
    reg_file[22] <= 0;
    reg_file[23] <= 0;
    reg_file[24] <= 0;
    reg_file[25] <= 0;
    reg_file[26] <= 0;
    reg_file[27] <= 0;
    reg_file[28] <= 0;
    reg_file[29] <= 0;
    reg_file[30] <= 0;
    reg_file[31] <= 0;*/
    
    always @(posedge clk)begin
     
     if(Rs1_addr == 0)begin
      Rs1_data <= 0;
     end
     else begin
      Rs1_data <= reg_file[Rs1_addr];
     end
     
     if(Rs2_addr == 0)begin
      Rs2_data <= 0;
     end
     else begin
      Rs2_data <= reg_file[Rs2_addr];
     end 
     
     if(Rd_addr != 0)begin
      reg_file[Rd_addr] <= Rd_data;
     end
     else begin
      
     end
    end
    
endmodule
