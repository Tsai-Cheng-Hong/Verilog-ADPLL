//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: Design a FSK Modem                        //
//------------------------------------------------------//
`timescale 1ns/1ps
module MONITOR(RESET, TX_CLK, TX_DATA, FSK_OUT);
   input FSK_OUT;
  output RESET, TX_CLK, TX_DATA;
   
    reg  RESET, TX_CLK, TX_DATA;

  always #50 TX_CLK=~TX_CLK; //10MHz TX_CLK

initial begin
$dumpfile("FSK.vcd");
$dumpvars;

TX_DATA = 1'b0;
RESET=1'b1; TX_CLK=1'b0;
#20 RESET=1'b0;
repeat (20) @(negedge TX_CLK) TX_DATA <= $random;
#50 $finish;
end

endmodule
