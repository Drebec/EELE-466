LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;
USE ieee.std_logic_unsigned.all;


entity newton is
  port( clk	: in std_logic;
	x	: in std_logic_vector(35 downto 0);
	y0	: in std_logic_vector(35 downto 0);
	y	: out std_logic_vector(35 downto 0));
end entity;

architecture newton_arch of newton is

  signal y1, y2, y3, y4, y5                                                        : unsigned(35 downto 0);
  signal y1_long 																   : unsigned(71 downto 0);
  signal y0_sq, y1_sq, y2_sq, y3_sq, y4_sq                                         : unsigned(71 downto 0);
  signal y0_sq_trunc, y1_sq_trunc, y2_sq_trunc, y3_sq_trunc, y4_sq_trunc           : unsigned(35 downto 0);
  signal y0_x, y1_x, y2_x, y3_x, y4_x                                              : unsigned(71 downto 0);
  signal y0_x_trunc, y1_x_trunc, y2_x_trunc, y3_x_trunc, y4_x_trunc                : unsigned(35 downto 0);
  signal y0_int, y1_int, y2_int, y3_int, y4_int                                    : unsigned(35 downto 0);
  signal y0_mult, y1_mult, y2_mult, y3_mult, y4_mult                               : unsigned(71 downto 0); 
  signal y0_mult_trunc, y1_mult_trunc, y2_mult_trunc, y3_mult_trunc, y4_mult_trunc : unsigned(35 downto 0);
  signal three                                                                     : unsigned(35 downto 0) := "000000000000000011000000000000000000";

  begin

    -- FIRST ITERATION --
    y0_sq <= unsigned(y0) * unsigned(y0);
    --y0_sq_trunc <= y0_sq(53 downto 18);
    y0_x <= unsigned(x) * y0_sq(53 downto 18);
    --y0_x_trunc <= y0_x(53 downto 18);
    y0_int <= three - y0_x(53 downto 18);
    y0_mult <= y0_int * unsigned(y0);
    --y0_mult_trunc <= y0_mult(53 downto 18);
    y1_long <= shift_right(y0_mult, 1);
	y1 <= y1_long(53 downto 18);

    

    y <= std_logic_vector(y1);
end architecture;