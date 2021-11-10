`default_nettype none
`timescale 1ns / 1ps

module ALU(
    input wire[31:0] input1,
    input wire[31:0] input2, 
    output reg[31:0] result_out,
    output reg zero,
    input wire[3:0] ALU_op
    );
    //B_shifter shftr(.in1(input1),.in2(input2),.op(),.result(result_out));
    always @*begin
    case(ALU_op)
     4'b0000: result_out = input1 + input2; //ADD ADDI
     4'b1001: result_out = input1 - input2; //SUB
     4'b0111: result_out = input1 & input2; //AND ANDI
     4'b0110: result_out = input1 | input2; //OR ORI
     4'b0100: result_out = input1 ^ input2; //XOR XORI
     4'b0010: result_out = (input1 < input2)?1:0; //SLT set less than
     4'b0011: zero = (input1 == input2)?1:0;//BEQ
     4'b0101: zero = (input1 != input2)?1:0;//BNE
     4'b1000: zero = (input1 >= input2)?1:0;//BGE BGEU
     4'b1010: zero = (input1 < input2)?1:0;//BLTU BLT
     
     4'b1011: begin   //SLL SLLI
         result_out = (input2[4:0] == 5'b00001)?{input1[30:0],input1[31]}:
         (input2[4:0] == 5'b00010)?{input1[29:0],input1[31:30]}:
         (input2[4:0] == 5'b00011)?{input1[28:0],input1[31:29]}:
         (input2[4:0] == 5'b00100)?{input1[27:0],input1[31:28]}: 
	     (input2[4:0] == 5'b00101)?{input1[26:0],input1[31:27]}:
	     (input2[4:0] == 5'b00110)?{input1[25:0],input1[31:26]}:
	     (input2[4:0] == 5'b00111)?{input1[24:0],input1[31:25]}:
	     (input2[4:0] == 5'b01000)?{input1[23:0],input1[31:24]}:
	     (input2[4:0] == 5'b01001)?{input1[22:0],input1[31:23]}:
	     (input2[4:0] == 5'b01010)?{input1[21:0],input1[31:22]}:
	     (input2[4:0] == 5'b01011)?{input1[20:0],input1[31:21]}:
	     (input2[4:0] == 5'b01100)?{input1[19:0],input1[31:20]}:
	     (input2[4:0] == 5'b01101)?{input1[18:0],input1[31:19]}:
         (input2[4:0] == 5'b01110)?{input1[17:0],input1[31:18]}:
	     (input2[4:0] == 5'b01111)?{input1[16:0],input1[31:17]}:
	     (input2[4:0] == 5'b10000)?{input1[15:0],input1[31:16]}:
	     (input2[4:0] == 5'b10001)?{input1[14:0],input1[31:15]}:
	     (input2[4:0] == 5'b10010)?{input1[13:0],input1[31:14]}:
	     (input2[4:0] == 5'b10011)?{input1[12:0],input1[31:13]}:
	     (input2[4:0] == 5'b10100)?{input1[11:0],input1[31:12]}:
	     (input2[4:0] == 5'b10101)?{input1[10:0],input1[31:11]}:
	     (input2[4:0] == 5'b10110)?{input1[09:0],input1[31:10]}:
	     (input2[4:0] == 5'b10111)?{input1[08:0],input1[31:09]}:
	     (input2[4:0] == 5'b11000)?{input1[07:0],input1[31:08]}:
	     (input2[4:0] == 5'b11001)?{input1[06:0],input1[31:07]}:
	     (input2[4:0] == 5'b11010)?{input1[05:0],input1[31:06]}:
	     (input2[4:0] == 5'b11011)?{input1[04:0],input1[31:05]}:
	     (input2[4:0] == 5'b11100)?{input1[03:0],input1[31:04]}:
	     (input2[4:0] == 5'b11101)?{input1[02:0],input1[31:03]}:
	     (input2[4:0] == 5'b11110)?{input1[01:0],input1[31:02]}:
	     (input2[4:0] == 5'b11111)?{input1[0],input1[31:01]}:
	      input1;
	      end
	 4'b1101: begin   //SRL SRLI  
          result_out = (input2[4:0] == 5'b00001)?{input1[0],input1[31:5'b00001]}:
          (input2[4:0] == 5'b00010)?{input1[5'b00010 -1:0],input1[31:5'b00010]}: 
          (input2[4:0] == 5'b00011)?{input1[5'b00011 -1:0],input1[31:5'b00011]}:
          (input2[4:0] == 5'b00100)?{input1[5'b00100 -1:0],input1[31:5'b00100]}: 
	      (input2[4:0] == 5'b00101)?{input1[5'b00101 -1:0],input1[31:5'b00101]}:
	      (input2[4:0] == 5'b00110)?{input1[5'b00110 -1:0],input1[31:5'b00110]}:
	      (input2[4:0] == 5'b00111)?{input1[5'b00111 -1:0],input1[31:5'b00111]}:
	      (input2[4:0] == 5'b01000)?{input1[5'b01000 -1:0],input1[31:5'b01000]}:
	      (input2[4:0] == 5'b01001)?{input1[5'b01001 -1:0],input1[31:5'b01001]}:
	      (input2[4:0] == 5'b01010)?{input1[5'b01010 -1:0],input1[31:5'b01010]}:
	      (input2[4:0] == 5'b01011)?{input1[5'b01011 -1:0],input1[31:5'b01011]}:
	      (input2[4:0] == 5'b01100)?{input1[5'b01100 -1:0],input1[31:5'b01100]}:
	      (input2[4:0] == 5'b01101)?{input1[5'b01101 -1:0],input1[31:5'b01101]}:
          (input2[4:0] == 5'b01110)?{input1[5'b01110 -1:0],input1[31:5'b01110]}:
	      (input2[4:0] == 5'b01111)?{input1[5'b01111 -1:0],input1[31:5'b01111]}:
	      (input2[4:0] == 5'b10000)?{input1[5'b10000 -1:0],input1[31:5'b10000]}:
	      (input2[4:0] == 5'b10001)?{input1[5'b10001 -1:0],input1[31:5'b10001]}:
	      (input2[4:0] == 5'b10010)?{input1[5'b10010 -1:0],input1[31:5'b10010]}:
	      (input2[4:0] == 5'b10011)?{input1[5'b10011 -1:0],input1[31:5'b10011]}:
	      (input2[4:0] == 5'b10100)?{input1[5'b10100 -1:0],input1[31:5'b10100]}:
	      (input2[4:0] == 5'b10101)?{input1[5'b10101 -1:0],input1[31:5'b10101]}:
	      (input2[4:0] == 5'b10110)?{input1[5'b10110 -1:0],input1[31:5'b10110]}:
	      (input2[4:0] == 5'b10111)?{input1[5'b10111 -1:0],input1[31:5'b10111]}:
	      (input2[4:0] == 5'b11000)?{input1[5'b11000 -1:0],input1[31:5'b11000]}:
	      (input2[4:0] == 5'b11001)?{input1[5'b11001 -1:0],input1[31:5'b11001]}:
	      (input2[4:0] == 5'b11010)?{input1[5'b11010 -1:0],input1[31:5'b11010]}:
	      (input2[4:0] == 5'b11011)?{input1[5'b11011 -1:0],input1[31:5'b11011]}:
	      (input2[4:0] == 5'b11100)?{input1[5'b11100 -1:0],input1[31:5'b11100]}:
	      (input2[4:0] == 5'b11101)?{input1[5'b11101 -1:0],input1[31:5'b11101]}:
	      (input2[4:0] == 5'b11110)?{input1[5'b11110 -1:0],input1[31:5'b11110]}:
	      (input2[4:0] == 5'b11111)?{input1[5'b11111 -1:0],input1[31:5'b11111]}:
	       input1;
	      end 
	      
	 4'b1100:begin   //SRA SRAI
	      result_out =(input2[4:0] == 5'b00001)?{input1[31],input1[31:1]}:
                      (input2[4:0] == 5'b00010)?{{02{input1[31]}},input1[31:02]}: 
                      (input2[4:0] == 5'b00011)?{{03{input1[31]}},input1[31:03]}:
                      (input2[4:0] == 5'b00100)?{{04{input1[31]}},input1[31:04]}: 
	                  (input2[4:0] == 5'b00101)?{{05{input1[31]}},input1[31:05]}:
	                  (input2[4:0] == 5'b00110)?{{06{input1[31]}},input1[31:06]}:
	                  (input2[4:0] == 5'b00111)?{{07{input1[31]}},input1[31:07]}:
	                  (input2[4:0] == 5'b01000)?{{08{input1[31]}},input1[31:08]}:
	                  (input2[4:0] == 5'b01001)?{{09{input1[31]}},input1[31:09]}:
	                  (input2[4:0] == 5'b01010)?{{10{input1[31]}},input1[31:10]}:
	                  (input2[4:0] == 5'b01011)?{{11{input1[31]}},input1[31:11]}:
	                  (input2[4:0] == 5'b01100)?{{12{input1[31]}},input1[31:12]}:
	                  (input2[4:0] == 5'b01101)?{{13{input1[31]}},input1[31:13]}:
                      (input2[4:0] == 5'b01110)?{{14{input1[31]}},input1[31:14]}:
	                  (input2[4:0] == 5'b01111)?{{15{input1[31]}},input1[31:15]}:
	                  (input2[4:0] == 5'b10000)?{{16{input1[31]}},input1[31:16]}:
	                  (input2[4:0] == 5'b10001)?{{17{input1[31]}},input1[31:17]}:
	                  (input2[4:0] == 5'b10010)?{{18{input1[31]}},input1[31:18]}:
	                  (input2[4:0] == 5'b10011)?{{19{input1[31]}},input1[31:19]}:
	                  (input2[4:0] == 5'b10100)?{{20{input1[31]}},input1[31:20]}:
	                  (input2[4:0] == 5'b10101)?{{21{input1[31]}},input1[31:21]}:
	                  (input2[4:0] == 5'b10110)?{{22{input1[31]}},input1[31:22]}:
	                  (input2[4:0] == 5'b10111)?{{23{input1[31]}},input1[31:23]}:
	                  (input2[4:0] == 5'b11000)?{{24{input1[31]}},input1[31:24]}:
	                  (input2[4:0] == 5'b11001)?{{25{input1[31]}},input1[31:25]}:
	                  (input2[4:0] == 5'b11010)?{{26{input1[31]}},input1[31:26]}:
	                  (input2[4:0] == 5'b11011)?{{27{input1[31]}},input1[31:27]}:
	                  (input2[4:0] == 5'b11100)?{{28{input1[31]}},input1[31:28]}:
	                  (input2[4:0] == 5'b11101)?{{29{input1[31]}},input1[31:29]}:
	                  (input2[4:0] == 5'b11110)?{{30{input1[31]}},input1[31:30]}:
	                  (input2[4:0] == 5'b11111)?{{31{input1[31]}},input1[31]}:
	                   input1;	      
	       end
	               
    endcase
    end
    
    
endmodule
