
`timescale 1ns/1ps
`include "dco_model.v"
module dco_encode(reset, dco_code, dco_out);

input		reset;
input [7:0]	dco_code;
output		dco_out;
  wire		coarse_0, coarse_1, coarse_2, coarse_3, coarse_4, coarse_5, coarse_6, coarse_7, coarse_8, coarse_9
, coarse_10, coarse_11, coarse_12, coarse_13, coarse_14, coarse_15, coarse_16, coarse_17, coarse_18, coarse_19
, coarse_20, coarse_21, coarse_22, coarse_23, coarse_24, coarse_25, coarse_26, coarse_27, coarse_28, coarse_29
, coarse_30, coarse_31, coarse_32, coarse_33, coarse_34, coarse_35, coarse_36, coarse_37, coarse_38, coarse_39
, coarse_40, coarse_41, coarse_42, coarse_43, coarse_44, coarse_45, coarse_46, coarse_47, coarse_48, coarse_49
, coarse_50, coarse_51, coarse_52, coarse_53, coarse_54, coarse_55, coarse_56, coarse_57, coarse_58, coarse_59
, coarse_60, coarse_61, coarse_62, coarse_63, coarse_64, coarse_65, coarse_66, coarse_67, coarse_68, coarse_69
, coarse_70, coarse_71, coarse_72, coarse_73, coarse_74, coarse_75, coarse_76, coarse_77, coarse_78, coarse_79
, coarse_80, coarse_81, coarse_82, coarse_83, coarse_84, coarse_85, coarse_86, coarse_87, coarse_88, coarse_89
, coarse_90, coarse_91, coarse_92, coarse_93, coarse_94, coarse_95, coarse_96, coarse_97, coarse_98, coarse_99
, coarse_100, coarse_101, coarse_102, coarse_103, coarse_104, coarse_105, coarse_106, coarse_107, coarse_108, coarse_109
, coarse_110, coarse_111, coarse_112, coarse_113, coarse_114, coarse_115, coarse_116, coarse_117, coarse_118, coarse_119
, coarse_120, coarse_121, coarse_122, coarse_123, coarse_124, coarse_125, coarse_126, coarse_127;

wire	R_RESET;
assign	R_RESET = reset;

