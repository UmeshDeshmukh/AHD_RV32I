`default_nettype none
`timescale 1ns / 1ps


module Instr_decoder(
    //input wire clk,
    input wire[31:0] instr,
    
    output reg[3:0] ALU_op,
    output reg branch, 
    output reg ALU_src2_sel,
    output reg Rd_data_src_sel,
    output reg DMem_wr_en,
    
    output reg[4:0] src1_addr,
    output reg[4:0] src2_addr,
    output reg[4:0] dest_addr,    
    output reg[19:0] Imm_out,
    output reg[31:0] U_imm_out,
    output reg extend
    );
    reg[11:0] Imm;
      
    
    always @* begin
     case(instr[6:0])
      //R type instruction
      7'b0110011:begin
                  //datapath values
                  src1_addr = instr[19:15];
                  src2_addr = instr[24:20];
                  dest_addr = instr[11:07]; 
                  //control values
                  ALU_src2_sel = 0;
                  Rd_data_src_sel = 0;
                  branch = 0;
                  case(instr[14:12])
                   3'b000:begin
                           //subtraction 
                           if(instr[30])begin
                            ALU_op = 4'b1001;
                            end
                           //addition 
                           else begin
                            ALU_op = 4'b0000;
                            end
                          end 
                   //SLL       
                   3'b001:begin 
                           
                          end  
                   //SLT       
                   3'b010:begin 
                           
                          end
                   //SLTU       
                   3'b011:begin 
                          
                          end
                   //XOR       
                   3'b100:begin 
                           ALU_op = 4'b0100;
                          end
                   //SRL SRA     
                   3'b100:begin 
                          //SRA 
                           if(instr[30])begin
                            end
                           //SRL 
                           else begin
                            end
                          end
                   //OR       
                   3'b110:begin 
                           ALU_op = 4'b0110;
                          end
                   //AND       
                   3'b111:begin 
                          ALU_op = 4'b0111;
                          end                                   
                  endcase
                 end
      //I type instruction           
      7'b0010011:begin
                  //datapath values
                  src1_addr = instr[19:15];
                  Imm_out = instr[31:20];
                  dest_addr = instr[11:07];                                   
                  //control values
                  ALU_src2_sel = 1;
                  Rd_data_src_sel = 0;
                  branch = 0;
                  case(instr[14:12])
                   //ADDI
                   3'b000:begin
                          ALU_op = 4'b0000;
                          end 
                   //SLLI       
                   3'b001:begin 
                          
                          end  
                   //SLTI       
                   3'b010:begin 
                          
                          end
                   //SLTUI       
                   3'b011:begin 
                          
                          end
                   //XORI       
                   3'b100:begin 
                          ALU_op = 4'b0100; 
                          end
                   //SRLI SRAI     
                   3'b100:begin 
                          //SRAI 
                           if(instr[30])begin
                            end
                           //SRLI 
                           else begin
                            end
                          end
                   //ORI       
                   3'b110:begin 
                          ALU_op = 4'b0110;
                          end
                   //ANDI       
                   3'b111:begin 
                          ALU_op = 4'b0111;
                          end                                   
                  endcase
                 end
      //I type load instruction           
      7'b0000011:begin
                 //datapath values
                  src1_addr = instr[19:15];
                  Imm_out = instr[31:20];
                  dest_addr = instr[11:07];                                   
                  //control values
                  ALU_src2_sel = 1;
                  Rd_data_src_sel = 0;
                  branch = 0;
                 case(instr[14:12])
                  //LB
                  3'b000:begin
                         end
                  //LH
                  3'b001:begin
                         end
                  //LW
                  3'b010:begin
                         end
                  //LBU
                  3'b100:begin
                         end
                  //LHU
                  3'b101:begin
                         end                     
                 endcase
                 end
      //S type instruction   
      7'b0100011:begin
                 src1_addr = instr[19:15];
                 src2_addr = instr[24:20];
                 Imm_out = {instr[31:25],instr[11:07]};
                 
                 ALU_op = 4'b0000;
                 case(instr[14:12])
                  //SB
                  3'b000:begin
                    
                   end
                  //SH
                  3'b001:begin
                   end
                  //SW 
                  3'b010:begin
                   end 
                 endcase
                 end
      //B type instruction   
      7'b1100011:begin
                 src1_addr = instr[19:15];
                 src2_addr = instr[24:20];
                 Imm_out = {instr[31],instr[7],instr[30:25],instr[11:08]};  
                 //control values
                  ALU_src2_sel = 0;
                  Rd_data_src_sel = 0;
                  branch = 1;                
                  case(instr[14:12])
                  //BEQ
                  3'b000:begin
                         ALU_op = 4'bXXXX;
                         end
                  //BNE
                  3'b001:begin
                         ALU_op = 4'bXXXX;
                         end
                  //BLT
                  3'b100:begin
                         ALU_op = 4'bXXXX;
                         end
                  //BGE
                  3'b101:begin
                         ALU_op = 4'bXXXX;
                         end
                  //BLTU
                  3'b110:begin
                         ALU_op = 4'bXXXX;
                         end
                  //BGEU
                  3'b111:begin
                         ALU_op = 4'bXXXX;
                         end                            
                 endcase
                
                 end
      //U type instruction1  LUI         
      7'b0110111:begin
                 dest_addr = instr[11:07];
                 U_imm_out = {instr[31:12],{12{0}}};  
                 //control values
                 ALU_src2_sel = 0;
                 Rd_data_src_sel = 0;
                 branch = 0;
                 
                 end
      //U type instruction2  AUIPC         
      7'b0010111:begin
                 dest_addr = instr[11:07];
                 U_imm_out = {instr[31:12],{12{0}}};  
                 //control values
                 ALU_src2_sel = 0;
                 Rd_data_src_sel = 0;
                 branch = 0;
                 end 
      //JAL  
      7'b1101111:begin
                 Imm = {instr[31],instr[7],instr[30:25],instr[11:08]};
                 end
      //JALR
      7'b1100111:begin
                 Imm = {instr[31],instr[7],instr[30:25],instr[11:08]};
                 end 
      //ecall ebreak 
      7'b1110011:begin
                
                 end                                                                                            
      default:begin
              end           
     endcase
    end
endmodule
