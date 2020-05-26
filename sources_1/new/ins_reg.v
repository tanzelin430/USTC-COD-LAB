`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 18:30:45
// Design Name: 
// Module Name: ins_reg
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


module ins_reg(
input IRWrite,
input [31:0] ins_in,
output reg[31:0] ins_out
    );
always@(*)
begin
    if(IRWrite)
        ins_out <= ins_in;
    else
        ins_out <= ins_out;
end
endmodule
