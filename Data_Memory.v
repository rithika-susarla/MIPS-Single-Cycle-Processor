`timescale 1ns / 1ps

module Data_Memory(
    input [31:0] Address,
    input [31:0] Write_Data,
    input Mem_Write,
    input Mem_Read,
    input reset,
    input clk,
    output reg [31:0] Read_Data
    );
    
    reg [31:0] Data_Mem [7:0];
    
    
    
    always@(reset)
    begin
        if(reset)
            $readmemh("Data.mem",Data_Mem);
     end       
           
    
    
    always@(posedge clk)
     begin
    
        if(Mem_Write)
            begin
                Data_Mem[Address]<=Write_Data;
            end
    
        else if(Mem_Read)
            begin
                Read_Data<=Data_Mem[Address];
            end
    
     end
endmodule
