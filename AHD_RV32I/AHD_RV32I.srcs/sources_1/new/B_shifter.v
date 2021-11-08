`default_nettype none
`timescale 1ns / 1ps


module B_shifter(
    input wire[31:0] in1,in2,
    input wire op,
    output wire[31:0]result 
    );

   if(op)begin
   // result = in1 << in2
   assign result = (in2[4:0] == 5'b00001)?{in1[30:0],in1[31]}:
                (in2[4:0] == 5'b00010)?{in1[29:0],in1[31:30]}:
                (in2[4:0] == 5'b00011)?{in1[28:0],in1[31:29]}:
                (in2[4:0] == 5'b00100)?{in1[27:0],in1[31:28]}: 
	            (in2[4:0] == 5'b00101)?{in1[26:0],in1[31:27]}:
	            (in2[4:0] == 5'b00110)?{in1[25:0],in1[31:26]}:
	            (in2[4:0] == 5'b00111)?{in1[24:0],in1[31:25]}:
	            (in2[4:0] == 5'b01000)?{in1[23:0],in1[31:24]}:
	            (in2[4:0] == 5'b01001)?{in1[22:0],in1[31:23]}:
	            (in2[4:0] == 5'b01010)?{in1[21:0],in1[31:22]}:
	            (in2[4:0] == 5'b01011)?{in1[20:0],in1[31:21]}:
	            (in2[4:0] == 5'b01100)?{in1[19:0],in1[31:20]}:
	            (in2[4:0] == 5'b01101)?{in1[18:0],in1[31:19]}:
                (in2[4:0] == 5'b01110)?{in1[17:0],in1[31:18]}:
	            (in2[4:0] == 5'b01111)?{in1[16:0],in1[31:17]}:
	            (in2[4:0] == 5'b10000)?{in1[15:0],in1[31:16]}:
	            (in2[4:0] == 5'b10001)?{in1[14:0],in1[31:15]}:
	            (in2[4:0] == 5'b10010)?{in1[13:0],in1[31:14]}:
	            (in2[4:0] == 5'b10011)?{in1[12:0],in1[31:13]}:
	            (in2[4:0] == 5'b10100)?{in1[11:0],in1[31:12]}:
	            (in2[4:0] == 5'b10101)?{in1[10:0],in1[31:11]}:
	            (in2[4:0] == 5'b10110)?{in1[09:0],in1[31:10]}:
	            (in2[4:0] == 5'b10111)?{in1[08:0],in1[31:09]}:
	            (in2[4:0] == 5'b11000)?{in1[07:0],in1[31:08]}:
	            (in2[4:0] == 5'b11001)?{in1[06:0],in1[31:07]}:
	            (in2[4:0] == 5'b11010)?{in1[05:0],in1[31:06]}:
	            (in2[4:0] == 5'b11011)?{in1[04:0],in1[31:05]}:
	            (in2[4:0] == 5'b11100)?{in1[03:0],in1[31:04]}:
	            (in2[4:0] == 5'b11101)?{in1[02:0],in1[31:03]}:
	            (in2[4:0] == 5'b11110)?{in1[01:0],in1[31:02]}:
	            (in2[4:0] == 5'b11111)?{in1[0],in1[31:01]}:
	             in1;
	             
	   end          
	else begin             
	   // result = in1 >> in2				 
    assign result = (in2[4:0] == 5'b00001)?{in1[0],in1[31:5'b00001]}:
                (in2[4:0] == 5'b00010)?{in1[5'b00010 -1:0],in1[31:5'b00010]}: 
                (in2[4:0] == 5'b00011)?{in1[5'b00011 -1:0],in1[31:5'b00011]}:
                (in2[4:0] == 5'b00100)?{in1[5'b00100 -1:0],in1[31:5'b00100]}: 
	            (in2[4:0] == 5'b00101)?{in1[5'b00101 -1:0],in1[31:5'b00101]}:
	            (in2[4:0] == 5'b00110)?{in1[5'b00110 -1:0],in1[31:5'b00110]}:
	            (in2[4:0] == 5'b00111)?{in1[5'b00111 -1:0],in1[31:5'b00111]}:
	            (in2[4:0] == 5'b01000)?{in1[5'b01000 -1:0],in1[31:5'b01000]}:
	            (in2[4:0] == 5'b01001)?{in1[5'b01001 -1:0],in1[31:5'b01001]}:
	            (in2[4:0] == 5'b01010)?{in1[5'b01010 -1:0],in1[31:5'b01010]}:
	            (in2[4:0] == 5'b01011)?{in1[5'b01011 -1:0],in1[31:5'b01011]}:
	            (in2[4:0] == 5'b01100)?{in1[5'b01100 -1:0],in1[31:5'b01100]}:
	            (in2[4:0] == 5'b01101)?{in1[5'b01101 -1:0],in1[31:5'b01101]}:
                (in2[4:0] == 5'b01110)?{in1[5'b01110 -1:0],in1[31:5'b01110]}:
	            (in2[4:0] == 5'b01111)?{in1[5'b01111 -1:0],in1[31:5'b01111]}:
	            (in2[4:0] == 5'b10000)?{in1[5'b10000 -1:0],in1[31:5'b10000]}:
	            (in2[4:0] == 5'b10001)?{in1[5'b10001 -1:0],in1[31:5'b10001]}:
	            (in2[4:0] == 5'b10010)?{in1[5'b10010 -1:0],in1[31:5'b10010]}:
	            (in2[4:0] == 5'b10011)?{in1[5'b10011 -1:0],in1[31:5'b10011]}:
	            (in2[4:0] == 5'b10100)?{in1[5'b10100 -1:0],in1[31:5'b10100]}:
	            (in2[4:0] == 5'b10101)?{in1[5'b10101 -1:0],in1[31:5'b10101]}:
	            (in2[4:0] == 5'b10110)?{in1[5'b10110 -1:0],in1[31:5'b10110]}:
	            (in2[4:0] == 5'b10111)?{in1[5'b10111 -1:0],in1[31:5'b10111]}:
	            (in2[4:0] == 5'b11000)?{in1[5'b11000 -1:0],in1[31:5'b11000]}:
	            (in2[4:0] == 5'b11001)?{in1[5'b11001 -1:0],in1[31:5'b11001]}:
	            (in2[4:0] == 5'b11010)?{in1[5'b11010 -1:0],in1[31:5'b11010]}:
	            (in2[4:0] == 5'b11011)?{in1[5'b11011 -1:0],in1[31:5'b11011]}:
	            (in2[4:0] == 5'b11100)?{in1[5'b11100 -1:0],in1[31:5'b11100]}:
	            (in2[4:0] == 5'b11101)?{in1[5'b11101 -1:0],in1[31:5'b11101]}:
	            (in2[4:0] == 5'b11110)?{in1[5'b11110 -1:0],in1[31:5'b11110]}:
	            (in2[4:0] == 5'b11111)?{in1[5'b11111 -1:0],in1[31:5'b11111]}:
	             in1;             
    end
endmodule