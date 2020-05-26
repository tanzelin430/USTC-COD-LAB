`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/24 22:04:50
// Design Name: 
// Module Name: TOP
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


module TOP(
	input clk,
	input reset
	);
	
	wire reset_edge;
	wire [1:0] ALUop,ALUSrcB,PCSrc;
	wire [2:0] ALUControl;
    wire [4:0] Write_Register;
    wire [31:0] Read_Data1,Read_Data2,Write_Data;
	wire [31:0] A,B,newAddress,Mem_Data,Mem_Data_out,currentAddress,ALU_out,memaddr,Ins_out,ALU_A,ALU_B,ALUOut;
    wire [31:0] Extend_Immediate,JumpAddress; 
    wire [33:0] SignExtend_leftshift;
    wire [27:0] Ins_out_leftshift;
    wire Zero,IorD,PCen,PCwritecond,PCWrite,IRWrite,ALUSrcA,RegWrite,MemtoReg,MemWrite,RegDst,cf,of,sf;
    assign PCen=(~Zero&PCwritecond)|PCWrite;
    assign Ins_out_leftshift = Ins_out[25:0] << 2;
    assign SignExtend_leftshift = Extend_Immediate << 2;
    assign JumpAddress={currentAddress[31:28],Ins_out_leftshift};
    signal_edge sigedge(clk,reset,reset_edge);
    PC pc(clk,reset_edge,PCen,newAddress,currentAddress);
    select_32_bit Mux_lord(IorD,currentAddress,ALUOut,memaddr); 
    dist_mem_gen_0  Memory(
            .clk(clk),
            .we(MemWrite),
            .a(memaddr[10:2]),
            .d(B),
            .spo(Mem_Data)
            );  
     ins_reg Instruction_reg(IRWrite,Mem_Data,Ins_out);
     Control control(clk,reset_edge,Ins_out[31:26],PCSrc,ALUSrcA,ALUSrcB,IorD,MemtoReg,IRWrite,RegWrite,MemWrite,RegDst,PCwritecond,PCWrite,ALUop);
     clk_reg Memory_data_register(clk,Mem_Data,Mem_Data_out);
     select_32_bit Mux_MemtoReg(MemtoReg,ALUOut,Mem_Data_out,Write_Data);   
     five_bit_2to1 five_bit_sel_one(Ins_out[20:16],Ins_out[15:11],RegDst,Write_Register); 
     register_file reg_file(clk,1,Ins_out[25:21],Read_Data1,Ins_out[20:16],Read_Data2,Write_Register,RegWrite,Write_Data);
     clk_reg RegA(clk,Read_Data1,A);
     clk_reg RegB(clk,Read_Data2,B);
     Extend extend(Ins_out[15:0],Extend_Immediate);
     select_32_bit	Mux_SrcA(ALUSrcA,currentAddress,A,ALU_A);
     sel_32_4to1 Mux_SrcB(ALUSrcB,B,32'h4,Extend_Immediate,SignExtend_leftshift[31:0],ALU_B);
     ALUctrl alu_ctrl(ALUop,Ins_out[5:0],ALUControl);
     alu alu_unit(ALU_out,Zero,cf,of,sf,ALU_A,ALU_B,ALUControl);
     clk_reg Reg_ALU(clk,ALU_out,ALUOut);
     MUX_3to1 MuxPC(PCSrc,ALU_out,ALUOut,JumpAddress,newAddress);
endmodule
