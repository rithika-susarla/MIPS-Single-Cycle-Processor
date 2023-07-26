`timescale 1ns / 1ps

module two_one_mux(
    output out,
    input a,
    input b,
    input sel
    );
    
    assign out = sel ? a:b;
    
endmodule
