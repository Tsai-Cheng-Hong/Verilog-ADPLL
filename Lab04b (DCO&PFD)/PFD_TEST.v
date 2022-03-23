//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Demo1: 8/9 Prescaler Verilog Demo Code              //
//------------------------------------------------------//

//Include Sub modules
`include "PFD_MODEL.v"

`timescale 1ns/1ps
module PFDTEST;

reg RESET_b;   //System Reset
reg IN_clk,FB_clk; //Reference Clock
wire flagU,flagD;

//Instanitate prescaler module
PFD_MODEL pfd(.RESET_b(RESET_b),.IN_clk(IN_clk),.FB_clk(FB_clk),.flagU(flagU),.flagD(flagD));
// use .XXXX let the two circuit can talk.


always@(*)#3.0 IN_clk <=~IN_clk;
always@(*)#3.0 FB_clk <=~FB_clk;

initial begin
//WaveDump all signals
$fsdbDumpfile("lab02.fsdb");
$fsdbDumpvars;

RESET_b=1'b0;
IN_clk=1'b0;
#0.04FB_clk=1'b0;
 
#30 RESET_b=1'b1;


#5000 $finish;
end

endmodule
            