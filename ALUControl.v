`timescale 1ns / 1ps


module ALUControl(ALUCtrl, ALUop, Opcode);
     input [1:0] ALUop;
     input [10:0] Opcode;

     output reg [3:0] ALUCtrl;
//ALUOP 2 bits from main control unit
//opcode 11 bits field in the isntruction bits 31:21

//ALUCrtl 4 bit signal that gets sent to the ALU


//assignging ALUCtrl to cts so we can manipulate it in the always block
always @(*)
	
	begin  //always begin
//ALU ADD
 if (ALUop == 2'b00)
	begin
	ALUCtrl <= #2 4'b0010;	
	end
//pass input b
 else if (ALUop == 2'b01)
	begin
	ALUCtrl <= #2 4'b0111;	
	end
//reads the opcode
 else if (ALUop == 2'b10)
			begin  //r-type begin
//ORRI instruction
if (Opcode == 11'b10110010000 ||Opcode == 11'b10110010001)
	begin
	ALUCtrl<= #2 4'b0001;
end			
//add instruction	
else if (Opcode == 11'b10001011000)
	begin
	ALUCtrl <= #2  4'b0010;	
		end
//sub instruction		
else if (Opcode == 11'b11001011000)
	begin
	ALUCtrl<= #2 4'b0110;
		end
//and instruction		
else if (Opcode == 11'b10001010000)
	begin
	ALUCtrl<=#2  4'b0000;
		end
//orr instruction
else if (Opcode == 11'b10101010000)
	begin
	ALUCtrl<= #2 4'b0001;
		end
//LSL instruction		
else if (Opcode == 11'b11010011011)		
	ALUCtrl <= #2 4'b0011  ; 			
			end	  //r-type end


end  //always end



endmodule
     
