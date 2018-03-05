LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity newton is
  port( clk	: in std_logic;
	x	: in std_logic_vector(35 downto 0);
	y0	: in std_logic_vector(35 downto 0);
	y	: out std_logic_vector(35 downto 0));
end entity;

architecture newton_arch of newton is

  signal y1, y2, y3, y4, y5                                                        : signed(35 downto 0);
  signal y0_sq, y1_sq, y2_sq, y3_sq, y4_sq                                         : signed(71 downto 0);
  signal y0_sq_trunc, y1_sq_trunc, y2_sq_trunc, y3_sq_trunc, y4_sq_trunc           : signed(35 downto 0);
  signal y0_x, y1_x, y2_x, y3_x, y4_x                                              : signed(71 downto 0);
  signal y0_x_trunc, y1_x_trunc, y2_x_trunc, y3_x_trunc, y4_x_trunc                : signed(35 downto 0);
  signal y0_int, y1_int, y2_int, y3_int, y4_int                                    : signed(35 downto 0);
  signal y0_mult, y1_mult, y2_mult, y3_mult, y4_mult                               : signed(71 downto 0); 
  signal y0_mult_trunc, y1_mult_trunc, y2_mult_trunc, y3_mult_trunc, y4_mult_trunc : signed(35 downto 0);
  signal three                                                                     : signed(35 downto 0) := "000000000000000011000000000000000000";

  begin

    -- FIRST ITERATION --
    y0_sq <= signed(y0) * signed(y0);
    y0_sq_trunc <= y0_sq(53 downto 18);
    y0_x <= signed(x) * y0_sq_trunc;
    y0_x_trunc <= y0_x(53 downto 18);
    y0_int <= three - y0_x_trunc;
    y0_mult <= y0_int * signed(y0);
    y0_mult_trunc <= y0_mult(53 downto 18);
    y1 <= shift_right(y0_mult_trunc, 1);

    y1_sq <= signed(y1) * signed(y1);
    y1_sq_trunc <= y1_sq(53 downto 18);
    y1_x <= signed(x) * y1_sq_trunc;
    y1_x_trunc <= y1_x(53 downto 18);
    y1_int <= three - y1_x_trunc;
    y1_mult <= y1_int * signed(y1);
    y1_mult_trunc <= y1_mult(53 downto 18);
    y2 <= shift_right(y1_mult_trunc, 1);

    y2_sq <= signed(y2) * signed(y2);
    y2_sq_trunc <= y2_sq(53 downto 18);
    y2_x <= signed(x) * y2_sq_trunc;
    y2_x_trunc <= y2_x(53 downto 18);
    y2_int <= three - y2_x_trunc;
    y2_mult <= y2_int * signed(y2);
    y2_mult_trunc <= y2_mult(53 downto 18);
    y3 <= shift_right(y2_mult_trunc, 1);

    y3_sq <= signed(y3) * signed(y3);
    y3_sq_trunc <= y3_sq(53 downto 18);
    y3_x <= signed(x) * y3_sq_trunc;
    y3_x_trunc <= y3_x(53 downto 18);
    y3_int <= three - y3_x_trunc;
    y3_mult <= y3_int * signed(y3);
    y3_mult_trunc <= y3_mult(53 downto 18);
    y4 <= shift_right(y3_mult_trunc, 1);

    y4_sq <= signed(y4) * signed(y4);
    y4_sq_trunc <= y4_sq(53 downto 18);
    y4_x <= signed(x) * y4_sq_trunc;
    y4_x_trunc <= y4_x(53 downto 18);
    y4_int <= three - y4_x_trunc;
    y4_mult <= y4_int * signed(y4);
    y4_mult_trunc <= y4_mult(53 downto 18);
    y5 <= shift_right(y4_mult_trunc, 1);

    y <= std_logic_vector(y5);
end architecture;