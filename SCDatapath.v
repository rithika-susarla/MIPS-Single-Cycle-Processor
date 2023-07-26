`timescale 1ns / 1ps

module SCDatapath(
    input clk,
    input reset
    );
    
    //Instruction Memory I/O
    reg [31:0]PC;
    wire [31:0]Instruction;
    
    //Control Unit I/O
    wire RegDst,Jump,Branch,MemRead,MemtoReg,MemWrite,ALUSrc,RegWrite;
    wire [1:0]ALUOp;
    
    //Register File I/O
    wire [31:0]Read_Data_1,Read_Data_2;
    wire [4:0]Read_Register_1,Read_Register_2,Write_Register;
    wire [31:0]Write_Data;
    
    //Sign Extend I/O
    wire [31:0]ext;
    
    //ALU I/O
    wire [31:0]ALU_Result,extended_data;
    wire [3:0]ALUC;
    wire Zero;
    
   //Data Memory I/O
    wire Read_Data_Out;
    
   //and gate I/O
    wire control_branch;
    
  //adder I/O  
    wire [31:0]PC_Address;
    
  //Datapath Additional I/O
    wire [31:0]Jump_Address,Branch_Address0,Branch_Address;
    
  //Reg to Combinational I/O
    wire [31:0]PCForward;
  
  //Always Block to convert PC from reg to combinational logic
    always@(posedge reset or posedge clk)
    begin
    if(reset)
    PC<=0;
    else
    PC <= PCForward;
    end
    
    //Instantiation of Block Modules
    
    adder add1(PC_Address,PC,4,0);
    
    assign Jump_Address = {PC_Address[31:28],Instruction[25:0],2'b00};
    
    assign Read_Register_1 = Instruction[25:21];
    assign Read_Register_2 = Instruction[20:16];
    
    adder add2(Branch_Address0,PC_Address,{extended_data,2'b00},0);
    assign Branch_Address = control_branch ? Branch_Address0:PC_Address;
    assign PCForward = Jump ? Jump_Address:Branch_Address;
    
    Instruction_Memory inst(PC,reset,Instruction);
    
    Control_Unit control(RegDst,Jump,Branch,MemRead,MemtoReg,ALUOp,MemWrite,ALUSrc,RegWrite,Instruction[31:26]);
    
    assign Write_Register = RegDst ? Instruction[15:11]:Instruction[20:16];
    Register_File regfile(Read_Register_1,Read_Register_2,Write_Register,Write_Data,RegWrite,clk,reset,Read_Data_1,Read_Data_2);
    
    sign_extend signext(ext,Instruction[15:0]);
    
    assign extended_data = ALUSrc ? ext:Read_Data_2;
    ALU alu(ALU_Result,Zero,Read_Data_1,extended_data,ALUC,ALUSrc,Instruction);
    
    and gate1(control_branch,Branch,Zero);
    
    ALU_Control alucontrol(ALUC,ALUOp,Instruction[5:0]);
    
    Data_Memory datmem(ALU_Result,Read_Data_2,MemWrite,MemRead,reset,clk,Read_Data_Out);
    assign Write_Data = MemtoReg ? Read_Data_Out:ALU_Result;
    
    
    
    

   
endmodule
