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

  signal yn : std_logic_vector(35 downto 0);


  begin


end architecture;