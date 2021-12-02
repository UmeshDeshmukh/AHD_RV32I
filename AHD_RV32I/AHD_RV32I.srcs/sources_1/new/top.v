`default_nettype none
`timescale 1ns / 1ps


module top(input wire clk,
           input wire rst
          );
       wire pc, sel1, sel2, sel3, zero;
       wire[11:0]imm_val;   
       wire[31:0]instruction,ALU_result,imm_out,rs1_data,rs2_data,rd_data,ALU_in1,
       ALU_in2,dm_data,PC_adder_out,PC_imm_adder_out;
       wire[4:0] rs1_addr,rs2_addr,rd_addr;


       wire[31:0] instr;
       //Control signals
       reg[3:0] ALU_op;
       reg branch;
       reg ALU_src1_sel; 
       reg ALU_src2_sel;
       reg[1:0] Rd_data_src_sel;
       reg PC_src_sel;
       reg DMem_wr_en;
       wire[31:0] imm_i_type_o;
       wire[31:0] imm_s_type_o;
       wire[31:0] imm_b_type_o;
       wire[31:0] imm_u_type_o;
       wire[31:0] imm_j_type_o;
       reg[2:0]imm_sel; 
       //Signals to RF
       /*reg[4:0] src1_addr;
       reg[4:0] src2_addr;
       reg[4:0] dest_addr;*/
       //Signals to LSU
       reg[1:0] data_type; //byte;half word;word
       reg lsu_op,sign_ext;
       //Signal to immediate ext    
       reg[19:0] Imm_out;
       reg[31:0] U_imm_out;
       reg extend;
       reg halt; 
       
       wire DMem_wr_en;
       wire[3:0] byte_en;
       wire[31:0] Data_addr;
       wire[31:0] DMem_wr_data;
       wire[31:0] DMem_rd_data;           
       wire wr_en;
       wire[31:0]read_data_i;
       reg[3:0] byte_en;
       wire[31:0] address_o;
       wire[31:0]write_data_o;
       
       wire[31:0] imm;
       wire[31:0] PC_o;      
       
       Inst_mem im(.clk(clk),.Inst_addr(PC_o),.Inst(instruction));
         
       Instr_decoder id(
       .instr(instruction),
       //Control signals
       .ALU_op(ALU_op),
       .branch(branch),
       .ALU_src1_sel(ALU_src1_sel), 
       .ALU_src2_sel(ALU_src2_sel),
       .Rd_data_src_sel(Rd_data_src_sel),
       .PC_src_sel(PC_src_sel),
       .DMem_wr_en(DMem_wr_en),
       //Signals to RF
       .src1_addr(rs1_addr),
       .src2_addr(rs2_addr),
       .dest_addr(rd_addr),
       //Signals to LSU
       .data_type(data_type), //byte(),half word(),word
       .lsu_op(lsu_op),
	   .sign_ext(sign_ext),
       //Signal to immediate ext    
       .Imm_out(Imm_out),
       .U_imm_out(U_imm_out),
       .extend(extend),
       .halt(halt),
       .imm_i_type_o(imm_i_type_o),
       .imm_s_type_o(imm_s_type_o),
       .imm_b_type_o(imm_b_type_o),
       .imm_u_type_o(imm_u_type_o),
       .imm_j_type_o(imm_j_type_o)
       );
       
       R_File rf(.Rs1_addr(rs1_addr),.Rs2_addr(rs2_addr),.Rd_addr(rd_addr),
                 .Rs1_data(rs1_data),.Rs2_data(rs2_data),.Rd_data(rd_data));   
                               
       Imm_ext ext_imm(
       .imm_i_type_o(imm_i_type_o),
       .imm_s_type_o(imm_s_type_o),
       .imm_b_type_o(imm_b_type_o),
       .imm_u_type_o(imm_u_type_o),
       .imm_j_type_o(imm_j_type_o),
       .imm_in(imm_val),
       .imm_out(imm_out),
       .imm_sel(imm_sel));
       
       MUX32 ALU_src2_mux(.mux_in1(rs2_data),.mux_in2(imm_out),.mux_out(ALU_in2),.m_sel(ALU_src2_sel));
       
       MUX32 ALU_src1_mux(.mux_in1(rs1_data),.mux_in2(PC_o),.mux_out(ALU_in1),.m_sel(ALU_src1_sel));   
                                       
       ALU alu(.input1(ALU_in1),.input2(ALU_in2),.result_out(ALU_result),.zero(zero),.ALU_op(ALU_op));                  
       //MUX32 Rd_src_mux(.mux_in1(result),.mux_in2(dm_data),.mux_out(rd_data1),.m_sel());
       
       LSU lsu(
             .clk(clk),
	         .rst(rst),
             //signals from/to ALU(),decoder...
             .data_type(data_type),
             .lsu_op(lsu_op),
	         .sign_ext(sign_ext),
             .write_data(rs2_data),
             .address_i(ALU_result),
             .read_data_o(dm_data),
             //Memory side signals
             .wr_en(wr_en),
             .read_data_i(read_data_i),
             .byte_en(byte_en),
             .address_o(address_o),
             .write_data_o(write_data_o)      
       ); 
       
       Data_mem dm(.DMem_wr_en(wr_en),.byte_en(byte_en),.Data_addr(address_o),.DMem_wr_data(write_data_o),.DMem_rd_data(read_data_i));
       
       MUX32_4 Rd_src_mux(.mux4_in1(ALU_result),.mux4_in2(dm_data),.mux4_in3(PC_adder_out),
                          .mux4_in4(PC_imm_adder_out),.mux4_out(rd_data),.m4_sel(Rd_data_src_sel));
                          
       PC_adder pc_adder(
       .clk(clk),
	   .rst(rst),
       .imm_in(imm_out), 
	   .ALU_res(ALU_result),
       .PC_src_sel(PC_src_sel),
       .halt(halt),
       .PC_o(PC_o));                         
                          
endmodule
