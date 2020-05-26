`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/24 10:37:26
// Design Name: 
// Module Name: alu
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


module alu
#(parameter width = 32) 	//???????
(output reg[width-1:0] y, 		//??????
output reg zf, 					//????
output reg cf, 					//??¦Ë/??¦Ë???
output reg of,//??????
output reg sf,//????¦Ë				
input [width-1:0] a, b,		//????????
input [2:0]m						//????????
);
localparam ADD = 3'b000, SUB = 3'b001, AND = 3'b010, OR = 3'b011, XOR = 3'b100;
initial y <= 0;
always@(*)
begin
    case(m)
    ADD: 
    begin
    {cf,y} = a + b;
    of = (~a[width-1]&~b[width-1]&y[width-1])|(a[width-1]&b[width-1]&~y[width-1]);
    zf = ~|y;
    sf = y[width-1];
    end
    SUB:
    begin
    {cf,y} = a - b;
    of = (~a[width-1]&b[width-1]&y[width-1])|(a[width-1]&~b[width-1]&~y[width-1]); 
    zf = ~|y;
    sf = y[width-1];
    end
    AND:
    begin
    y = a & b;
    sf = y[width-1];
    zf = ~|y;
    end
    OR:
    begin
    y = a | b;
    sf = y[width-1];
    zf = ~|y;
    end
    XOR:
    begin
    y = a ^ b;
    sf = y[width-1];
    zf = ~|y;
    end
    endcase
end
endmodule
