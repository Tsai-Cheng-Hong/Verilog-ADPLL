//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: PLL Controller                            //
//------------------------------------------------------//

`timescale 1ns/1ps
module CONTROLLER(reset, phase_clk, p_up, p_down, 
                  dco_code, freq_lock, polarity);

input	       reset, phase_clk;
input          p_up, p_down;
output reg [4:0]   dco_code;
output reg     freq_lock;
output reg     polarity;

reg [4:0] step;
reg [4:0] pre_step;
reg up;
reg pre_up;
 
//Write Your PLL Controller Here
always@(negedge phase_clk or posedge reset)
begin
	if (reset)
	polarity <= 1'b0;
	else if (pre_up ^ up == 1'b1) //?
	polarity <= 1'b1;
	else
	polarity <= 1'b0; 
end

always@(negedge p_down or negedge p_up)
begin
	if(p_up == 1'b0)
	up <= 1'b1;
	else
	up <= 1'b0;
end

always@(negedge phase_clk)
begin
	if (reset)
	pre_up <= 1'b0;
	else
	pre_up <= up;
end

always@(negedge phase_clk or posedge reset)
begin
	if (reset)
	step <= 5'd4;
	else if (step == 1'b1)
	step <= step;
	else if (polarity == 1'b1)
	step <= step >> 1; //?
	else 
	step <= step;
end

always@(posedge phase_clk)
begin
	if (reset)
	pre_step <= 5'd0;
	else
	pre_step <= step;
end

always@(negedge phase_clk or posedge reset)
begin
	if(reset)
	dco_code <= 5'd16;
	else if (up == 1'b1)
	dco_code <= dco_code + step;
	else
	dco_code <= dco_code - step;
end 

always@(negedge phase_clk or posedge reset)
begin
	if (reset)	
	freq_lock <= 1'b0;
	else if(pre_step== 1'b1)
	freq_lock <= 1'b1;
	else
	freq_lock <= 1'b0;
end

endmodule