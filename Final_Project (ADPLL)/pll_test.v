//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Demo2: DCO Modeling                                 //
//------------------------------------------------------//

//Include Sub modules

`timescale 1ns/1ps
module pll_test(OUT_CLK, freq_lock, reset, M, REF_CLK);

output reg	reset;
output reg[2:0]	M;
output	reg	REF_CLK;
input		OUT_CLK;
input		freq_lock;


reg       R_REF_CLK;
//parameter      K = 0.96;
parameter      phase = 1;
parameter      K = 0.9;

reg [3:0]	counter;
integer      fp;
real		Cycle;
real		OutCycle;

real		LockInTime;
real		lastTime;
real		RefPeriod;
real		outPeriod;
real		outClock;
real		lastPeriod;
real		Jper;
real		Jcc;
real		Jlong;
real		CycleTime;

/*
pfd_model	pfd(.RESET_B(R_reset), .IN_clk(REF_CLK), .FB_clk(Out_divM), .flagU(flagU), .flagD(flagD));
dco_model	dco(.reset_(R_reset), .coarse(coarse), .dco_out(OUT_CLK));
FREQ_DIV	div(.reset(reset), .clk(OUT_CLK), .M(M), .Out_divM(Out_divM));
CONTROLLER	c0(.reset(reset), .phase_clk(REF_CLK), .p_up(flagU), .p_down(flagD), .coarse(coarse), .freq_lock(freq_lock), .polarity(polarity));
*/
always@(*) #(K*M) REF_CLK <= ~REF_CLK;
//always@(*) #(K*M) R_REF_CLK <= ~R_REF_CLK;
//always@(*) #(phase) REF_CLK <= R_REF_CLK;
//assign R_reset = ~reset;


initial begin
//WaveDump all signals
fp=$fopen("data.csv");
$dumpfile("pll_test.vcd");
$dumpvars;

reset=1'b0;
counter = 16'd0;
M = 3'b001;
RefPeriod = K*M*2;
REF_CLK=1'b0;
//R_REF_CLK=1'b0;
#30
reset=1'b1;
//last_coarse = coarse;
$fdisplay(fp, "Cycle,", "Output Clock,", "Period jitter,","Cycle-to-Cycle jitter,","N-Cycle jitter,");

#50000

$display("Reference Clock = %d", 1000/RefPeriod, "MHz");
$display("Lock-In Time = %d", LockInTime, " Cycle");
$fdisplay(fp, "Reference Clock = %d", 1000/RefPeriod, "MHz");
$fdisplay(fp, "Lock-In Time = %d", LockInTime, " Cycle");
$finish;

end

always@(negedge REF_CLK or negedge reset)
begin
	if(!reset)
	begin
		Cycle <= 0;
	end
	else
	begin
		Cycle <= Cycle + 1;
	end
end

always@(posedge freq_lock or negedge reset)
begin
	if(!reset)
	begin
		LockInTime <= 0;
	end
	else
	begin
		LockInTime <= Cycle;
	end
end


always@(negedge OUT_CLK or negedge reset)
begin
	if(!reset)
	begin
		Jcc <= 0;
		lastPeriod <= 0;
		outPeriod <= 0;
		lastTime <= 0;
		Jper <= 0;
		CycleTime <= 0;
		Jlong <= 0;
		OutCycle <= 0;
		outClock <= 0;
	end
	else
	begin
		OutCycle <= OutCycle + 1;
		outPeriod <= $realtime - lastTime;
		lastTime <= $realtime;
		Jcc <= outPeriod - lastPeriod;
		lastPeriod <= outPeriod;
		Jper <= outPeriod - RefPeriod/M;
		CycleTime <= OutCycle*RefPeriod/M;
		Jlong <= $realtime - CycleTime;
		outClock <= 1000/outPeriod;
		$fdisplay(fp, OutCycle,",", outPeriod,",", Jper,",", Jcc,",", Jlong);


	end
end

endmodule
            	
