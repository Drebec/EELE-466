library ieee;
use ieee.std_logic_1164.all;

entity eight_bit_rca_TB is
end entity;

architecture eight_bit_rca_TB_arch of eight_bit_rca_TB is

  component eight_bit_cla_adder is
    port (A, B : in std_logic_vector(7 downto 0);
          Sub  : in std_logic;
          S    : out std_logic_vector(7 downto 0);
          Cout : out std_logic);
  end component;

  signal A_TB, B_TB : std_logic_vector(7 downto 0);
  signal Sub_TB     : std_logic;
  signal S_TB       : std_logic_vector(7 downto 0);
  signal Cout_TB    : std_logic;

  begin

  DUT : eight_bit_cla_adder port map (A => A_TB, B => B_TB, Sub => Sub_TB, S => S_TB, Cout => Cout_TB);

  TEST : process
    begin
      Sub_TB <= '0';
      A_TB <= "00000001"; B_TB <= "01010101"; wait for 10 ns;
      A_TB <= "00000001"; B_TB <= "11111110"; wait for 10 ns;
      A_TB <= "11111110"; B_TB <= "00000001"; wait for 10 ns;
      A_TB <= "11111111"; B_TB <= "11111111"; wait for 10 ns;

      Sub_TB <= '1';
      A_TB <= "00000001"; B_TB <= "01010101"; wait for 10 ns;
      A_TB <= "00000001"; B_TB <= "11111110"; wait for 10 ns;
      A_TB <= "11111110"; B_TB <= "00000001"; wait for 10 ns;
      A_TB <= "11111111"; B_TB <= "11111111"; wait for 10 ns;
  end process;
end architecture;
