`timescale 1ns / 1ps

module adder(
    output [31:0]out,
    input [31:0]a,
    input [31:0]b,
    input c_in
    );
    wire c_out;
    
    assign {c_out,out} = a + b + c_in;
    
endmodule
