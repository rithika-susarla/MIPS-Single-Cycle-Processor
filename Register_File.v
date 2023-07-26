`timescale 1ns / 1ps

module Register_File(
    input [4:0] Read_Register_1,
    input [4:0] Read_Register_2,
    input [4:0] Write_Register,
    input [31:0] Write_Data,
    input Reg_Write,
    input clk,
    input reset,
    output [31:0] Read_Data_1,
    output [31:0] Read_Data_2
       );
       
    reg [31:0] Reg_Mem [31:0];
    
    
      assign Read_Data_1 = Reg_Mem[Read_Register_1];
      assign Read_Data_2 = Reg_Mem[Read_Register_2];
    
    always@(reset)
    begin
    if (reset)
        $readmemh("Registers.mem",Reg_Mem);
    end
    
 always@(posedge clk) //check this later
    begin
    if(Reg_Write)
        Reg_Mem[Write_Register]<=Write_Data;
    end
endmodule
