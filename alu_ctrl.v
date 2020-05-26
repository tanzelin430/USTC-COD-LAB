`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/24 10:41:28
// Design Name: 
// Module Name: alu_ctrl
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


module ALUctrl(
input [1:0] aluop,
input [5:0]funct,
output reg [2:0]aluopcode
    );
initial aluopcode <= 3'b000;
always@(*)
begin
case(aluop)
2'b00: aluopcode <= 3'b000;
2'b01:aluopcode<=3'b001;
2'b10:begin
if (funct[3:0] == 4'b0000) aluopcode <= 3'b000;
else if (funct[3:0] == 4'b0010) aluopcode <= 3'b001;
else if (funct[3:0] == 4'b0100) aluopcode <= 3'b010;
else if (funct[3:0] == 4'b0101) aluopcode <= 3'b011;
end
endcase
end
endmodule
