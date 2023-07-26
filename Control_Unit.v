`timescale 1ns / 1ps

module Control_Unit(
    output RegDst,
    output Jump,
    output Branch,
    output MemRead,
    output MemtoReg,
    output [1:0]ALUOp,
    output MemWrite,
    output ALUSrc,
    output RegWrite,
    input [5:0]Opcode
    );
    
    
    assign RegDst = ~|(Opcode);
    assign Branch = Opcode[2]; 
    assign MemRead = Opcode[5] & ~Opcode[3];
    assign MemtoReg = MemRead;
    assign MemWrite = Opcode[3] & Opcode[5];
    assign ALUSrc = Opcode[0] | Opcode[3];
    assign RegWrite = Opcode[0] | (~Opcode[2] & ~Opcode[1]); 
    assign Jump = Opcode[1] ^ Opcode[0];
    
    assign ALUOp = {RegDst,Opcode[2]};   
    
endmodule
