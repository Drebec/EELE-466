-- -------------------------------------------------------------
-- 
-- File Name: C:\EE466\AJR\Lab 3\hdl_coder_Madgwick_qDot\codegen\Madgwick_qDot\hdlsrc\Madgwick_qDot_fixpt.vhd
-- Created: 2018-02-09 13:31:20
-- 
-- Generated by MATLAB 9.3, MATLAB Coder 3.4 and HDL Coder 3.11
-- 
-- 
-- 
-- -------------------------------------------------------------
-- Rate and Clocking Details
-- -------------------------------------------------------------
-- Design base rate: 1
-- 
-- 
-- Clock Enable  Sample Time
-- -------------------------------------------------------------
-- ce_out        1
-- -------------------------------------------------------------
-- 
-- 
-- Output Signal                 Clock Enable  Sample Time
-- -------------------------------------------------------------
-- qDot1                         ce_out        1
-- qDot2                         ce_out        1
-- qDot3                         ce_out        1
-- qDot4                         ce_out        1
-- -------------------------------------------------------------
-- 
-- -------------------------------------------------------------


-- -------------------------------------------------------------
-- 
-- Module: Madgwick_qDot_fixpt
-- Source Path: Madgwick_qDot_fixpt
-- Hierarchy Level: 0
-- 
-- -------------------------------------------------------------
LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY Madgwick_qDot_fixpt IS
  PORT( clk                               :   IN    std_logic;
        reset                             :   IN    std_logic;
        clk_enable                        :   IN    std_logic;
        q0                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        q1                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        q2                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        q3                                :   IN    std_logic_vector(13 DOWNTO 0);  -- ufix14_En14
        gx                                :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        gy                                :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        gz                                :   IN    std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        ce_out                            :   OUT   std_logic;
        qDot1                             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        qDot2                             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        qDot3                             :   OUT   std_logic_vector(13 DOWNTO 0);  -- sfix14_En7
        qDot4                             :   OUT   std_logic_vector(13 DOWNTO 0)  -- sfix14_En7
        );
END Madgwick_qDot_fixpt;


