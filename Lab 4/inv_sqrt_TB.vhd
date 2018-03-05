
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity inv_sqrt_TB is
end entity;

architecture inv_sqrt_TB_arch of inv_sqrt_TB is

  component inv_sqrt is
    port( clk	: in std_logic;
	  x	: in std_logic_vector(35 downto 0);
	  y 	: out std_logic_vector(35 downto 0));
  end component;

  signal x_TB, y_TB : std_logic_vector(35 downto 0);
  signal clk_TB      : std_logic;

  begin

  DUT : inv_sqrt port map (clk => clk_TB, x => x_TB, y => y_TB);

  CLK_STIM : process
    begin
      clk_TB <= '0'; wait for 10 ns;
      clk_TB <= '1'; wait for 10 ns;
  end process;

  TEST : process
    begin
      x_TB <= "000000000001011101001000000000000000"; wait;
  end process;
end architecture;