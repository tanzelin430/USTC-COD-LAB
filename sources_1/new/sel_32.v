`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 20:26:06
// Design Name: 
// Module Name: sel_32
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


module select_32_bit(
    input control,
    input [31:0] select_one,
    input [31:0] select_two,
    output [31:0] result
    );

    assign result = (control == 1'b0 ? select_one : select_two);
endmodule