ARCHITECTURE rtl OF Madgwick_qDot_fixpt IS

  -- Signals
  SIGNAL enb                              : std_logic;
  SIGNAL q0_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL q1_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL q2_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL q3_unsigned                      : unsigned(13 DOWNTO 0);  -- ufix14_En14
  SIGNAL gx_signed                        : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL gy_signed                        : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL gz_signed                        : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL qDot1_1                          : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL qDot2_1                          : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL qDot3_1                          : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL qDot4_1                          : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL Madgwick_qDot_fixpt_cast         : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_cast_1       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Madgwick_qDot_fixpt_cast_2       : signed(15 DOWNTO 0);  -- sfix16_En14
  SIGNAL Madgwick_qDot_fixpt_cast_3       : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp     : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast     : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_cast_4       : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_1   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_1   : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_2   : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_sub_temp     : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_3   : signed(30 DOWNTO 0);  -- sfix31_En21
  SIGNAL Madgwick_qDot_fixpt_cast_5       : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_2   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_4   : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_5   : signed(30 DOWNTO 0);  -- sfix31_En21
  SIGNAL Madgwick_qDot_fixpt_sub_temp_1   : signed(30 DOWNTO 0);  -- sfix31_En21
  SIGNAL Madgwick_qDot_fixpt_mul_temp_3   : signed(45 DOWNTO 0);  -- sfix46_En35
  SIGNAL Madgwick_qDot_fixpt_cast_6       : signed(44 DOWNTO 0);  -- sfix45_En35
  SIGNAL Madgwick_qDot_fixpt_cast_7       : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_4   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast     : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast_1   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_cast_8       : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_5   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast_2   : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast_3   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_add_temp     : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_6   : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_cast_9       : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_6   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_7   : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_8   : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_sub_temp_2   : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_mul_temp_7   : signed(44 DOWNTO 0);  -- sfix45_En35
  SIGNAL Madgwick_qDot_fixpt_cast_10      : signed(43 DOWNTO 0);  -- sfix44_En35
  SIGNAL Madgwick_qDot_fixpt_cast_11      : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_8   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_9   : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_10  : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_cast_12      : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_9   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_11  : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_12  : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_sub_temp_3   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast_4   : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_cast_13      : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_10  : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast_5   : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast_6   : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_add_temp_1   : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_mul_temp_11  : signed(44 DOWNTO 0);  -- sfix45_En35
  SIGNAL Madgwick_qDot_fixpt_cast_14      : signed(43 DOWNTO 0);  -- sfix44_En35
  SIGNAL Madgwick_qDot_fixpt_cast_15      : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_12  : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast_7   : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast_8   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_cast_16      : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_13  : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast_9   : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_add_cast_10  : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_add_temp_2   : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_13  : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_cast_17      : signed(14 DOWNTO 0);  -- sfix15_En14
  SIGNAL Madgwick_qDot_fixpt_mul_temp_14  : signed(28 DOWNTO 0);  -- sfix29_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_14  : signed(27 DOWNTO 0);  -- sfix28_En21
  SIGNAL Madgwick_qDot_fixpt_sub_cast_15  : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_sub_temp_4   : signed(29 DOWNTO 0);  -- sfix30_En21
  SIGNAL Madgwick_qDot_fixpt_mul_temp_15  : signed(44 DOWNTO 0);  -- sfix45_En35
  SIGNAL Madgwick_qDot_fixpt_cast_18      : signed(43 DOWNTO 0);  -- sfix44_En35
  SIGNAL qDot1_tmp                        : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL qDot2_tmp                        : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL qDot3_tmp                        : signed(13 DOWNTO 0);  -- sfix14_En7
  SIGNAL qDot4_tmp                        : signed(13 DOWNTO 0);  -- sfix14_En7

