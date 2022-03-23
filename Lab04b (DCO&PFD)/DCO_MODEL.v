//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Demo1: DCO              //
//------------------------------------------------------//

//Include Sub modules

`timescale 1ns/1ps
module DCO_MODEL(reset_,coarse,dco_out);

parameter dco_t0=0.634;
parameter dco_step=0.324;

input reset_;
input [127:0]coarse;
output dco_out;

reg dco_out;
real period;

initial period = dco_t0;
initial dco_out = 1'b0;

 
always@(coarse)
begin
	case(coarse)
	128'h00000000000000000000000000000001: period=3.42;
	128'h00000000000000000000000000000003: period=3.42;
	128'h00000000000000000000000000000007: period=3.42;
	128'h0000000000000000000000000000000f: period=3.13;
	128'h0000000000000000000000000000001f: period=2.85;
	128'h0000000000000000000000000000003f: period=2.61;
	128'h0000000000000000000000000000007f: period=2.52;
	128'h000000000000000000000000000000ff: period=2.41;
	128'h000000000000000000000000000001ff: period=2.32;
	128'h000000000000000000000000000003ff: period=2.26;
	128'h000000000000000000000000000007ff: period=2.21;
	128'h00000000000000000000000000000fff: period=2.16;
	128'h00000000000000000000000000001fff: period=2.13;
	128'h00000000000000000000000000003fff: period=2.1;
	128'h00000000000000000000000000007fff: period=2.07;
	128'h0000000000000000000000000000ffff: period=2.04;
	128'h0000000000000000000000000001ffff: period=2.01;
	128'h0000000000000000000000000003ffff: period=1.99;
	128'h0000000000000000000000000007ffff: period=1.97;
	128'h000000000000000000000000000fffff: period=1.95;
	128'h000000000000000000000000001fffff: period=1.94;
	128'h000000000000000000000000003fffff: period=1.92;
	128'h000000000000000000000000007fffff: period=1.9;
	128'h00000000000000000000000000ffffff: period=1.89;
	128'h00000000000000000000000001ffffff: period=1.89;
	128'h00000000000000000000000003ffffff: period=1.87;
	128'h00000000000000000000000007ffffff: period=1.86;
	128'h0000000000000000000000000fffffff: period=1.85;
	128'h0000000000000000000000001fffffff: period=1.84;
	128'h0000000000000000000000003fffffff: period=1.83;
	128'h0000000000000000000000007fffffff: period=1.82;
	128'h000000000000000000000000ffffffff: period=1.81;
	128'h000000000000000000000001ffffffff: period=1.81;
	128'h000000000000000000000003ffffffff: period=1.8;
	128'h000000000000000000000007ffffffff: period=1.79;
	128'h00000000000000000000000fffffffff: period=1.78;
	128'h00000000000000000000001fffffffff: period=1.77;
	128'h00000000000000000000003fffffffff: period=1.77;
	128'h00000000000000000000007fffffffff: period=1.76;
	128'h0000000000000000000000ffffffffff: period=1.76;
	128'h0000000000000000000001ffffffffff: period=1.75;
	128'h0000000000000000000003ffffffffff: period=1.75;
	128'h0000000000000000000007ffffffffff: period=1.74;
	128'h000000000000000000000fffffffffff: period=1.74;
	128'h000000000000000000001fffffffffff: period=1.73;
	128'h000000000000000000003fffffffffff: period=1.72;
	128'h000000000000000000007fffffffffff: period=1.72;
	128'h00000000000000000000ffffffffffff: period=1.72;
	128'h00000000000000000001ffffffffffff: period=1.71;
	128'h00000000000000000003ffffffffffff: period=1.71;
	128'h00000000000000000007ffffffffffff: period=1.71;
	128'h0000000000000000000fffffffffffff: period=1.7;
	128'h0000000000000000001fffffffffffff: period=1.7;
	128'h0000000000000000003fffffffffffff: period=1.69;
	128'h0000000000000000007fffffffffffff: period=1.69;
	128'h000000000000000000ffffffffffffff: period=1.69;
	128'h000000000000000001ffffffffffffff: period=1.69;
	128'h000000000000000003ffffffffffffff: period=1.69;
	128'h000000000000000007ffffffffffffff: period=1.68;
	128'h00000000000000000fffffffffffffff: period=1.68;
	128'h00000000000000001fffffffffffffff: period=1.68;
	128'h00000000000000003fffffffffffffff: period=1.67;
	128'h00000000000000007fffffffffffffff: period=1.67;
	128'h0000000000000000ffffffffffffffff: period=1.66;
	128'h0000000000000001ffffffffffffffff: period=1.66;
	128'h0000000000000003ffffffffffffffff: period=1.66;
	128'h0000000000000007ffffffffffffffff: period=1.65;
	128'h000000000000000fffffffffffffffff: period=1.65;
	128'h000000000000001fffffffffffffffff: period=1.65;
	128'h000000000000003fffffffffffffffff: period=1.64;
	128'h000000000000007fffffffffffffffff: period=1.64;
	128'h00000000000000ffffffffffffffffff: period=1.64;
	128'h00000000000001ffffffffffffffffff: period=1.63;
	128'h00000000000003ffffffffffffffffff: period=1.63;
	128'h00000000000007ffffffffffffffffff: period=1.63;
	128'h0000000000000fffffffffffffffffff: period=1.63;
	128'h0000000000001fffffffffffffffffff: period=1.63;
	128'h0000000000003fffffffffffffffffff: period=1.63;
	128'h0000000000007fffffffffffffffffff: period=1.62;
	128'h000000000000ffffffffffffffffffff: period=1.61;
	128'h000000000001ffffffffffffffffffff: period=1.62;
	128'h000000000003ffffffffffffffffffff: period=1.62;
	128'h000000000007ffffffffffffffffffff: period=1.62;
	128'h00000000000fffffffffffffffffffff: period=1.62;
	128'h00000000001fffffffffffffffffffff: period=1.62;
	128'h00000000003fffffffffffffffffffff: period=1.6;
	128'h00000000007fffffffffffffffffffff: period=1.61;
	128'h0000000000ffffffffffffffffffffff: period=1.6;
	128'h0000000001ffffffffffffffffffffff: period=1.61;
	128'h0000000003ffffffffffffffffffffff: period=1.61;
	128'h0000000007ffffffffffffffffffffff: period=1.61;
	128'h000000000fffffffffffffffffffffff: period=1.6;
	128'h000000001fffffffffffffffffffffff: period=1.61;
	128'h000000003fffffffffffffffffffffff: period=1.61;
	128'h000000007fffffffffffffffffffffff: period=1.6;
	128'h00000000ffffffffffffffffffffffff: period=1.6;
	128'h00000001ffffffffffffffffffffffff: period=1.59;
	128'h00000003ffffffffffffffffffffffff: period=1.59;
	128'h00000007ffffffffffffffffffffffff: period=1.59;
	128'h0000000fffffffffffffffffffffffff: period=1.6;
	128'h0000001fffffffffffffffffffffffff: period=1.6;
	128'h0000003fffffffffffffffffffffffff: period=1.59;
	128'h0000007fffffffffffffffffffffffff: period=1.58;
	128'h000000ffffffffffffffffffffffffff: period=1.59;
	128'h000001ffffffffffffffffffffffffff: period=1.59;
	128'h000003ffffffffffffffffffffffffff: period=1.58;
	128'h000007ffffffffffffffffffffffffff: period=1.57;
	128'h00000fffffffffffffffffffffffffff: period=1.58;
	128'h00001fffffffffffffffffffffffffff: period=1.57;
	128'h00003fffffffffffffffffffffffffff: period=1.58;
	128'h00007fffffffffffffffffffffffffff: period=1.57;
	128'h0000ffffffffffffffffffffffffffff: period=1.58;
	128'h0001ffffffffffffffffffffffffffff: period=1.58;
	128'h0003ffffffffffffffffffffffffffff: period=1.58;
	128'h0007ffffffffffffffffffffffffffff: period=1.57;
	128'h000fffffffffffffffffffffffffffff: period=1.57;
	128'h001fffffffffffffffffffffffffffff: period=1.57;
	128'h003fffffffffffffffffffffffffffff: period=1.57;
	128'h007fffffffffffffffffffffffffffff: period=1.58;
	128'h00ffffffffffffffffffffffffffffff: period=1.58;
	128'h01ffffffffffffffffffffffffffffff: period=1.56;
	128'h03ffffffffffffffffffffffffffffff: period=1.57;
	128'h07ffffffffffffffffffffffffffffff: period=1.57;
	128'h0fffffffffffffffffffffffffffffff: period=1.57;
	128'h1fffffffffffffffffffffffffffffff: period=1.55;
	128'h3fffffffffffffffffffffffffffffff: period=1.56;
	128'h7fffffffffffffffffffffffffffffff: period=1.56;
	128'hffffffffffffffffffffffffffffffff: period=1.55;
	endcase
end

always@(posedge reset_)
begin:dco_run
 forever begin:dco_set
  dco_out= ~dco_out;
  #(period/2.0);
  end
end

always@(negedge reset_)
begin
	dco_out=0;
	disable dco_run;
end

endmodule



