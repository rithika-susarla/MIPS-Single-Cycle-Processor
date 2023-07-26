`timescale 1ns / 1ps

module rightshifter(
    output [31:0]out,
    input [31:0]in,
    input arith,
    input [31:0]s
    );
    
    wire [31:0]w0,w1,w2,w3,w4;
    wire z;
    
    assign z = arith & in[31];
    
    
    mux_two_one_32b u0(w0,in,{32{z}},s[0]);
    mux_two_one_32b u1(w1,w0,{{16{z}}, w0[31:16]},s[1]);
    mux_two_one_32b u2(w2,w1,{{8{z}}, w1[31:8]},s[2]);
    mux_two_one_32b u3(w3,w2,{{4{z}}, w2[31:4]},s[3]);
    mux_two_one_32b u4(w4,w3,{{2{z}}, w3[31:2]}, s[4]);
    mux_two_one_32b u5(out,w4,{z, w4[31:1]}, s[5]);
    
    
endmodule
