`timescale 1ns / 1ps

module Instruction_Memory(
    input [31:0]PC,
    input reset,
    output [31:0] Instruction
    );
    
    reg [7:0] Mem [35:0];
    
    assign Instruction = {Mem[PC], Mem[PC+1], Mem[PC+2], Mem[PC+3]};
    
    always @ (reset)
    begin
    if(reset)
        $readmemh("Instructions.mem",Mem);
    end
    
endmodule
