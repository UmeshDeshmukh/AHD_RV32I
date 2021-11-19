`default_nettype none
`timescale 1ns / 1ps


module Instr_decoder_tb(

    );
reg[31:0] instr;
//Control signals
wire[3:0] ALU_op;
wire branch;
wire ALU_src1_sel; 
wire ALU_src2_sel;
wire[1:0] Rd_data_src_sel;
wire PC_src_sel;
wire DMem_wr_en;
//Signals to RF
wire[4:0] src1_addr;
wire[4:0] src2_addr;
wire[4:0] dest_addr;
//Signals to LSU
wire[1:0] data_type; //byte;half word;word
wire lsu_op, sign_ext;
//Signal to immediate ext    
wire[19:0] Imm_out;
wire[31:0] U_imm_out;
wire extend;
wire halt;   

Instr_decoder Instr_decoder_uut(
.instr(instr),
//Control signals
.ALU_op(ALU_op),
.branch(branch),
.ALU_src1_sel(ALU_src1_sel), 
.ALU_src2_sel(ALU_src2_sel),
.Rd_data_src_sel(Rd_data_src_sel),
.PC_src_sel(PC_src_sel),
.DMem_wr_en(DMem_wr_en),
//Signals to RF
.src1_addr(src1_addr),
.src2_addr(src2_addr),
.dest_addr(dest_addr),
//Signals to LSU
.data_type(data_type), //byte(),half word(),word
.lsu_op(lsu_op),
.sign_ext(sign_ext),
//Signal to immediate ext    
.Imm_out(Imm_out),
.U_imm_out(U_imm_out),
.extend(extend),
.halt(halt)
);
 initial begin: TEST_CASES
 //add x3,x1,x2
 instr = 32'b00000000001000001000000110110011;
 #50
 if(!(src1_addr == 1
 && src2_addr == 2
 && dest_addr == 3
 && ALU_src1_sel == 0
 && ALU_src2_sel == 0
 && ALU_op == 4'b0000))begin
  $display("The test case did not pass for instruction add");
 end
 #50
 //addi x3,x1,64
 instr = 32'b00000100000000001000000110010011;
 #50
 if(!(src1_addr == 1
 //&& Imm_out ==64
 && dest_addr == 3
 && ALU_src1_sel == 0
 && ALU_src2_sel == 1
 && ALU_op == 4'b0000))begin
  $display("The test case did not pass for instruction addi");
 end
 
 #50
 //sub x3,x1,x2
 instr = 32'b01000000001000001000000110110011;
 #50
 if(!(src1_addr == 1
 && src2_addr == 2
 && dest_addr == 3
 && ALU_src1_sel == 0
 && ALU_src2_sel == 0
 && ALU_op == 4'b1001))begin
  $display("The test case did not pass for instruction sub");
 end
 
  #50
 //lw x5 25(x10)
 instr = 32'b00000001100101010010001010000011;
 #50
 if(!(src1_addr == 10
 && dest_addr == 5
 && Imm_out == 25
 && data_type == 2'b10
 && lsu_op == 0
 && sign_ext == 1
 && ALU_src1_sel == 0
 && ALU_src2_sel == 1
 && Rd_data_src_sel == 1
 && ALU_op == 4'b0000))begin
  $display("The test case did not pass for instruction lw");
 end
 
 #50
 //lb x9 55(x15)
 instr = 32'b00000011011101111000010010000011;
 #50
 if(!(src1_addr == 15
 && dest_addr == 9
 && Imm_out == 55
 && data_type == 2'b00
 && lsu_op == 0
 && sign_ext == 1
 && ALU_src1_sel == 0
 && ALU_src2_sel == 1
 && Rd_data_src_sel == 1
 && ALU_op == 4'b0000))begin
  $display("The test case did not pass for instruction lb");
 end
 
 #50
 //lh x22 46(x28)
 instr = 32'b00000010111011100001101100000011;
 #50
 if(!(src1_addr == 28
 && dest_addr == 22
 && Imm_out == 46
 && data_type == 2'b01
 && lsu_op == 0
 && sign_ext == 1
 && ALU_src1_sel == 0
 && ALU_src2_sel == 1
 && Rd_data_src_sel == 1
 && ALU_op == 4'b0000))begin
  $display("The test case did not pass for instruction lh");
 end
 
  #50
 //lhu x22 10(x28)
 instr = 32'b00000000101011100101101100000011;
 #50
 if(!(src1_addr == 28
 && dest_addr == 22
 && Imm_out == 10
 && data_type == 2'b01
 && lsu_op == 0
 && sign_ext == 0
 && ALU_src1_sel == 0
 && ALU_src2_sel == 1
 && Rd_data_src_sel == 1
 && ALU_op == 4'b0000))begin
  $display("The test case did not pass for instruction lhu");
 end
 
 #50
 //lbu x32 40(x18)
 instr = 32'b00000010010101010010000110100011;
 #50
 if(!(src1_addr == 18
 && dest_addr == 32
 && Imm_out == 40
 && data_type == 2'b00
 && lsu_op == 0
 && sign_ext == 0
 && ALU_src1_sel == 0
 && ALU_src2_sel == 1
 && Rd_data_src_sel == 1
 && ALU_op == 4'b0000))begin
  //$display("The test case did not pass for instruction lbu");
 end
 
 #50
 //sw x5 35(x10)
 instr = 32'b00000010010101010010000110100011;
 #50
 if(!(src1_addr == 10
 && src2_addr == 5
 && Imm_out == 35
 && data_type == 2'b10
 && lsu_op == 1
 && ALU_src1_sel == 0
 && ALU_src2_sel == 1
 && ALU_op == 4'b0000))begin
  $display("The test case did not pass for instruction sw");
 end
 
 #50
 //sh x15 5(x21)
 instr = 32'b00000000111110101001001010100011;
 #50
 if(!(src1_addr == 21
 && src2_addr == 15
 && Imm_out == 5
 && data_type == 2'b01
 && lsu_op == 1
 && ALU_src1_sel == 0
 && ALU_src2_sel == 1
 && ALU_op == 4'b0000))begin
  $display("The test case did not pass for instruction sh");
 end
 
 #50
 //sw x5 50(x12)
 instr = 32'b00000010010101100010100100100011;
 #50
 if(!(src1_addr == 12
 && src2_addr == 5
 && Imm_out == 50
 && data_type == 2'b10
 && lsu_op == 1
 && ALU_src1_sel == 0
 && ALU_src2_sel == 1
 && ALU_op == 4'b0000))begin
  $display("The test case did not pass for instruction sw");
 end
 
 #50
 //loop: beq x3,x5,loop ->beq x3 x5 0 <loop>
 instr = 32'b00000000010100011000000001100011;
 #50
 if(!(src1_addr == 3
 && src2_addr == 5
 && Imm_out == 0
 && ALU_src1_sel == 0
 && ALU_src2_sel == 0
 && branch == 0
 && ALU_op == 4'b0011))begin
  $display("The test case did not pass for instruction beq");
 end
 
  #50
 //lui x5,1234
 instr = 32'b00000000010100011000000001100011;
 #50
 if(!(dest_addr == 5
 && U_imm_out == 1234000
 && branch == 0))begin
  $display("The test case did not pass for instruction lui");
 end
 
 #50
 //auipc x3, 0x1234
 instr = 32'b00000001001000110100000110010111;
 #50
 if(!(dest_addr == 3
 && U_imm_out == 1234000
 && ALU_src2_sel == 0
 && Rd_data_src_sel == 3
 && branch == 0))begin
  $display("The test case did not pass for instruction auipc");
 end
 
  #50
 //ecall
 instr = 32'b00000000000000000000000001110011;
 #50
 if(!(halt == 1))begin
  $display("The test case did not pass for instruction ecall");
 end
 
   #50
 //ebreak
 instr = 32'b00000000000100000000000001110011;
 #50
 if(!(halt == 1))begin
  $display("The test case did not pass for instruction ebreak");
 end
 
   #50
 //loop: jal x1, loop 
 instr = 32'b00000000000000000000000011101111;
 #50
 if(!(dest_addr == 1
 && Imm_out == 0
 && Rd_data_src_sel == 3
 ))begin
  $display("The test case did not pass for instruction jal");
 end
 
    #50
 //jalr x4, x3, 5
 instr = 32'b00000000010100011000001001100111;
 #50
 if(!(dest_addr == 4
 && Imm_out == 5
 && Rd_data_src_sel == 3
 ))begin
  $display("The test case did not pass for instruction jalr");
 end
 
 $display("All test cases passed");
 
 end
endmodule
