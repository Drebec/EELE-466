library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity full_adder is
  port (A, B  : in std_logic;
        Cin   : in std_logic;
        Cout  : out std_logic;
        S     : out std_logic);
end entity;

architecture full_adder_arch of full_adder is
  begin
  S <= ((A xor B) xor Cin);
  Cout <= ((A and B) or (Cin and (A xor B)));
end architecture;