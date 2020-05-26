`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/25 10:03:42
// Design Name: 
// Module Name: MUX_3to1
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


module MUX_3to1(
input [1:0]pcsrc,
input [31:0]npc,
input [31:0]beq_addr,
input [31:0]jump_addr,
output reg[31:0]pc_addr
    );
always@(*)
begin
case(pcsrc)
2'b00: pc_addr <= npc;
2'b01:pc_addr <= beq_addr;
2'b10:pc_addr <= jump_addr;
endcase
end
endmodule
