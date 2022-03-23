//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: Frequency Divider                         //
//------------------------------------------------------//

`timescale 1ns/1ps
module FREQ_DIV(R_reset, clk, M, Out_divM);

input         R_reset;
input	      clk;
input	[2:0] M;
output	Out_divM;
reg	Out_divM_reg;


reg	[2:0] counter;
wire	reset;

//Write Your Programmable Counter-based Frequency Divider Here

assign	reset = ~R_reset;

assign Out_divM = (M <= 3'b001) ? clk : Out_divM_reg;

always@(posedge clk or posedge reset)
begin
	if(reset)
	begin
		counter <= 3'b000;
	end
	else if(counter == 3'b000)
	begin
		counter <= M - 1;
	end
	else
	begin
		counter <= counter - 1;
	end
end


always@(posedge clk or posedge reset)
begin
	if(reset)
	begin
		Out_divM_reg <= 1'b0;
	end
	else if(counter <= ((M >> 1)-1))
	begin
		Out_divM_reg <= 1'b1;
	end
	else
	begin
		Out_divM_reg <= 1'b0;
	end
end

endmodule
