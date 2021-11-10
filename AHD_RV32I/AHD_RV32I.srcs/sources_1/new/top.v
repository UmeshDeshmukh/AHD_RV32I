`default_nettype none
`timescale 1ns / 1ps


module top(input wire clk

          );
       wire pc, sel1, sel2, sel3, zero;
       wire[11:0]imm_val;   
       wire[31:0]instruction,ALU_result,imm_out,rs1_data,rs2_data,rd_data,ALU_in1,
       ALU_in2,dm_data,PC_adder_out,PC_imm_adder_out;
       wire[4:0] rs1_addr,rs2_addr,rd_addr;
       
       Inst_mem im(.clk(clk),.Inst_addr(pc),.Inst(instruction));  
       Instr_decoder id(.instr(instruction),
                        .src1_addr(rs1_addr),
                        .src2_addr(rs2_addr),
                        .dest_addr(rd_addr),
                        .Imm_out(imm_val),
                        .U_imm_out());
       R_File rf(.Rs1_addr(rs1_addr),.Rs2_addr(rs2_addr),.Rd_addr(rd_addr),
                 .Rs1_data(rs1_data),.Rs2_data(rs2_data),.Rd_data(rd_data));                 
       Imm_ext ext_imm(.imm(imm_val),.ext_out(imm_out));
       MUX32 ALU_src2_mux(.mux_in1(rs2_data),.mux_in2(imm_out),.mux_out(ALU_in2),.m_sel());                                   
       ALU alu(.input1(ALU_in1),.input2(ALU_in2),.result_out(ALU_result),.zero(zero),.ALU_op());                  
       //MUX32 Rd_src_mux(.mux_in1(result),.mux_in2(dm_data),.mux_out(rd_data1),.m_sel());
       Data_mem dm(.DMem_wr_en(),.Data_addr(),.DMem_wr_data(rs2_data),.DMem_rd_data(dm_data));
       //MUX32 Rd_src_mux2(.mux_in1(rd_data1),.mux_in2(imm32),.mux_out(rd_data2),.m_sel());
       MUX32_4 Rd_src_mux(.mux4_in1(ALU_result),.mux4_in2(dm_data),.mux4_in3(PC_adder_out),
                          .mux4_in4(PC_imm_adder_out),.mux4_out(rd_data),.m4_sel());      
                          
endmodule
