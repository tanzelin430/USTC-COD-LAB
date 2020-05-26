`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/23 21:22:27
// Design Name: 
// Module Name: reg_file
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


module register_file				//32 x WIDTH???????
#(parameter WIDTH = 32) 	//???????
(input clk,	            //????????????§¹)
input en,					
input [4:0] ra0,				//?????0???
output [WIDTH-1:0] rd0, 	//?????0????
input [4:0] ra1, 				//?????1???
output [WIDTH-1:0] rd1, 	//?????1????
input [4:0] wa, 				//§Õ?????
input we,					//§Õ??????????§¹
input [WIDTH-1:0] wd 		//§Õ???????
);
reg [4:0]addr_reg0;
reg [4:0]addr_reg1;
reg [WIDTH-1:0] mem[0:31];
always@(*)
begin
addr_reg0 <= ra0;
addr_reg1 <= ra1;
end
integer i;
initial
begin
for (i = 0;i < 32;i = i + 1)
mem[i] <= 0;
end;
always@(posedge clk)
begin
if (we && wd)
mem[wa] <= wd;
end
assign rd0 = mem[addr_reg0];
assign rd1 = mem[addr_reg1];
endmodule
