`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2020/05/24 10:43:45
// Design Name: 
// Module Name: ctrl_unit
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


module Control(
	 input clk,
	 input reset,
	 input [5:0] op,                  // op??????
	 output reg [1:0] PCSrc,         // PC??¡¤?????
     output reg ALUSrcA,
	 output reg [1:0] ALUSrcB,       // ALU??¡¤?????
	 output reg IorD,
     output reg MemtoReg,            // ??¡¤?????
	 output reg IRWrite,
     output reg RegWrite,            // (RF)§Õ????????1??????????????§Õ??
     output reg MemWrite,            // (DM)????›¥????§Õ?????????1§Õ???0??
     output reg RegDst,              // ??¡¤?????
	 output reg PCwritecond,
	 output reg PCWrite,
	 output reg [1:0] ALUop
);
reg [3:0] current_state,next_state;
parameter [5:0] R_type = 6'b000000,
                addi = 6'b001000,
                sw = 6'b101011,
                lw = 6'b100011,
                beq = 6'b000100,
                j = 6'b000010;
parameter [3:0] IF =4'b0000,ID_RF = 4'b0001,mem_addr_compute = 4'b0010,execution = 4'b0110,branch_completion = 4'b1000,jump_completion = 4'b1001,mem_access_lw = 4'b0011,mem_access_sw = 4'b0101,R_type_completion = 4'b0111,writeback = 4'b0100,addi_completion = 4'b1010;
                   

    always@(posedge clk or posedge reset)
    begin
    if (reset) current_state <= IF;
    else current_state <= next_state;
    end
    always@(*)
    begin
        case(current_state)
            IF: next_state <= ID_RF;
            ID_RF: begin
                    if (op == lw || op == sw || op == addi) next_state <= mem_addr_compute;
                    else if (op == R_type) next_state <= execution;
                    else if (op == beq) next_state <= branch_completion;
                    else if (op == j) next_state <= jump_completion;
                    end
            mem_addr_compute:begin
                            if (op == lw) next_state <= mem_access_lw;
                            else if (op == sw) next_state <= mem_access_sw;
                            else if (op == addi)next_state <= addi_completion;
                            end
            mem_access_lw : next_state <= writeback;
            mem_access_sw : next_state <= IF;
            writeback : next_state <=IF;
            execution : next_state <= R_type_completion;
            R_type_completion:next_state<=IF;
            addi_completion:next_state <= IF;
            jump_completion:next_state <= IF;
            branch_completion:next_state <= IF;
        endcase
    end
    always@(posedge clk or posedge reset)
    begin
        IorD <= 0;
	    PCwritecond <= 0;
	    PCWrite <= 0;
	    IRWrite <= 0;
	    RegDst <= 0;
	    ALUSrcA <= 0;
	    ALUSrcB <= 2'b01;
        RegWrite <= 0;
        MemWrite <= 0;
        MemtoReg <= 0;
	    ALUop <= 2'b00;
	    PCSrc <= 2'b00;
        if (reset);
        else 
        begin
        case(current_state)//
            IF: begin
            PCWrite <= 1;
            IRWrite <= 1;
            end
            ID_RF:
                begin
                ALUSrcB <= 2'b11;
                end
            mem_addr_compute:
                    begin
                    ALUSrcA <= 1;
                    ALUSrcB <= 2'b10;
                    end  
            execution:begin
                    ALUSrcA <= 1;
                    ALUSrcB <= 2'b00;
                    ALUop <= 2'b10;
                    end
            branch_completion:begin
                    ALUSrcA <= 1;
                    ALUSrcB <= 2'b00;
                    ALUop <= 2'b01;
                    PCSrc <= 2'b01;
                    PCwritecond <= 1;
                    end
            jump_completion:begin
                    PCSrc <= 2'b10;
                    PCWrite <= 1;
                    end
            mem_access_lw:IorD <= 1;
            mem_access_sw:begin
			        IorD <= 1;
			        MemWrite <= 1;
			        end
            addi_completion:begin
                            RegWrite <= 1;
                            end
            R_type_completion:begin
                            RegDst <= 1;
			                RegWrite <= 1;
                            end
            writeback:begin
                MemtoReg <= 1;
			    RegWrite <= 1;
                end
        endcase
        end

    end
endmodule