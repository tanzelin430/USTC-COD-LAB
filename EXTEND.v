`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/24 10:29:53
// Design Name: 
// Module Name: EXTEND
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


module Extend(
    input [15:0] data,
    output reg[31:0] outData
);
always@(*)
    begin
        outData[15:0] = data;
        outData[31:16] = (data[15])? 16'hffff : 16'h0000;
    end 
endmodule
