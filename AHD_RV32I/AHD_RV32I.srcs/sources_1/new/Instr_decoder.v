`default_nettype none
`timescale 1ns / 1ps


module Instr_decoder(
    input wire clk,
    input wire[31:0] instr
    );
    
    always @* begin
     case(instr[6:0])
      //R type instruction
      7'b0110011:begin
                  case(instr[14:12])
                   3'b000:begin
                           //subtraction 
                           if(instr[30])begin
                            end
                           //addition 
                           else begin
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
                          
                          end
                   //AND       
                   3'b111:begin 
                          
                          end                                   
                  endcase
                 end
      //I type instruction           
      7'b0010011:begin
                  case(instr[14:12])
                   //ADDI
                   3'b000:begin
                           
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
                          
                          end
                   //ANDI       
                   3'b111:begin 
                          
                          end                                   
                  endcase
                 end
      //I type load instruction           
      7'b0000011:begin
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
                  case(instr[14:12])
                  //BEQ
                  3'b000:begin
                         end
                  //BNE
                  3'b001:begin
                         end
                  //BLT
                  3'b100:begin
                         end
                  //BGE
                  3'b101:begin
                         end
                  //BLTU
                  3'b110:begin
                         end
                  //BGEU
                  3'b111:begin
                         end                            
                 endcase
                
                 end
      //U type instruction1  LUI         
      7'b0110111:begin
                
                 end
      //U type instruction2  AUIPC         
      7'b0010111:begin
                
                 end 
      //JAL  
      7'b1101111:begin
                
                 end
      //JALR
      7'b1100111:begin
                
                 end 
      //ecall ebreak 
      7'b1110011:begin
                
                 end                                                                                            
      default:begin
              end           
     endcase
    end
endmodule
