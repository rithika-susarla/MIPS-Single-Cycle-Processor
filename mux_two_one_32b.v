`timescale 1ns / 1ps

module mux_two_one_32b#(parameter N=32)(
    output [N-1 : 0] out,
    input [N-1 : 0] in0,
    input [N-1 : 0] in1,
    input sel
    );
    
    
    assign out  = sel ? in1 : in0;
    
    
    
endmodule
