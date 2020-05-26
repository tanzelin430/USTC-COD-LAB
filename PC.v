`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 17:01:57
// Design Name: 
// Module Name: PC
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


module PC(
input clk,
input rst,
input PCen,
input [31:0] new_ins,
output reg [31:0] current_ins
);
initial begin
current_ins <= 0;
end
always@(posedge clk or posedge rst)
if (rst)
begin
current_ins <= 0;
end
else if(PCen)
begin 
current_ins <= new_ins;
end
else 
current_ins <= current_ins;
endmodule
