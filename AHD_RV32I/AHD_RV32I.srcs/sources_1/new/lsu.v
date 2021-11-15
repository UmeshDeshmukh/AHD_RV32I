`default_nettype none
`timescale 1ns / 1ps


module lsu(
    input wire clk,rst,
    //signals from/to ALU,decoder...
    input wire[1:0] data_type,
    input wire lsu_op,sign_ext,
    input wire[31:0]write_data,
    input wire[31:0]address_i,
    output reg[31:0]read_data_o,
    //Memory side signals
    input wire wr_en,
    input wire[31:0]read_data_i,
    output reg[3:0] byte_en,
    output wire[31:0] address_o,
    output wire[31:0]write_data_o
    );
    wire[1:0]data_offset;
    reg[31:0]b_read, hw_read, w_read;
    /*data_offset
    2'b00->0 byte
    2'b01->1 byte
    2'b10->2 byte
    2'b11->3 byte*/
    // sign extension
    /*data_type
    2'b00->byte 
    2'b01->half word
    2'b10->word*/
    
    assign data_offset = address_i[1:0];
    
    //////////////
    //Data Write//
    //////////////
    //byte_en generation for data write//
    always @* begin
     case(data_type)
      2'b00:begin //byte
            case(data_offset)
             2'b00:byte_en = 4'b0001;
             2'b01:byte_en = 4'b0010;
             2'b10:byte_en = 4'b0100;
             2'b11:byte_en = 4'b1000;
             default:byte_en = 4'b1111;
            endcase
            end 
      2'b01:begin //half word
            case(data_offset)
             2'b00:byte_en = 4'b0011;
             2'b01:byte_en = 4'b0110;
             2'b10:byte_en = 4'b1100;
             2'b11:byte_en = 4'b1000;
             default:byte_en = 4'b1111;
            endcase
            end
      2'b10:begin //word
            case(data_offset)
             2'b00:byte_en = 4'b1111;
             2'b01:byte_en = 4'b1110;
             2'b10:byte_en = 4'b1100;
             2'b11:byte_en = 4'b1000;
             default:byte_en = 4'b1111;
            endcase
            end
      default:byte_en = 4'b1111;
     endcase
    end
    
/*    always @* begin
     case(data_offset)
     2'b00:write_data_o = write_data[31:0];
     2'b01:write_data_o ={write_data[]
      
     endcase
    end*/
    /////////////
    //Data Read//
    /////////////
    // sign/zero extension for byte
    always @* begin
     case(data_offset)
      2'b00:begin
             if(!sign_ext)begin
               b_read = {{24{0}},{read_data_i[7:0]}};    
               end
             else begin
               b_read = {{24{read_data_i[7]}},{read_data_i[7:0]}}; 
               end     
            end
      2'b01:begin
             if(!sign_ext)begin
               b_read = {{24{0}},{read_data_i[15:8]}};    
               end
             else begin
               b_read = {{24{read_data_i[15]}},{read_data_i[15:8]}}; 
               end     
            end
      2'b10:begin
             if(!sign_ext)begin
               b_read = {{24{0}},{read_data_i[23:16]}};    
               end
             else begin
               b_read = {{24{read_data_i[23]}},{read_data_i[23:16]}}; 
               end     
            end
      2'b11:begin
             if(!sign_ext)begin
               b_read = {{24{0}},{read_data_i[31:24]}};    
               end
             else begin
               b_read = {{24{read_data_i[31]}},{read_data_i[31:24]}}; 
               end     
            end
      default:b_read = {{24{0}},{read_data_i[7:0]}};      
     endcase
     end
     // sign/zero extension for half word
     
    always @* begin
     case(data_offset)
      2'b00:begin
             if(!sign_ext)begin
               hw_read = {{16{0}},{read_data_i[15:0]}};    
               end
             else begin
               hw_read = {{16{read_data_i[15]}},{read_data_i[15:0]}}; 
               end     
            end
      2'b01:begin
             if(!sign_ext)begin
               hw_read = {{16{0}},{read_data_i[23:8]}};    
               end
             else begin
               hw_read = {{16{read_data_i[23]}},{read_data_i[23:8]}}; 
               end     
            end
      2'b10:begin
             if(!sign_ext)begin
               hw_read = {{16{0}},{read_data_i[31:16]}};    
               end
             else begin
               hw_read = {{16{read_data_i[31]}},{read_data_i[31:16]}}; 
               end     
            end
      2'b11:begin
             if(!sign_ext)begin
               hw_read = {{16{0}},{read_data_i[31:24]}};    
               end
             else begin
               hw_read = {{16{read_data_i[31]}},{read_data_i[7:0]},{read_data_i[31:24]}}; 
               end     
            end
      default:hw_read = {{16{0}},{read_data_i[15:0]}};      
     endcase
    end
     
    always @(*)begin
      case(data_type)
      2'b00:read_data_o = b_read;//->byte 
      2'b01:read_data_o = hw_read;//->half word
      2'b10:read_data_o = read_data_i[31:0];//->word
      default:read_data_o = read_data_i[31:0];
      endcase
    end
    
    
    // output //
    assign wr_en = lsu_op;
    assign address_o = {address_i[31:2],2'b00};
    assign write_data_o = write_data;
endmodule
