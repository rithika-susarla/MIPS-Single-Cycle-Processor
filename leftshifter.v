`timescale 1ns / 1ps

module leftshifter(
    output [31:0]out,
    input [31:0]in,
    input [31:0]s
    );
    
    wire [31:0]w0,w1,w2,w3,w4;
    wire z;
    
    assign z=0;
    
    mux_two_one_32b u0(w0,in,{32{z}},s[0]);
    mux_two_one_32b u1(w1,w0,{in[15:0], {16{z}}},s[1]);
    mux_two_one_32b u2(w2,w1,{w1[23:0],{8{z}}},s[2]);
    mux_two_one_32b u3(w3,w2,{w2[27:0],{4{z}}},s[3]);
    mux_two_one_32b u4(w4,w3,{w3[29:0],{2{z}}},s[4]);
    mux_two_one_32b u5(out,w4,{w4[30:0],z},s[5]);
    
endmodule
