`timescale 1ns / 1ps

module five_one_mux(
    input [4:0]a,
    input [2:0]sel,
    output reg b
    );
    
    always @(*)
    begin
    case(sel)
    
    3'b000: b=a[0];
    3'b001: b=a[1];
    3'b010: b=a[2];
    3'b011: b=a[3];
    3'b100: b=a[4];
    endcase
    
    end
    
    
    
endmodule
