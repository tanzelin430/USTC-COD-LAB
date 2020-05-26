`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 19:12:06
// Design Name: 
// Module Name: clk_reg
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module clk_reg(
     input clk,
	 input [31:0] in,
	 output reg [31:0] out
	 );
always@(posedge clk)
	begin
	out <= in;
	end
endmodule
