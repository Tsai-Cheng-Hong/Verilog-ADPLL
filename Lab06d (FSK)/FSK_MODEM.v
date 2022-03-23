//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Exercise: Design a FSK Modem                        //
//------------------------------------------------------//
`timescale 1ns/1ps
`include "dco_model.v"

module FSK_MODEM(RESET, TX_CLK, TX_DATA, FSK_OUT);

  input  RESET, TX_CLK, TX_DATA;
  output FSK_OUT;
  reg [127:0] control;
  wire R_RESET;
  wire [127:0] W_control;

  assign R_RESET = ~RESET;
  assign W_control = control;
//DCO
  dco_model K1(.reset_(R_RESET)
, .coarse_0(W_control[0]), .coarse_1(W_control[1]), .coarse_2(W_control[2]), .coarse_3(W_control[3]), .coarse_4(W_control[4]), .coarse_5(W_control[5]), .coarse_6(W_control[6]), .coarse_7(W_control[7]), .coarse_8(W_control[8]), .coarse_9(W_control[9]), .coarse_10(W_control[10]), .coarse_11(W_control[11]), .coarse_12(W_control[12]), .coarse_13(W_control[13]), .coarse_14(W_control[14]), .coarse_15(W_control[15]), .coarse_16(W_control[16]), .coarse_17(W_control[17]), .coarse_18(W_control[18]), .coarse_19(W_control[19]), .coarse_20(W_control[20]), .coarse_21(W_control[21]), .coarse_22(W_control[22]), .coarse_23(W_control[23]), .coarse_24(W_control[24]), .coarse_25(W_control[25]), .coarse_26(W_control[26]), .coarse_27(W_control[27]), .coarse_28(W_control[28]), .coarse_29(W_control[29]), .coarse_30(W_control[30]), .coarse_31(W_control[31]), .coarse_32(W_control[32]), .coarse_33(W_control[33]), .coarse_34(W_control[34]), .coarse_35(W_control[35]), .coarse_36(W_control[36]), .coarse_37(W_control[37]), .coarse_38(W_control[38]), .coarse_39(W_control[39]), .coarse_40(W_control[40]), .coarse_41(W_control[41]), .coarse_42(W_control[42]), .coarse_43(W_control[43]), .coarse_44(W_control[44]), .coarse_45(W_control[45]), .coarse_46(W_control[46]), .coarse_47(W_control[47]), .coarse_48(W_control[48]), .coarse_49(W_control[49]), .coarse_50(W_control[50]), .coarse_51(W_control[51]), .coarse_52(W_control[52]), .coarse_53(W_control[53]), .coarse_54(W_control[54]), .coarse_55(W_control[55]), .coarse_56(W_control[56]), .coarse_57(W_control[57]), .coarse_58(W_control[58]), .coarse_59(W_control[59]), .coarse_60(W_control[60]), .coarse_61(W_control[61]), .coarse_62(W_control[62]), .coarse_63(W_control[63]), .coarse_64(W_control[64]), .coarse_65(W_control[65]), .coarse_66(W_control[66]), .coarse_67(W_control[67]), .coarse_68(W_control[68]), .coarse_69(W_control[69]), .coarse_70(W_control[70]), .coarse_71(W_control[71]), .coarse_72(W_control[72]), .coarse_73(W_control[73]), .coarse_74(W_control[74]), .coarse_75(W_control[75]), .coarse_76(W_control[76]), .coarse_77(W_control[77]), .coarse_78(W_control[78]), .coarse_79(W_control[79]), .coarse_80(W_control[80]), .coarse_81(W_control[81]), .coarse_82(W_control[82]), .coarse_83(W_control[83]), .coarse_84(W_control[84]), .coarse_85(W_control[85]), .coarse_86(W_control[86]), .coarse_87(W_control[87]), .coarse_88(W_control[88]), .coarse_89(W_control[89]), .coarse_90(W_control[90]), .coarse_91(W_control[91]), .coarse_92(W_control[92]), .coarse_93(W_control[93]), .coarse_94(W_control[94]), .coarse_95(W_control[95]), .coarse_96(W_control[96]), .coarse_97(W_control[97]), .coarse_98(W_control[98]), .coarse_99(W_control[99]), .coarse_100(W_control[100]), .coarse_101(W_control[101]), .coarse_102(W_control[102]), .coarse_103(W_control[103]), .coarse_104(W_control[104]), .coarse_105(W_control[105]), .coarse_106(W_control[106]), .coarse_107(W_control[107]), .coarse_108(W_control[108]), .coarse_109(W_control[109]), .coarse_110(W_control[110]), .coarse_111(W_control[111]), .coarse_112(W_control[112]), .coarse_113(W_control[113]), .coarse_114(W_control[114]), .coarse_115(W_control[115]), .coarse_116(W_control[116]), .coarse_117(W_control[117]), .coarse_118(W_control[118]), .coarse_119(W_control[119]), .coarse_120(W_control[120]), .coarse_121(W_control[121]), .coarse_122(W_control[122]), .coarse_123(W_control[123]), .coarse_124(W_control[124]), .coarse_125(W_control[125]), .coarse_126(W_control[126]), .coarse_127(W_control[127])
, .dco_out(FSK_OUT));
//FSK Control

  always@(posedge TX_CLK)
  begin
	if(RESET)
		control <= 128'h00000000000000000000000000000001;
	else if(TX_DATA)
		control <= 128'hffffffffffffffffffffffffffffffff;
	else
		control <= TX_DATA;
  end
endmodule
