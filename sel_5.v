`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 20:28:29
// Design Name: 
// Module Name: sel_5
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


module five_bit_2to1(
    input [4:0] select_one,
    input [4:0] select_two,
    input regdest,
    output [4:0] result
    );
    
    assign result = (regdest == 1'b0 ? select_one : select_two);
endmodule
