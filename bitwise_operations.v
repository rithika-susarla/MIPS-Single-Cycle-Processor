`timescale 1ns / 1ps

module bitwise_operations(
    output [31:0]out,
    input [31:0]a,
    input [31:0]b,
    input control    
    );
    
    wire [31:0]w1,w2;
    
    assign out = control ? w2 : w1;
    
    assign w1 = a&b;
    assign w2 = a|b;
    
endmodule
