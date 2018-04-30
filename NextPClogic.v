`timescale 1ns / 1ps
module NextPClogic(NextPC, CurrentPC, SignExtImm64, Branch, ALUZero, Uncondbranch);
       input [63:0] CurrentPC, SignExtImm64;
       input Branch, ALUZero, Uncondbranch;
       output reg [63:0] NextPC;
       /* write your code here */
//branch is ture if condit brnahc instr
//uncond branch is true if ALUZERO is the zero output of the ALU
//constatn additoins delay of 1
////general addition delay of 2
//multiplexers delay of 1
//statments inside if else
reg [63:0] tempImm64 ;
//#1
//sign  =   sign << 2; 	
//#2 next  <=   sign + CurrentPC ;

//assinging our NextPC value to next so that we 
//can assign it to things within the always block


always @(*)
begin  //starting begin
//getting our value of sign 
//so that we can extend it and assign it
tempImm64 = SignExtImm64 << 2 ;

if (Uncondbranch)begin
		NextPC <= #1 CurrentPC + tempImm64 ;

end
else if (Branch)begin //conditional branches
	if (ALUZero ==1)begin
		NextPC <= #2 CurrentPC + tempImm64 ;

	end
	else begin
		NextPC <= #2 CurrentPC +4 ;
		end
	end
else begin
	NextPC <= #2 CurrentPC +4 ;
		end
	end
endmodule










