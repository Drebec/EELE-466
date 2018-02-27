library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity init_guess_TB is
end entity;

architecture init_guess_TB_arch of init_guess_TB is

  component init_guess is
    port( clk	: in std_logic;
	  x	: in std_logic_vector(35 downto 0);
	  y0	: out std_logic_vector(35 downto 0));
  end component;

  signal x_TB, y0_TB : std_logic_vector(35 downto 0);
  signal clk_TB      : std_logic;

  begin

  DUT : init_guess port map (clk => clk_TB, x => x_TB, y0 => y0_TB);

  CLK_STIM : process
    begin
      clk_TB <= '0'; wait for 10 ns;
      clk_TB <= '1'; wait for 10 ns;
  end process;

  TEST : process
    begin
      x_TB <= "000000000000000000000000000000000001"; wait;
  end process;
end architecture;