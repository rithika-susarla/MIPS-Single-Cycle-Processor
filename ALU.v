`timescale 1ns / 1ps
module ALU(
    output [31:0]ALU_Result,
    output Zero,
    input [31:0]Read_Data_1,
    input [31:0]ext_data,
    input [3:0]ALUC,
    input ALUSrc,
    input [31:0]Instruction
    );
    
    wire [31:0] w3,w4,w5,w6,out0,out1,out2;
    
  
    assign w4 = ext_data^{32{ALUC[0]}}; //complement of ext data
    
    //Creating Muxes for ALU 
    
    assign w3= ALUC[2] ? out1:out0;
    assign ALU_Result = ALUC[3]? out2 : w3;
    
    //Initializing three block modules: bitwise,adder,shifter (separating the operations into sets)
    
    bitwise_operations v1(out0,Read_Data_1,ext_data,ALUC[0]);
    
    adder v2(w5,Read_Data_1,w4,ALUC[0]);
    set_less_than u3(w6,w5);
    assign out1 = ALUC[1] ? w6:w5;
    
    barrelshifter v3(out2,Read_Data_1,ext_data,ALUC[1],ALUC[0]);
    
    assign Zero = ~|(ALU_Result);

   
endmodule
