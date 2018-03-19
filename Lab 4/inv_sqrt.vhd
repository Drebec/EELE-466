LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity inv_sqrt is
  port( clk	: in std_logic;
	x	: in std_logic_vector(35 downto 0);
	y	: out std_logic_vector(35 downto 0));
end entity;

architecture inv_sqrt_arch of inv_sqrt is

  component init_guess
    port( clk	: in std_logic;
	  x	: in std_logic_vector(35 downto 0);
	  y0	: out std_logic_vector(35 downto 0));
  end component;

  component newton
    port( clk	: in std_logic;
	  x		: in std_logic_vector(35 downto 0);
	  y0	: in std_logic_vector(35 downto 0);
	  y		: out std_logic_vector(35 downto 0));
  end component;

  signal y0_int : std_logic_vector(35 downto 0);
  signal y1_int : std_logic_vector(35 downto 0);
  signal y2_int : std_logic_vector(35 downto 0);
  signal y3_int : std_logic_vector(35 downto 0);
  signal y4_int : std_logic_vector(35 downto 0);
  signal y5_int : std_logic_vector(35 downto 0);
  signal y6_int : std_logic_vector(35 downto 0);

  begin

-- x"000006A53"
  y0 : init_guess port map (clk, x, y);
 --n0 : newton port map (clk, x, y0_int, y1_int); 
 --n1 : newton port map (clk, x, y1_int, y2_int); 
 --n2 : newton port map (clk, x, y2_int, y3_int); 
 --n3 : newton port map (clk, x, y3_int, y4_int); 
 --n4 : newton port map (clk, x, y4_int, y5_int); 
 --n5 : newton port map (clk, x, y5_int, y6_int); 
 --n6 : newton port map (clk, x, y6_int, y); 
	
	


end architecture;