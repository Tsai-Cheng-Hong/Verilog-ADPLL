//------------------------------------------------------//
//- Advanced Digital IC Design                          //
//-                                                     //
//- Demo2: DCO Modeling                                 //
//------------------------------------------------------//

`timescale 1ns/1ps
module dco_model(reset_
, coarse_0, coarse_1, coarse_2, coarse_3, coarse_4, coarse_5, coarse_6, coarse_7, coarse_8, coarse_9
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
, coarse_120, coarse_121, coarse_122, coarse_123, coarse_124, coarse_125, coarse_126, coarse_127
, dco_out);

  parameter   dco_t0=0.634;    //DCO Min. Delay is 0.634ns
  parameter   dco_step=0.324;  //DCO Resolution is 0.324ns

  input       reset_;  //reset_=0, DCO is reset, reset_=1, DCO works
  input		coarse_0, coarse_1, coarse_2, coarse_3, coarse_4, coarse_5, coarse_6, coarse_7, coarse_8, coarse_9
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
 output       dco_out; //DCO output clock

    reg dco_out;
   real period;

  wire [127:0] coarse;

   initial period=dco_t0;
   initial dco_out=1'b0;


//Modeling code vs. DCO output period 

assign coarse = {coarse_0, coarse_1, coarse_2, coarse_3, coarse_4, coarse_5, coarse_6, coarse_7, coarse_8, coarse_9
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
, coarse_120, coarse_121, coarse_122, coarse_123, coarse_124, coarse_125, coarse_126, coarse_127};


always@(coarse) 
  begin
    //period <= dco_t0 + dco_step * coarse;
	case(coarse)
	128'h00000000000000000000000000000001:	period = 3.42;
	128'h00000000000000000000000000000003:	period = 3.42;
	128'h00000000000000000000000000000007:	period = 3.42;
	128'h0000000000000000000000000000000f:	period = 3.13;
	128'h0000000000000000000000000000001f:	period = 2.85;
	128'h0000000000000000000000000000003f:	period = 2.61;
	128'h0000000000000000000000000000007f:	period = 2.52;
	128'h000000000000000000000000000000ff:	period = 2.41;
	128'h000000000000000000000000000001ff:	period = 2.32;
	128'h000000000000000000000000000003ff:	period = 2.26;
	128'h000000000000000000000000000007ff:	period = 2.21;
	128'h00000000000000000000000000000fff:	period = 2.16;
	128'h00000000000000000000000000001fff:	period = 2.13;
	128'h00000000000000000000000000003fff:	period = 2.1;
	128'h00000000000000000000000000007fff:	period = 2.07;
	128'h0000000000000000000000000000ffff:	period = 2.04;
	128'h0000000000000000000000000001ffff:	period = 2.01;
	128'h0000000000000000000000000003ffff:	period = 1.99;
	128'h0000000000000000000000000007ffff:	period = 1.97;
	128'h000000000000000000000000000fffff:	period = 1.95;
	128'h000000000000000000000000001fffff:	period = 1.94;
	128'h000000000000000000000000003fffff:	period = 1.92;
	128'h000000000000000000000000007fffff:	period = 1.9;
	128'h00000000000000000000000000ffffff:	period = 1.89;
	128'h00000000000000000000000001ffffff:	period = 1.89;
	128'h00000000000000000000000003ffffff:	period = 1.87;
	128'h00000000000000000000000007ffffff:	period = 1.86;
	128'h0000000000000000000000000fffffff:	period = 1.85;
	128'h0000000000000000000000001fffffff:	period = 1.84;
	128'h0000000000000000000000003fffffff:	period = 1.83;
	128'h0000000000000000000000007fffffff:	period = 1.82;
	128'h000000000000000000000000ffffffff:	period = 1.81;
	128'h000000000000000000000001ffffffff:	period = 1.81;
	128'h000000000000000000000003ffffffff:	period = 1.8;
	128'h000000000000000000000007ffffffff:	period = 1.79;
	128'h00000000000000000000000fffffffff:	period = 1.78;
	128'h00000000000000000000001fffffffff:	period = 1.77;
	128'h00000000000000000000003fffffffff:	period = 1.77;
	128'h00000000000000000000007fffffffff:	period = 1.76;
	128'h0000000000000000000000ffffffffff:	period = 1.76;
	128'h0000000000000000000001ffffffffff:	period = 1.75;
	128'h0000000000000000000003ffffffffff:	period = 1.75;
	128'h0000000000000000000007ffffffffff:	period = 1.74;
	128'h000000000000000000000fffffffffff:	period = 1.74;
	128'h000000000000000000001fffffffffff:	period = 1.73;
	128'h000000000000000000003fffffffffff:	period = 1.72;
	128'h000000000000000000007fffffffffff:	period = 1.72;
	128'h00000000000000000000ffffffffffff:	period = 1.72;
	128'h00000000000000000001ffffffffffff:	period = 1.71;
	128'h00000000000000000003ffffffffffff:	period = 1.71;
	128'h00000000000000000007ffffffffffff:	period = 1.71;
	128'h0000000000000000000fffffffffffff:	period = 1.7;
	128'h0000000000000000001fffffffffffff:	period = 1.7;
	128'h0000000000000000003fffffffffffff:	period = 1.69;
	128'h0000000000000000007fffffffffffff:	period = 1.69;
	128'h000000000000000000ffffffffffffff:	period = 1.69;
	128'h000000000000000001ffffffffffffff:	period = 1.69;
	128'h000000000000000003ffffffffffffff:	period = 1.69;
	128'h000000000000000007ffffffffffffff:	period = 1.68;
	128'h00000000000000000fffffffffffffff:	period = 1.68;
	128'h00000000000000001fffffffffffffff:	period = 1.68;
	128'h00000000000000003fffffffffffffff:	period = 1.67;
	128'h00000000000000007fffffffffffffff:	period = 1.67;
	128'h0000000000000000ffffffffffffffff:	period = 1.66;
	128'h0000000000000001ffffffffffffffff:	period = 1.66;
	128'h0000000000000003ffffffffffffffff:	period = 1.66;
	128'h0000000000000007ffffffffffffffff:	period = 1.65;
	128'h000000000000000fffffffffffffffff:	period = 1.65;
	128'h000000000000001fffffffffffffffff:	period = 1.65;
	128'h000000000000003fffffffffffffffff:	period = 1.64;
	128'h000000000000007fffffffffffffffff:	period = 1.64;
	128'h00000000000000ffffffffffffffffff:	period = 1.64;
	128'h00000000000001ffffffffffffffffff:	period = 1.63;
	128'h00000000000003ffffffffffffffffff:	period = 1.63;
	128'h00000000000007ffffffffffffffffff:	period = 1.63;
	128'h0000000000000fffffffffffffffffff:	period = 1.63;
	128'h0000000000001fffffffffffffffffff:	period = 1.63;
	128'h0000000000003fffffffffffffffffff:	period = 1.62;
	128'h0000000000007fffffffffffffffffff:	period = 1.61;
	128'h000000000000ffffffffffffffffffff:	period = 1.62;
	128'h000000000001ffffffffffffffffffff:	period = 1.62;
	128'h000000000003ffffffffffffffffffff:	period = 1.62;
	128'h000000000007ffffffffffffffffffff:	period = 1.62;
	128'h00000000000fffffffffffffffffffff:	period = 1.62;
	128'h00000000001fffffffffffffffffffff:	period = 1.62;
	128'h00000000003fffffffffffffffffffff:	period = 1.6;
	128'h00000000007fffffffffffffffffffff:	period = 1.61;
	128'h0000000000ffffffffffffffffffffff:	period = 1.6;
	128'h0000000001ffffffffffffffffffffff:	period = 1.61;
	128'h0000000003ffffffffffffffffffffff:	period = 1.61;
	128'h0000000007ffffffffffffffffffffff:	period = 1.61;
	128'h000000000fffffffffffffffffffffff:	period = 1.6;
	128'h000000001fffffffffffffffffffffff:	period = 1.61;
	128'h000000003fffffffffffffffffffffff:	period = 1.61;
	128'h000000007fffffffffffffffffffffff:	period = 1.6;
	128'h00000000ffffffffffffffffffffffff:	period = 1.6;
	128'h00000001ffffffffffffffffffffffff:	period = 1.59;
	128'h00000003ffffffffffffffffffffffff:	period = 1.59;
	128'h00000007ffffffffffffffffffffffff:	period = 1.59;
	128'h0000000fffffffffffffffffffffffff:	period = 1.6;
	128'h0000001fffffffffffffffffffffffff:	period = 1.6;
	128'h0000003fffffffffffffffffffffffff:	period = 1.59;
	128'h0000007fffffffffffffffffffffffff:	period = 1.58;
	128'h000000ffffffffffffffffffffffffff:	period = 1.59;
	128'h000001ffffffffffffffffffffffffff:	period = 1.59;
	128'h000003ffffffffffffffffffffffffff:	period = 1.58;
	128'h000007ffffffffffffffffffffffffff:	period = 1.57;
	128'h00000fffffffffffffffffffffffffff:	period = 1.58;
	128'h00001fffffffffffffffffffffffffff:	period = 1.57;
	128'h00003fffffffffffffffffffffffffff:	period = 1.58;
	128'h00007fffffffffffffffffffffffffff:	period = 1.57;
	128'h0000ffffffffffffffffffffffffffff:	period = 1.58;
	128'h0001ffffffffffffffffffffffffffff:	period = 1.58;
	128'h0003ffffffffffffffffffffffffffff:	period = 1.58;
	128'h0007ffffffffffffffffffffffffffff:	period = 1.57;
	128'h000fffffffffffffffffffffffffffff:	period = 1.57;
	128'h001fffffffffffffffffffffffffffff:	period = 1.57;
	128'h003fffffffffffffffffffffffffffff:	period = 1.57;
	128'h007fffffffffffffffffffffffffffff:	period = 1.58;
	128'h00ffffffffffffffffffffffffffffff:	period = 1.58;
	128'h01ffffffffffffffffffffffffffffff:	period = 1.56;
	128'h03ffffffffffffffffffffffffffffff:	period = 1.57;
	128'h07ffffffffffffffffffffffffffffff:	period = 1.57;
	128'h0fffffffffffffffffffffffffffffff:	period = 1.57;
	128'h1fffffffffffffffffffffffffffffff:	period = 1.55;
	128'h3fffffffffffffffffffffffffffffff:	period = 1.56;
	128'h7fffffffffffffffffffffffffffffff:	period = 1.56;
	128'hffffffffffffffffffffffffffffffff:	period = 1.55;
	endcase
  end

always@(posedge reset_) //DCO Work
  begin : dco_run
    forever begin : dco_set
      dco_out = ~dco_out;
      #(period/2.0);
    end
  end
      
always@(negedge reset_) //DCO STOP
  begin
    dco_out = 0;
    disable dco_run; //turn off DCO when reset_=0;
  end

endmodule
