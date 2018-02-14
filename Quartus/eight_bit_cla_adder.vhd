library IEEE;
use IEEE.std_logic_1164.all;

entity eight_bit_cla_adder is
  port( CLK  : in std_logic; 
   A, B	: in std_logic_vector(7 downto 0);
	Sub	: in std_logic;
	S	: out std_logic_vector(7 downto 0);
	Cout	: out std_logic);
end entity;

architecture eight_bit_cla_adder_arch of eight_bit_cla_adder is

  component four_bit_cla_adder is
    port( A, B 	: in std_logic_vector(3 downto 0);
	  Cin	: in std_logic;
	  S    	: out std_logic_vector(3 downto 0);
	  Cout 	: out std_logic);
  end component;

  signal Bin : std_logic_vector(7 downto 0);
  signal C2  : std_logic;

  begin

  Bin(0) <= B(0) xor Sub;
  Bin(1) <= B(1) xor Sub;
  Bin(2) <= B(2) xor Sub;
  Bin(3) <= B(3) xor Sub;
  Bin(4) <= B(4) xor Sub;
  Bin(5) <= B(5) xor Sub;
  Bin(6) <= B(6) xor Sub;
  Bin(7) <= B(7) xor Sub;

  cla0 : four_bit_cla_adder port map(A => A(3 downto 0), B => Bin(3 downto 0), Cin => Sub, Cout => C2, S => S(3 downto 0));
  cla1 : four_bit_cla_adder port map(A => A(7 downto 4), B => bin(7 downto 4), Cin => C2, Cout => Cout, S=> S(7 downto 4));


end architecture;