BEGIN
  q0_unsigned <= unsigned(q0);

  q1_unsigned <= unsigned(q1);

  q2_unsigned <= unsigned(q2);

  q3_unsigned <= unsigned(q3);

  gx_signed <= signed(gx);

  gy_signed <= signed(gy);

  gz_signed <= signed(gz);

  --HDL code generation from MATLAB function: Madgwick_qDot_fixpt
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  --                                                                          %
  --           Generated by MATLAB 9.3 and Fixed-Point Designer 6.0           %
  --                                                                          %
  --%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  -- Rate of change of quaternion from gyroscope
  --'Madgwick_qDot_fixpt:9' fm = get_fimath();
  --'Madgwick_qDot_fixpt:11' qDot1 = fi(fi(0.5, 0, 14, 14, fm) * (fi_signed(fi_signed(fi_uminus(q1) * gx) - q2 * gy) - q3 * gz), 1, 14, 7, fm);
  --'Madgwick_qDot_fixpt:32' coder.inline( 'always' );
  --'Madgwick_qDot_fixpt:33' if isfi( a )
  --'Madgwick_qDot_fixpt:34' nt = numerictype( a );
  --'Madgwick_qDot_fixpt:35' new_nt = numerictype( 1, nt.WordLength + 1, nt.FractionLength );
  --'Madgwick_qDot_fixpt:36' y = -fi( a, new_nt, fimath( a ) );
  --'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  --'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  --'Madgwick_qDot_fixpt:25' else
  --'Madgwick_qDot_fixpt:26' y = a;
  --'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  --'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  --'Madgwick_qDot_fixpt:25' else
  --'Madgwick_qDot_fixpt:26' y = a;
  --'Madgwick_qDot_fixpt:12' qDot2 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gx + q2 * gz) - q3 * gy), 1, 14, 7, fm);
  --'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  --'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  --'Madgwick_qDot_fixpt:25' else
  --'Madgwick_qDot_fixpt:26' y = a;
  --'Madgwick_qDot_fixpt:13' qDot3 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gy) - q1 * gz + q3 * gx), 1, 14, 7, fm);
  --'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  --'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  --'Madgwick_qDot_fixpt:25' else
  --'Madgwick_qDot_fixpt:26' y = a;
  --'Madgwick_qDot_fixpt:14' qDot4 = fi(fi(0.5, 0, 14, 14, fm) * ( fi_signed(q0 * gz + q1 * gy) - q2 * gx), 1, 14, 7, fm);
  --'Madgwick_qDot_fixpt:20' coder.inline( 'always' );
  --'Madgwick_qDot_fixpt:21' if isfi( a ) && ~(issigned( a ))
  --'Madgwick_qDot_fixpt:25' else
  --'Madgwick_qDot_fixpt:26' y = a;
  Madgwick_qDot_fixpt_cast <= signed(resize(q1_unsigned, 15));
  Madgwick_qDot_fixpt_cast_1 <= resize(Madgwick_qDot_fixpt_cast, 16);
  Madgwick_qDot_fixpt_cast_2 <=  - (Madgwick_qDot_fixpt_cast_1);
  Madgwick_qDot_fixpt_cast_3 <= Madgwick_qDot_fixpt_cast_2(14 DOWNTO 0);
  Madgwick_qDot_fixpt_mul_temp <= Madgwick_qDot_fixpt_cast_3 * gx_signed;
  Madgwick_qDot_fixpt_sub_cast <= resize(Madgwick_qDot_fixpt_mul_temp, 30);
  Madgwick_qDot_fixpt_cast_4 <= signed(resize(q2_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_1 <= Madgwick_qDot_fixpt_cast_4 * gy_signed;
  Madgwick_qDot_fixpt_sub_cast_1 <= Madgwick_qDot_fixpt_mul_temp_1(27 DOWNTO 0);
  Madgwick_qDot_fixpt_sub_cast_2 <= resize(Madgwick_qDot_fixpt_sub_cast_1, 30);
  Madgwick_qDot_fixpt_sub_temp <= Madgwick_qDot_fixpt_sub_cast - Madgwick_qDot_fixpt_sub_cast_2;
  Madgwick_qDot_fixpt_sub_cast_3 <= resize(Madgwick_qDot_fixpt_sub_temp, 31);
  Madgwick_qDot_fixpt_cast_5 <= signed(resize(q3_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_2 <= Madgwick_qDot_fixpt_cast_5 * gz_signed;
  Madgwick_qDot_fixpt_sub_cast_4 <= Madgwick_qDot_fixpt_mul_temp_2(27 DOWNTO 0);
  Madgwick_qDot_fixpt_sub_cast_5 <= resize(Madgwick_qDot_fixpt_sub_cast_4, 31);
  Madgwick_qDot_fixpt_sub_temp_1 <= Madgwick_qDot_fixpt_sub_cast_3 - Madgwick_qDot_fixpt_sub_cast_5;
  -- CSD Encoding (8192) : 10000000000000; Cost (Adders) = 0
  Madgwick_qDot_fixpt_mul_temp_3 <= resize(Madgwick_qDot_fixpt_sub_temp_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 46);
  Madgwick_qDot_fixpt_cast_6 <= Madgwick_qDot_fixpt_mul_temp_3(44 DOWNTO 0);
  qDot1_1 <= Madgwick_qDot_fixpt_cast_6(41 DOWNTO 28);
  Madgwick_qDot_fixpt_cast_7 <= signed(resize(q0_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_4 <= Madgwick_qDot_fixpt_cast_7 * gx_signed;
  Madgwick_qDot_fixpt_add_cast <= Madgwick_qDot_fixpt_mul_temp_4(27 DOWNTO 0);
  Madgwick_qDot_fixpt_add_cast_1 <= resize(Madgwick_qDot_fixpt_add_cast, 29);
  Madgwick_qDot_fixpt_cast_8 <= signed(resize(q2_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_5 <= Madgwick_qDot_fixpt_cast_8 * gz_signed;
  Madgwick_qDot_fixpt_add_cast_2 <= Madgwick_qDot_fixpt_mul_temp_5(27 DOWNTO 0);
  Madgwick_qDot_fixpt_add_cast_3 <= resize(Madgwick_qDot_fixpt_add_cast_2, 29);
  Madgwick_qDot_fixpt_add_temp <= Madgwick_qDot_fixpt_add_cast_1 + Madgwick_qDot_fixpt_add_cast_3;
  Madgwick_qDot_fixpt_sub_cast_6 <= resize(Madgwick_qDot_fixpt_add_temp, 30);
  Madgwick_qDot_fixpt_cast_9 <= signed(resize(q3_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_6 <= Madgwick_qDot_fixpt_cast_9 * gy_signed;
  Madgwick_qDot_fixpt_sub_cast_7 <= Madgwick_qDot_fixpt_mul_temp_6(27 DOWNTO 0);
  Madgwick_qDot_fixpt_sub_cast_8 <= resize(Madgwick_qDot_fixpt_sub_cast_7, 30);
  Madgwick_qDot_fixpt_sub_temp_2 <= Madgwick_qDot_fixpt_sub_cast_6 - Madgwick_qDot_fixpt_sub_cast_8;
  -- CSD Encoding (8192) : 10000000000000; Cost (Adders) = 0
  Madgwick_qDot_fixpt_mul_temp_7 <= resize(Madgwick_qDot_fixpt_sub_temp_2 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 45);
  Madgwick_qDot_fixpt_cast_10 <= Madgwick_qDot_fixpt_mul_temp_7(43 DOWNTO 0);
  qDot2_1 <= Madgwick_qDot_fixpt_cast_10(41 DOWNTO 28);
  Madgwick_qDot_fixpt_cast_11 <= signed(resize(q0_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_8 <= Madgwick_qDot_fixpt_cast_11 * gy_signed;
  Madgwick_qDot_fixpt_sub_cast_9 <= Madgwick_qDot_fixpt_mul_temp_8(27 DOWNTO 0);
  Madgwick_qDot_fixpt_sub_cast_10 <= resize(Madgwick_qDot_fixpt_sub_cast_9, 29);
  Madgwick_qDot_fixpt_cast_12 <= signed(resize(q1_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_9 <= Madgwick_qDot_fixpt_cast_12 * gz_signed;
  Madgwick_qDot_fixpt_sub_cast_11 <= Madgwick_qDot_fixpt_mul_temp_9(27 DOWNTO 0);
  Madgwick_qDot_fixpt_sub_cast_12 <= resize(Madgwick_qDot_fixpt_sub_cast_11, 29);
  Madgwick_qDot_fixpt_sub_temp_3 <= Madgwick_qDot_fixpt_sub_cast_10 - Madgwick_qDot_fixpt_sub_cast_12;
  Madgwick_qDot_fixpt_add_cast_4 <= resize(Madgwick_qDot_fixpt_sub_temp_3, 30);
  Madgwick_qDot_fixpt_cast_13 <= signed(resize(q3_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_10 <= Madgwick_qDot_fixpt_cast_13 * gx_signed;
  Madgwick_qDot_fixpt_add_cast_5 <= Madgwick_qDot_fixpt_mul_temp_10(27 DOWNTO 0);
  Madgwick_qDot_fixpt_add_cast_6 <= resize(Madgwick_qDot_fixpt_add_cast_5, 30);
  Madgwick_qDot_fixpt_add_temp_1 <= Madgwick_qDot_fixpt_add_cast_4 + Madgwick_qDot_fixpt_add_cast_6;
  -- CSD Encoding (8192) : 10000000000000; Cost (Adders) = 0
  Madgwick_qDot_fixpt_mul_temp_11 <= resize(Madgwick_qDot_fixpt_add_temp_1 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 45);
  Madgwick_qDot_fixpt_cast_14 <= Madgwick_qDot_fixpt_mul_temp_11(43 DOWNTO 0);
  qDot3_1 <= Madgwick_qDot_fixpt_cast_14(41 DOWNTO 28);
  Madgwick_qDot_fixpt_cast_15 <= signed(resize(q0_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_12 <= Madgwick_qDot_fixpt_cast_15 * gz_signed;
  Madgwick_qDot_fixpt_add_cast_7 <= Madgwick_qDot_fixpt_mul_temp_12(27 DOWNTO 0);
  Madgwick_qDot_fixpt_add_cast_8 <= resize(Madgwick_qDot_fixpt_add_cast_7, 29);
  Madgwick_qDot_fixpt_cast_16 <= signed(resize(q1_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_13 <= Madgwick_qDot_fixpt_cast_16 * gy_signed;
  Madgwick_qDot_fixpt_add_cast_9 <= Madgwick_qDot_fixpt_mul_temp_13(27 DOWNTO 0);
  Madgwick_qDot_fixpt_add_cast_10 <= resize(Madgwick_qDot_fixpt_add_cast_9, 29);
  Madgwick_qDot_fixpt_add_temp_2 <= Madgwick_qDot_fixpt_add_cast_8 + Madgwick_qDot_fixpt_add_cast_10;
  Madgwick_qDot_fixpt_sub_cast_13 <= resize(Madgwick_qDot_fixpt_add_temp_2, 30);
  Madgwick_qDot_fixpt_cast_17 <= signed(resize(q2_unsigned, 15));
  Madgwick_qDot_fixpt_mul_temp_14 <= Madgwick_qDot_fixpt_cast_17 * gx_signed;
  Madgwick_qDot_fixpt_sub_cast_14 <= Madgwick_qDot_fixpt_mul_temp_14(27 DOWNTO 0);
  Madgwick_qDot_fixpt_sub_cast_15 <= resize(Madgwick_qDot_fixpt_sub_cast_14, 30);
  Madgwick_qDot_fixpt_sub_temp_4 <= Madgwick_qDot_fixpt_sub_cast_13 - Madgwick_qDot_fixpt_sub_cast_15;
  -- CSD Encoding (8192) : 10000000000000; Cost (Adders) = 0
  Madgwick_qDot_fixpt_mul_temp_15 <= resize(Madgwick_qDot_fixpt_sub_temp_4 & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0' & '0', 45);
  Madgwick_qDot_fixpt_cast_18 <= Madgwick_qDot_fixpt_mul_temp_15(43 DOWNTO 0);
  qDot4_1 <= Madgwick_qDot_fixpt_cast_18(41 DOWNTO 28);

  enb <= clk_enable;

  qDot1_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      qDot1_tmp <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        qDot1_tmp <= qDot1_1;
      END IF;
    END IF;
  END PROCESS qDot1_reg_process;


  qDot1 <= std_logic_vector(qDot1_tmp);

  qDot2_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      qDot2_tmp <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        qDot2_tmp <= qDot2_1;
      END IF;
    END IF;
  END PROCESS qDot2_reg_process;


  qDot2 <= std_logic_vector(qDot2_tmp);

  qDot3_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      qDot3_tmp <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        qDot3_tmp <= qDot3_1;
      END IF;
    END IF;
  END PROCESS qDot3_reg_process;


  qDot3 <= std_logic_vector(qDot3_tmp);

  qDot4_reg_process : PROCESS (clk, reset)
  BEGIN
    IF reset = '1' THEN
      qDot4_tmp <= to_signed(16#0000#, 14);
    ELSIF rising_edge(clk) THEN
      IF enb = '1' THEN
        qDot4_tmp <= qDot4_1;
      END IF;
    END IF;
  END PROCESS qDot4_reg_process;


  qDot4 <= std_logic_vector(qDot4_tmp);

  ce_out <= clk_enable;

END rtl;