wire  [127:0]	coarse;
assign coarse = (128'd1 << dco_code) - 1'b1;


assign {coarse_0, coarse_1, coarse_2, coarse_3, coarse_4, coarse_5, coarse_6, coarse_7, coarse_8, coarse_9
, coarse_10, coarse_11, coarse_12, coarse_13, coarse_14, coarse_15, coarse_16, coarse_17, coarse_18, coarse_19
, coarse_20, coarse_21, coarse_22, coarse_23, coarse_24, coarse_25, coarse_26, coarse_27, coarse_28, coarse_29
, coarse_30, coarse_31, coarse_32, coarse_33, coarse_34, coarse_35, coarse_36, coarse_37, coarse_38, coarse_39
, coarse_40, coarse_41, coarse_42, coarse_43, coarse_44, coarse_45, coarse_46, coarse_47, coarse_48, coarse_49
, coarse_50, coarse_51, coarse_52, coarse_53, coarse_54, coarse_55, coarse_56, coarse_57, coarse_58, coarse_59
, coarse_60, coarse_61, coarse_62, coarse_63, coarse_64, coarse_65, coarse_66, coarse_67, coarse_68, coarse_69
, coarse_70, coarse_71, coarse_72, coarse_73, coarse_74, coarse_75, coarse_76, coarse_77, coarse_78, coarse_79
, coarse_80, coarse_81, coarse_82, coarse_83, coarse_84, coarse_85, coarse_86, coarse_87, coarse_88, coarse_89
, coarse_90, coarse_91, coarse_92, coarse_93, coarse_94, coarse_95, coarse_96, coarse_97, coarse_98, coarse_99
, coarse_100, coarse_101, coarse_102, coarse_103, coarse_104, coarse_105, coarse_106, coarse_107, coarse_108, coarse_109
, coarse_110, coarse_111, coarse_112, coarse_113, coarse_114, coarse_115, coarse_116, coarse_117, coarse_118, coarse_119
, coarse_120, coarse_121, coarse_122, coarse_123, coarse_124, coarse_125, coarse_126, coarse_127} = coarse;


dco_model K1(.reset_(R_RESET)
, .coarse_0(coarse_0), .coarse_1(coarse_1), .coarse_2(coarse_2), .coarse_3(coarse_3), .coarse_4(coarse_4), .coarse_5(coarse_5), .coarse_6(coarse_6), .coarse_7(coarse_7), .coarse_8(coarse_8), .coarse_9(coarse_9), .coarse_10(coarse_10), .coarse_11(coarse_11), .coarse_12(coarse_12), .coarse_13(coarse_13), .coarse_14(coarse_14), .coarse_15(coarse_15), .coarse_16(coarse_16), .coarse_17(coarse_17), .coarse_18(coarse_18), .coarse_19(coarse_19), .coarse_20(coarse_20), .coarse_21(coarse_21), .coarse_22(coarse_22), .coarse_23(coarse_23), .coarse_24(coarse_24), .coarse_25(coarse_25), .coarse_26(coarse_26), .coarse_27(coarse_27), .coarse_28(coarse_28), .coarse_29(coarse_29), .coarse_30(coarse_30), .coarse_31(coarse_31), .coarse_32(coarse_32), .coarse_33(coarse_33), .coarse_34(coarse_34), .coarse_35(coarse_35), .coarse_36(coarse_36), .coarse_37(coarse_37), .coarse_38(coarse_38), .coarse_39(coarse_39), .coarse_40(coarse_40), .coarse_41(coarse_41), .coarse_42(coarse_42), .coarse_43(coarse_43), .coarse_44(coarse_44), .coarse_45(coarse_45), .coarse_46(coarse_46), .coarse_47(coarse_47), .coarse_48(coarse_48), .coarse_49(coarse_49), .coarse_50(coarse_50), .coarse_51(coarse_51), .coarse_52(coarse_52), .coarse_53(coarse_53), .coarse_54(coarse_54), .coarse_55(coarse_55), .coarse_56(coarse_56), .coarse_57(coarse_57), .coarse_58(coarse_58), .coarse_59(coarse_59), .coarse_60(coarse_60), .coarse_61(coarse_61), .coarse_62(coarse_62), .coarse_63(coarse_63), .coarse_64(coarse_64), .coarse_65(coarse_65), .coarse_66(coarse_66), .coarse_67(coarse_67), .coarse_68(coarse_68), .coarse_69(coarse_69), .coarse_70(coarse_70), .coarse_71(coarse_71), .coarse_72(coarse_72), .coarse_73(coarse_73), .coarse_74(coarse_74), .coarse_75(coarse_75), .coarse_76(coarse_76), .coarse_77(coarse_77), .coarse_78(coarse_78), .coarse_79(coarse_79), .coarse_80(coarse_80), .coarse_81(coarse_81), .coarse_82(coarse_82), .coarse_83(coarse_83), .coarse_84(coarse_84), .coarse_85(coarse_85), .coarse_86(coarse_86), .coarse_87(coarse_87), .coarse_88(coarse_88), .coarse_89(coarse_89), .coarse_90(coarse_90), .coarse_91(coarse_91), .coarse_92(coarse_92), .coarse_93(coarse_93), .coarse_94(coarse_94), .coarse_95(coarse_95), .coarse_96(coarse_96), .coarse_97(coarse_97), .coarse_98(coarse_98), .coarse_99(coarse_99), .coarse_100(coarse_100), .coarse_101(coarse_101), .coarse_102(coarse_102), .coarse_103(coarse_103), .coarse_104(coarse_104), .coarse_105(coarse_105), .coarse_106(coarse_106), .coarse_107(coarse_107), .coarse_108(coarse_108), .coarse_109(coarse_109), .coarse_110(coarse_110), .coarse_111(coarse_111), .coarse_112(coarse_112), .coarse_113(coarse_113), .coarse_114(coarse_114), .coarse_115(coarse_115), .coarse_116(coarse_116), .coarse_117(coarse_117), .coarse_118(coarse_118), .coarse_119(coarse_119), .coarse_120(coarse_120), .coarse_121(coarse_121), .coarse_122(coarse_122), .coarse_123(coarse_123), .coarse_124(coarse_124), .coarse_125(coarse_125), .coarse_126(coarse_126), .coarse_127(coarse_127)
, .dco_out(dco_out));

endmodule
