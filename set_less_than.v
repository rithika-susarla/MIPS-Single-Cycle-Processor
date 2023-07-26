`timescale 1ns / 1ps

module set_less_than(
    output [31:0]out,
    input [31:0]adder_out
    );
    
assign out = {{31{1'b0}},~|(adder_out)};
    
endmodule
