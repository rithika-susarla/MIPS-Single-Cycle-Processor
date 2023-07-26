`timescale 1ns / 1ps

module barrelshifter(
    output [31:0]out,
    input [31:0]in,
    input [31:0]s,
    input arith,
    input sel
    );
    
    wire [31:0]w1,w2,out0,out1;
    
    rightshifter u1(out0,in,arith,s[5:0]);
    leftshifter u2(out1,in,s[5:0]);
    
    
    mux_two_one_32b u3(out,out0,out1,sel);
    
    
endmodule

