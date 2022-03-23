`timescale 1ns/1ps
`include "FSK_MODEM.v"
`include "MONITOR.v"

module TOP;

FSK_MODEM FSK_MODEM(.RESET(RESET)
.TX_CLK(TX_CLK) , .TX_DATA(TX_DATA),
.FSK_OUT(FSK_OUT));

MONITOR MONITOR(.RESET(RESET),
.TX_CLK(TX_CLK), .TX_DATA(TX_DATA),
.FSK_OUT(FSK_OUT));

endmodule