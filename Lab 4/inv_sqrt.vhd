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
	  x	: in std_logic_vector(35 downto 0);
	  y0	: in std_logic_vector(35 downto 0);
	  y	: out std_logic_vector(35 downto 0));
  end component;

  signal y0_int : std_logic_vector(35 downto 0);

  begin

  y0 : init_guess port map (clk, x, y0_int);
  n0 : newton port map (clk, x, y0_int, y); 



end architecture;