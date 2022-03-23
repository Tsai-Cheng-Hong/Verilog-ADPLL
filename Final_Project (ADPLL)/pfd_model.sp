*******************************************************
* Advanced Digital IC Design                          *
*                                                     *
* Exercise: Phase/Frequency Detector                  *
*******************************************************


.INCLUDE "ultrasim_cells.sp"
***********************************
* Operation Condition             *
***********************************
*** Process: Typical ***
.lib "ultrasim_model.122" L18U18V_TT

*** Voltage: 1.8V ***
.PARAM supply=1.8v

*** Temperature: 25C ***

***********************************
* Transition Analysis             *
***********************************

***********************************
* UltraSIM Simulation Options     *
***********************************

***********************************
* UltraSIM Output Options         *
***********************************

***********************************
* Output Analog Signals           *
***********************************


***********************************
* Measurement Commands            *
***********************************


***********************************
* Define Global Nets              *
***********************************
.GLOBAL VDD VSS

***********************************
* Transition Analysis             *
***********************************

vdd     VDD   0  DC supply
vss     VSS   0  DC 0


.SUBCKT pfd_model RESET_B  IN_clk  FB_clk  flagU  flagD


***********************************
* TOP Circuit                     *
***********************************

XDFF1	IN_clk	VDD	Line2	RQU	QU	DFFRX4
XDFF2	FB_clk	VDD	Line2	RQD	QD	DFFRX4
XNAND1	QU	QD	Line1	NAND2X1
XNAND2	Line1	RESET_B	Line2	AND2X1

XINV1	RQU	RRQU	BUFX1
XINV2	RQD	RRQD	BUFX1

XNAND3	QU	RRQD	OUTU	NAND2X1	M=10
XNAND4	QD	RRQU	OUTD	NAND2X1	M=10


DPA3	OUTU	OUTBU	DPA
DPA4	OUTD	OUTBD	DPA

XDFF3	IN_clk	VDD	OUTBU	RflagU	flagU	DFFRX4
XDFF4	FB_clk	VDD	OUTBD	RflagD	flagD	DFFRX4

.ENDS
***********************************
* Subckt Definition               *
***********************************
.SUBCKT DPA IN OUT
X0	IN	IN0	BUFX3

X1	IN	IN0	IN1	AND2X1
X2	IN0	IN1	IN2	AND2X1
X3	IN1	IN2	IN3	AND2X1
X4	IN2	IN3	IN4	AND2X1
X5	IN3	IN4	IN5	AND2X1
X6	IN4	IN5	OUT	AND2X1

.ENDS




.END
