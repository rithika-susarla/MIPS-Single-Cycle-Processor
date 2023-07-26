`timescale 1ns / 1ps

module ALU_Control(
    output [3:0] ALUC,
    input [1:0] ALUOp,
    input [5:0] funct
    );
    
    wire [3:0] ALUC0,ALUC1;
    
    assign ALUC1[3] = ~(funct[5]);
    assign ALUC1[2] = funct[5] & ~(funct[2]);
    assign ALUC1[1] = funct[0] | funct[3];
    assign ALUC1[0] = funct[1] | funct[0];
    
    assign ALUC0={1'b0,1'b1,1'b0,ALUOp[0]};
    
    assign ALUC = ALUOp[1] ? ALUC1:ALUC0;
    
    
endmodule  
