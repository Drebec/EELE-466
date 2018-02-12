library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity lzc is
    port (
        clk        : in  std_logic;
        lzc_vector : in  std_logic_vector (35 downto 0);
        lzc_count  : out std_logic_vector ( 5 downto 0)
    );
end lzc;

architecture behavioral of lzc is

    signal b0 : std_logic;
    signal b1 : std_logic;
    signal b2 : std_logic;
    signal b3 : std_logic;
    signal b4 : std_logic;
    signal b5 : std_logic;
    signal b6 : std_logic;
    signal b7 : std_logic;
    signal b8 : std_logic;
    signal b9 : std_logic;
    signal b10 : std_logic;
    signal b11 : std_logic;
    signal b12 : std_logic;
    signal b13 : std_logic;
    signal b14 : std_logic;
    signal b15 : std_logic;
    signal b16 : std_logic;
    signal b17 : std_logic;
    signal b18 : std_logic;
    signal b19 : std_logic;
    signal b20 : std_logic;
    signal b21 : std_logic;
    signal b22 : std_logic;
    signal b23 : std_logic;
    signal b24 : std_logic;
    signal b25 : std_logic;
    signal b26 : std_logic;
    signal b27 : std_logic;
    signal b28 : std_logic;
    signal b29 : std_logic;
    signal b30 : std_logic;
    signal b31 : std_logic;
    signal b32 : std_logic;
    signal b33 : std_logic;
    signal b34 : std_logic;
    signal b35 : std_logic;

