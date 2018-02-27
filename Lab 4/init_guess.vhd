LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

entity init_guess is
  port( clk	: in std_logic;
	x	: in std_logic_vector(35 downto 0);
	y0	: out std_logic_vector(35 downto 0));
end entity;

architecture init_guess_arch of init_guess is

  constant C : integer := 17;

  component lzc is
    port ( clk        : in  std_logic;
           lzc_vector : in  std_logic_vector (35 downto 0);
           lzc_count  : out std_logic_vector ( 5 downto 0));
  end component;

  component rom is
    port( address	: IN STD_LOGIC_VECTOR (7 DOWNTO 0);
	  clock		: IN STD_LOGIC  := '1';
	  q		: OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
  end component;

  signal address_sig 	: std_logic_vector(7 downto 0);
  signal q_sig		: std_logic_vector(7 downto 0);

  -- Holds the leading zeros of x
  signal Z		: std_logic_vector(5 downto 0);

  signal alpha		: signed(6 downto 0);
  signal beta           : signed(6 downto 0);


  begin

  --rom_inst : rom PORT MAP (
	--     address	 => address_sig,
        --     clock	 => clk,
	--     q		 => q_sig);

  lzc_inst : lzc PORT MAP (clk => clk, lzc_vector => x, lzc_count => Z);

  -- beta <= C - Z
  beta <= (to_signed(C, 7) - signed(Z));
  
  ALPHA_PROC : process (clk)
    begin
      if(beta(0) = '0') then
	alpha <= shift_right(beta, 1) - shift_left(beta, 1);
      else
	alpha <= shift_right((beta + "0000001"), 1) - shift_left(beta, 1);
      end if;

  end process;

  y0 (6 downto 0) <= std_logic_vector(alpha);
end architecture;
