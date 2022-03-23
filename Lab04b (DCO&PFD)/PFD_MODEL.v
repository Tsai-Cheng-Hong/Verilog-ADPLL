//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Demo2: DCO Modeling                                 //
//------------------------------------------------------//

`timescale 1ns/1ps
module PFD_MODEL(RESET_b,IN_clk,FB_clk,flagU,flagD);
input RESET_b,IN_clk,FB_clk;
output flagU,flagD;
reg QU,QD,flagU,flagD,OUTU,OUTD;
wire reset,OUTBU,OUTBD;

//reset CDN
assign reset = ~(QU && QD) && RESET_b;
//reset is the real reset of the circuit.


// reset QU and QD
always@(posedge IN_clk or negedge reset)
begin
	if(!reset)
	begin
		QU<=1'b0;
	end
	else
		QU<=1'b1;
end 

always@(posedge FB_clk or negedge reset)
begin
	if(!reset)
	begin
		QD<=1'b0;
	end

	else 
		QD<=1'b1;
end 

//40ps do this job
always@(QU or QD) OUTU <= #0.04 ~(QU && !QD);
always@(QU or QD) OUTD <= #0.04 ~(!QU && QD);
assign #0.04 OUTBU = OUTU;
assign #0.04 OUTBD = OUTD;

// When outbu=0 flagu=0, so flagu = outbu.
always@(posedge IN_clk or negedge OUTBU)
begin
	if(!OUTBU)
	begin
		flagU <= 1'b0;
	end
	else
	begin 
		flagU <= 1'b1;
	end
end

always@(posedge FB_clk or negedge OUTBD)
begin
	if(!OUTBD)
	begin
		flagD <= 1'b0;
	end
	else
	begin 
		flagD <= 1'b1;
	end
end

endmodule
            