begin

    process (clk)
    begin
        if rising_edge(clk) then
            b0 <= lzc_vector(0);
            b1 <= lzc_vector(1);
            b2 <= lzc_vector(2);
            b3 <= lzc_vector(3);
            b4 <= lzc_vector(4);
            b5 <= lzc_vector(5);
            b6 <= lzc_vector(6);
            b7 <= lzc_vector(7);
            b8 <= lzc_vector(8);
            b9 <= lzc_vector(9);
            b10 <= lzc_vector(10);
            b11 <= lzc_vector(11);
            b12 <= lzc_vector(12);
            b13 <= lzc_vector(13);
            b14 <= lzc_vector(14);
            b15 <= lzc_vector(15);
            b16 <= lzc_vector(16);
            b17 <= lzc_vector(17);
            b18 <= lzc_vector(18);
            b19 <= lzc_vector(19);
            b20 <= lzc_vector(20);
            b21 <= lzc_vector(21);
            b22 <= lzc_vector(22);
            b23 <= lzc_vector(23);
            b24 <= lzc_vector(24);
            b25 <= lzc_vector(25);
            b26 <= lzc_vector(26);
            b27 <= lzc_vector(27);
            b28 <= lzc_vector(28);
            b29 <= lzc_vector(29);
            b30 <= lzc_vector(30);
            b31 <= lzc_vector(31);
            b32 <= lzc_vector(32);
            b33 <= lzc_vector(33);
            b34 <= lzc_vector(34);
            b35 <= lzc_vector(35);
        end if;
    end process;
 
    process (b0, b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12, b13, b14, b15, b16, b17, b18, b19, b20, b21, b22, b23, b24, b25, b26, b27, b28, b29, b30, b31, b32, b33, b34, b35 )
    begin

        if ((b35 or b34 or b33 or b32 or b31 or b30 or b29 or b28 or b27 or b26 or b25 or b24 or b23 or b22 or b21 or b20 or b19 or b18) = '1') then   -- [35  18]
            if ((b35 or b34 or b33 or b32 or b31 or b30 or b29 or b28 or b27) = '1') then   -- [35  27]
                if ((b35 or b34 or b33 or b32 or b31) = '1') then   -- [35  31]
                    if ((b35 or b34 or b33) = '1') then   -- [35  33]
                        if ((b35 or b34) = '1') then   -- [35  34]
                            if (b35 = '1') then   -- [35]
                                lzc_count <= "000000";  -- lzc = 0
                            else  -- [34]
                                lzc_count <= "000001";  -- lzc = 1
                            end if;
                        else  -- [33]
                            lzc_count <= "000010";  -- lzc = 2
                        end if;
                    else  -- [32  31]
                        if (b32 = '1') then   -- [32]
                            lzc_count <= "000011";  -- lzc = 3
                        else  -- [31]
                            lzc_count <= "000100";  -- lzc = 4
                        end if;
                    end if; 
                else  -- [30  27]
                    if ((b30 or b29) = '1') then   -- [30  29]
                        if (b30 = '1') then   -- [30]
                            lzc_count <= "000101";  -- lzc = 5
                        else  -- [29]
                            lzc_count <= "000110";  -- lzc = 6
                        end if;
                    else  -- [28  27]
                        if (b28 = '1') then   -- [28]
                            lzc_count <= "000111";  -- lzc = 7
                        else  -- [27]
                            lzc_count <= "001000";  -- lzc = 8
                        end if;
                    end if; 
                end if; 
            else  -- [26  18]
                if ((b26 or b25 or b24 or b23 or b22) = '1') then   -- [26  22]
                    if ((b26 or b25 or b24) = '1') then   -- [26  24]
                        if ((b26 or b25) = '1') then   -- [26  25]
                            if (b26 = '1') then   -- [26]
                                lzc_count <= "001001";  -- lzc = 9
                            else  -- [25]
                                lzc_count <= "001010";  -- lzc = 10
                            end if;
                        else  -- [24]
                            lzc_count <= "001011";  -- lzc = 11
                        end if;
                    else  -- [23  22]
                        if (b23 = '1') then   -- [23]
                            lzc_count <= "001100";  -- lzc = 12
                        else  -- [22]
                            lzc_count <= "001101";  -- lzc = 13
                        end if;
                    end if; 
                else  -- [21  18]
                    if ((b21 or b20) = '1') then   -- [21  20]
                        if (b21 = '1') then   -- [21]
                            lzc_count <= "001110";  -- lzc = 14
                        else  -- [20]
                            lzc_count <= "001111";  -- lzc = 15
                        end if;
                    else  -- [19  18]
                        if (b19 = '1') then   -- [19]
                            lzc_count <= "010000";  -- lzc = 16
                        else  -- [18]
                            lzc_count <= "010001";  -- lzc = 17
                        end if;
                    end if; 
                end if; 
            end if; 
        else  -- [17   0]
            if ((b17 or b16 or b15 or b14 or b13 or b12 or b11 or b10 or b9) = '1') then   -- [17   9]
                if ((b17 or b16 or b15 or b14 or b13) = '1') then   -- [17  13]
                    if ((b17 or b16 or b15) = '1') then   -- [17  15]
                        if ((b17 or b16) = '1') then   -- [17  16]
                            if (b17 = '1') then   -- [17]
                                lzc_count <= "010010";  -- lzc = 18
                            else  -- [16]
                                lzc_count <= "010011";  -- lzc = 19
                            end if;
                        else  -- [15]
                            lzc_count <= "010100";  -- lzc = 20
                        end if;
                    else  -- [14  13]
                        if (b14 = '1') then   -- [14]
                            lzc_count <= "010101";  -- lzc = 21
                        else  -- [13]
                            lzc_count <= "010110";  -- lzc = 22
                        end if;
                    end if; 
                else  -- [12   9]
                    if ((b12 or b11) = '1') then   -- [12  11]
                        if (b12 = '1') then   -- [12]
                            lzc_count <= "010111";  -- lzc = 23
                        else  -- [11]
                            lzc_count <= "011000";  -- lzc = 24
                        end if;
                    else  -- [10   9]
                        if (b10 = '1') then   -- [10]
                            lzc_count <= "011001";  -- lzc = 25
                        else  -- [9]
                            lzc_count <= "011010";  -- lzc = 26
                        end if;
                    end if; 
                end if; 
            else  -- [8  0]
                if ((b8 or b7 or b6 or b5 or b4) = '1') then   -- [8  4]
                    if ((b8 or b7 or b6) = '1') then   -- [8  6]
                        if ((b8 or b7) = '1') then   -- [8  7]
                            if (b8 = '1') then   -- [8]
                                lzc_count <= "011011";  -- lzc = 27
                            else  -- [7]
                                lzc_count <= "011100";  -- lzc = 28
                            end if;
                        else  -- [6]
                            lzc_count <= "011101";  -- lzc = 29
                        end if;
                    else  -- [5  4]
                        if (b5 = '1') then   -- [5]
                            lzc_count <= "011110";  -- lzc = 30
                        else  -- [4]
                            lzc_count <= "011111";  -- lzc = 31
                        end if;
                    end if; 
                else  -- [3  0]
                    if ((b3 or b2) = '1') then   -- [3  2]
                        if (b3 = '1') then   -- [3]
                            lzc_count <= "100000";  -- lzc = 32
                        else  -- [2]
                            lzc_count <= "100001";  -- lzc = 33
                        end if;
                    else  -- [1  0]
                        if (b1 = '1') then   -- [1]
                            lzc_count <= "100010";  -- lzc = 34
                        else  -- [0]
                            lzc_count <= "100011";  -- lzc = 35
                        end if;
                    end if; 
                end if; 
            end if; 
        end if; 

    end process;

end behavioral;
