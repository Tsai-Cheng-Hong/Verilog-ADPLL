//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: PLL Controller                            //
//------------------------------------------------------//

`timescale 1ns/1ps
module CONTROLLER(R_reset, phase_clk, p_up, p_down, 
                  dco_code, freq_lock, polarity);

input	       R_reset, phase_clk;
input          p_up, p_down;
//output [127:0]   coarse;
output reg	[7:0]   dco_code;

output reg        freq_lock;
output         polarity;

reg	[5:0]	step;
reg	[4:0]	pre_step;
reg		up;
reg		down;
reg		pre_up;

reg	[4:0]	up_counter;
reg	[4:0]	down_counter;

//reg	[7:0]   dco_code;
reg	[7:0]   last_dco_code;
reg        freq_lock_little;
//reg		UD;

wire	reset;

assign	reset = ~R_reset;

//Write Your PLL Controller Here

//assign coarse = (128'd1 << dco_code) - 1'b1;

assign polarity = ~(up | down);

always@(negedge phase_clk or posedge reset)
begin
	if(reset)
	begin
		freq_lock <= 1'b0;
	end
	else if(step == 1'b1)
	begin
		freq_lock <= 1'b1;
	end
	else
	begin
		freq_lock <= freq_lock;
	end
end


always@(posedge phase_clk or posedge reset)
begin
	if(reset)
	begin
		step <= 6'b100000;
	end
	//else if(step == 1'b1)
	else if(step == 6'b000001)
	begin
		step <= step;
	end
	else if(polarity == 1'b1)
	begin
		step <= step >> 1;
	end
	else
	begin
		step <= step;
	end
end

always@(posedge phase_clk)
begin
	if(reset)
	begin
		pre_step <= 5'd0;
	end
	else
	begin
		pre_step <= step;
	end
end



always@(posedge phase_clk or negedge p_down)
begin
	if(!p_down)
	begin
		up <= 1'b0;
	end
	else
	begin
		up <= 1'b1;
	end
end

always@(posedge phase_clk or negedge p_up)
begin
	if(!p_up)
	begin
		down <= 1'b0;
	end
	else
	begin
		down <= 1'b1;
	end
end


always@(negedge phase_clk)
begin
	if(reset)
	begin
		pre_up <= 1'b0;
	end
	else
	begin
		pre_up <= up;
	end
end



always@(negedge phase_clk or posedge reset)
begin
	if(reset)
	begin
		last_dco_code <= 8'd64;
	end
	else if(freq_lock && up_counter == 5'b00100)
	begin
		last_dco_code <= last_dco_code + 1'b1;
	end
	else if(freq_lock && down_counter == 5'b00100)
	begin
		last_dco_code <= last_dco_code - 1'b1;
	end
/*	else if(freq_lock && up_counter == 5'b01000)
	begin
		last_dco_code <= last_dco_code + 2'd2;
	end
	else if(freq_lock && down_counter == 5'b01000)
	begin
		last_dco_code <= last_dco_code - 2'd2;
	end*/
	else if(freq_lock && freq_lock_little == 1'b0)
	begin
		last_dco_code <= dco_code;
	end
	else
	begin
		last_dco_code <= last_dco_code;
	end
end




always@(negedge phase_clk or posedge reset)
begin
	if(reset)
	begin
		freq_lock_little <= 1'b0;
	end
	else if(freq_lock)
	begin
		freq_lock_little <= 1'b1;
	end
	else
	begin
		freq_lock_little <= freq_lock_little;
	end
end



always@(negedge phase_clk or posedge reset)
begin
	if(reset)
	begin
		dco_code <= 8'd64;
	end
	else if(dco_code <= 8'd0)
	begin
		dco_code <= dco_code + 8'd1;
	end
	else if(dco_code >= 8'd127)
	begin
		dco_code <= dco_code - 8'd1;
	end
	else if(up == 1'b1 && down == 1'b0 && dco_code >= (8'd127 - step))
	begin
		dco_code <= 8'd127;
	end
	else if(up == 1'b1 && down == 1'b0)
	begin
		dco_code <= dco_code + step;
	end

	else if(up == 1'b0 && down == 1'b1 && dco_code <= step)
	begin
		dco_code <= 8'd0;
	end
	else if(up == 1'b0 && down == 1'b1)
	begin
		dco_code <= dco_code - step;
	end
/*	else if(polarity && freq_lock && step == 1'b1)
	begin
		dco_code <= last_dco_code;
	end
*/
	else
	begin
		dco_code <= dco_code;
	end
end




always@(negedge phase_clk or posedge reset)
begin
	if(reset)
	begin
		up_counter <= 5'b00000;
	end
	else if(polarity)
	begin
		up_counter <= 5'b00000;
	end
	else if(up_counter == 5'b01000 || down_counter == 5'b01000)
	begin
		up_counter <= 5'b00000;
	end
	else if(up == 1'b1 && down == 1'b0)
	begin
		up_counter <= up_counter + 1;
	end
	else
	begin
		up_counter <= up_counter;
	end
end

always@(negedge phase_clk or posedge reset)
begin
	if(reset)
	begin
		down_counter <= 5'b00000;
	end
	else if(polarity)
	begin
		down_counter <= 5'b00000;
	end
	else if(up_counter == 5'b01000 || down_counter == 5'b01000)
	begin
		down_counter <= 5'b00000;
	end
	else if(up == 1'b0 && down == 1'b1)
	begin
		down_counter <= down_counter + 1;
	end
	else
	begin
		down_counter <= down_counter;
	end
end

endmodule
