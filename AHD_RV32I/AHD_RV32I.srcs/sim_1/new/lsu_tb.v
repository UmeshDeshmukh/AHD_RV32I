`default_nettype none
`timescale 1ns / 1ps

module lsu_tb(

    );

wire[1:0] data_type;
wire lsu_op,sign_ext;
wire[31:0]write_data;
wire[31:0]address_i;
 reg[31:0]read_data_o;
//Memory side signals
wire wr_en;
wire[31:0]read_data_i;
 reg[3:0] byte_en;
 reg[31:0] address_o;
 reg[31:0]write_data_o;
     
   
lsu lsu_uut(.data_type(),
.lsu_op(),.sign_ext(),
.write_data(),
.address_i(),
.read_data_o(),
//Memory side signals
.wr_en(),
.read_data_i(),
.byte_en(),
.address_o(),
.write_data_o());    



    
endmodule
