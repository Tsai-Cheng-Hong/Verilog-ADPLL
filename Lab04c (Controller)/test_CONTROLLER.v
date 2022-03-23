//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: PLL Controller                            //
//------------------------------------------------------//

//Include Sub modules
`include "CONTROLLER.v"

`timescale 1ns/1ps
module TEST;

reg        RESET;   //System Reset
reg        P_UP;    //PFD output 
reg        P_DOWN;  //PFD output
reg        PHASE_CLK; //Phase Clock

wire [4:0] CODE;

//Instanitate Controller module
CONTROLLER CONTROLLER(.reset(RESET), 
           .phase_clk(PHASE_CLK), .p_up(P_UP), .p_down(P_DOWN),
           .dco_code(CODE), .freq_lock(FREQ_LOCK),
            //debug pins
           .polarity(POLARITY)); 

//Generate phase clock
always@(P_UP or P_DOWN) PHASE_CLK <= #0.3 (P_UP && P_DOWN);

initial begin
//WaveDump all signals
$fsdbDumpfile("CONTROLLER.fsdb");
$fsdbDumpvars;

RESET=1'b1;
P_UP=1'b1; P_DOWN=1'b1;
 
#20 RESET=1'b0;

//TEST UP
#20 P_UP=1'b0;
#2  P_UP=1'b1;
#20 P_UP=1'b0;
#2  P_UP=1'b1;
#20 P_UP=1'b0;
#2  P_UP=1'b1;

//TEST DOWN
#20 P_DOWN=1'b0;
#2  P_DOWN=1'b1;
#20 P_DOWN=1'b0;
#2  P_DOWN=1'b1;
#20 P_DOWN=1'b0;
#2  P_DOWN=1'b1;

//TEST UP/DOWN
#20 P_DOWN=1'b0;
#2  P_DOWN=1'b1;
#20 P_UP=1'b0;
#2  P_UP=1'b1;
#20 P_UP=1'b0;
#2  P_UP=1'b1;
#20 P_DOWN=1'b0;
#2  P_DOWN=1'b1;
#20 P_UP=1'b0;
#2  P_UP=1'b1;
#20 P_DOWN=1'b0;
#2  P_DOWN=1'b1;
#20 P_UP=1'b0;
#2  P_UP=1'b1;
#20 P_DOWN=1'b0;
#2  P_DOWN=1'b1;
#20 P_UP=1'b0;
#2  P_UP=1'b1;
#20 P_DOWN=1'b0;
#2  P_DOWN=1'b1;
#15 $finish;
end

endmodule
            
