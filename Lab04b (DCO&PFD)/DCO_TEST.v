//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Demo1: DCO              //
//------------------------------------------------------//

//Include Sub modules
`include "DCO_MODEL.v"

`timescale 1ns/1ps
module TEST;

reg Reset_;
reg [127:0]COARSE;

reg [3:0]counter;

DCO_MODEL dco(.reset_(Reset_),.coarse(COARSE),.dco_out(DCO_OUT));

always@(negedge DCO_OUT or negedge Reset_)
begin
	if(!Reset_) 
	begin
	counter <= 4'd0;
	COARSE <= 4'd0;
	end

	else if (counter == 4'd10) 
	begin
	COARSE <= COARSE*2+1'b1;
	counter <=4'd0;
	end

	else if (COARSE[127] == 1'b1)
	begin
	#500 $finish;
	end

	else
	begin
	counter <= counter + 1'b1;
	end
end

initial 
begin
$fsdbDumpfile("DCO_TEST.fsdb");
$fsdbDumpvars;

Reset_=1'b0;
COARSE =4'd0;
#15 Reset_=1'b1;
end

endmodule
