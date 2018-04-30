
`timescale 1ns / 1ps

module MiniRegisterFile(BusA, BusB, BusW, RA, RB, RW, RegWr, Clk);
    //Outputs
    output  [63:0] BusA;
    output  [63:0] BusB;
    //Inputs
    input [63:0] BusW;
    input [4:0] RA;
    input [4:0] RB; 
    input [4:0] RW;

    input RegWr;
    input Clk;
    
    
    //each of these lines is 32 bits reg[0] and reg[1]
    reg [63:0] registers [31:0];

       //registers[31:0]=32'b0000_0000_0000_0000_0000_0000_0000_0000 ;  
    //registers [31:0] = 0 ;
    //reg memory_wdith memory_identifier memory_depth 
                assign #2 BusA = registers[RA];
                assign #2 BusB = registers[RB];
            

        integer i ;
initial begin
        for ( i = 0 ; i <32 ; i ++ )begin
            registers[i] <= 0 ;

        end


end
      //assign #2 BusA = registers[RA];
      //assign #2 BusB = registers[RB];
                
    always @ (negedge Clk) begin

            registers[31]<= #3  0 ;

        if(RegWr)

                begin
            if (RW != 31)
                begin
            registers[RW]<= #3 BusW ;
                end
        
                 end
                        end
endmodule






