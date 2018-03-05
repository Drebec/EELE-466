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
	  q		: OUT STD_LOGIC_VECTOR (17 DOWNTO 0));
  end component;

  signal address_sig 	: std_logic_vector(7 downto 0);
  signal q_sig		: std_logic_vector(17 downto 0);

  -- Holds the leading zeros of x
  signal Z		: std_logic_vector(5 downto 0);

  signal alpha		: signed(6 downto 0);
  signal beta           : signed(6 downto 0);
  signal beta_int       : signed(5 downto 0);

  signal x_alpha        : unsigned(35 downto 0);
  signal x_alpha_int	: unsigned(35 downto 0);
  signal x_beta         : unsigned(35 downto 0);
  signal x_beta_int     : std_logic_vector(35 downto 0);
  signal x_beta_rom     : std_logic_vector(17 downto 0);

  signal y0_int		: unsigned(35 downto 0);
  signal y0_mid		: unsigned(71 downto 0);
  signal y0_mid2	: unsigned(71 downto 0);
  signal y0_out		: unsigned(35 downto 0);
  signal root2		: unsigned(35 downto 0) := "000000000000000000101101010000010100";


  begin

  rom_inst : rom PORT MAP (
	     address	 => address_sig,
             clock	 => clk,
	     q		 => q_sig);

  lzc_inst : lzc PORT MAP (clk => clk, lzc_vector => x, lzc_count => Z);

  -- beta <= C - Z
  beta_int <= (to_signed(C, 6) - signed(Z));
  beta <= beta_int(5) & beta_int(5 downto 0);

  
  ALPHA_PROC : process (clk)
    begin
      if(rising_edge(clk)) then
        if(beta(0) = '0') then
	  alpha <= shift_right(beta, 1) - shift_left(beta, 1);
        else
	  alpha <= shift_right((beta + "0000001"), 1) - shift_left(beta, 1);
        end if;
      end if;
  end process;

  x_beta <= unsigned(x) srl to_integer(beta);
  x_alpha <= unsigned(x) sll to_integer(alpha);

  x_alpha_int <= x_alpha;

  x_beta_int <= std_logic_vector(x_beta);
  address_sig <= x_beta_int(17 downto 10);

  x_beta_rom <= q_sig;

  y0_mid <= x_alpha * (unsigned("00000000000000000" & x_beta_rom & '0'));
  y0_int <= y0_mid(53 downto 18);

  GUESS_PROC : process (clk)
    begin
      if(rising_edge(clk)) then
        if(beta(0) = '1') then
	  y0_mid2 <= y0_int * root2;
	  y0_out <= y0_mid2(53 downto 18);
        else
	  y0_out <= y0_int;
        end if;
      end if;
  end process;

  y0 <= std_logic_vector(y0_out);


  

--  SHIFT_X_PROC : process(clk)
--    begin

--      if(beta(6) = '0') then
--        x_beta <= shift_right(signed(x), to_integer(beta));
--      else
--        x_beta <= shift_right(signed(x), to_integer((not(beta) + 1)));
--      end if;
--      
--      if(alpha(6) = '0') then
--        x_alpha <= shift_left(signed(x), to_integer(alpha));
--      else
--        x_alpha <= shift_right(signed(x), to_integer((not(alpha) + 1)));
--      end if;
--  end process;

  y0 (6 downto 0) <= std_logic_vector(alpha);
end architecture;
