`timescale 1ns / 1ps

module shift_left_two(
    output [31:0]out,
    input [31:0]in
    );
    
    
    assign out = in<<2;
    
endmodule
