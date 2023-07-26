`timescale 1ns / 1ps

module logic_left_shift(
    input [4:0]x,
    input [2:0]sel,
    output reg [4:0]y
    );
    
    five_one_mux u1(x[0],x[1],x[2],x[3],x[4],sel,y[4]);
    five_one_mux u2(0,x[0],x[1],x[2],x[3],sel,y[3]);
    five_one_mux u3(0,0,x[0],x[1],x[2],sel,y[2]);
    five_one_mux u4(0,0,x[0],x[1],sel,y[1]);
    five_one_mux u5(0,0,0,0,x[0],sel,y[0]);
    
    always @(*)
    begin
    case(sel)
    
    3'b000: 
        y[4]=x[4];
        y[3]=x[3];
        y[2]=x[2];
        y[1]=x[1];
        y[0]=x[0];
    3'b001: 
        y[4]=x[3];
        y[3]=x[2];
        y[2]=x[1];
        y[1]=x[0];
        y[0]=0;
    3'b010:
        y[4]=x[2];
        y[3]=x[1];
        y[2]=x[0];
        y[1]=0;
        y[0]=0; 
    3'b011: 
        y[4]=x[1];
        y[3]=x[0];
        y[2]=0;
        y[1]=0;
        y[0]=0;
    3'b100: 
        y[4]=x[0];
        y[3]=0;
        y[2]=0;
        y[1]=0;
        y[0]=0;
    endcase
    
    end
   
endmodule
