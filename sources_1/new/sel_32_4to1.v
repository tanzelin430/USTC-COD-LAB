`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/24 19:21:04
// Design Name: 
// Module Name: sel_32_4to1
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


module sel_32_4to1(
input [1:0] control,
input [31:0] d_in_1,
input [31:0] d_in_2,
input [31:0] d_in_3,
input [31:0] d_in_4,
output reg[31:0] d_out
    );
always@(*)
begin
case(control)
2'b00: d_out <= d_in_1;
2'b01: d_out <= d_in_2;
2'b10: d_out <= d_in_3;
2'b11: d_out <= d_in_4;
endcase
end
endmodule

