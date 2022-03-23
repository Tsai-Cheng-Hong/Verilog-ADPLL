//test
//top
`include "pfd_model.v"
`include "dco_encode.v"
`include "FREQ_DIV.v"
`include "CONTROLLER.v"
`include "pll_test.v"

`timescale 1ns/1ps

module TOP;
wire		reset;
wire [2:0]	M;
wire		REF_CLK;
wire		OUT_CLK;
wire		freq_lock;

wire		flagU, flagD;
wire		Out_divM;

wire [7:0]	dco_code;
//wire		R_reset;


wire		polarity;


//assign R_reset = ~reset;

pll_test	test(.OUT_CLK(OUT_CLK), .freq_lock(freq_lock), .reset(reset), .M(M), .REF_CLK(REF_CLK));
pfd_model	pfd(.RESET_B(reset), .IN_clk(REF_CLK), .FB_clk(Out_divM), .flagU(flagU), .flagD(flagD));
dco_encode	dco(.reset(reset), .dco_code(dco_code), .dco_out(OUT_CLK));
FREQ_DIV	div(.R_reset(reset), .clk(OUT_CLK), .M(M), .Out_divM(Out_divM));
CONTROLLER	c0(.R_reset(reset), .phase_clk(REF_CLK), .p_up(flagU), .p_down(flagD), .dco_code(dco_code), .freq_lock(freq_lock), .polarity(polarity));

endmodule
