library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counterTB is
end counterTB;

architecture Behavioral of counterTB is
    signal CLK: std_logic;
    signal LOADC: std_logic := '1';
    signal ENC: std_logic := '1';
    signal count: std_logic_vector(3 downto 0);
begin
    -- clock
    CLK_process: process is
    begin

        CLK <= '0';
        wait for 50 ns;
        CLK <= '1';
        wait for 50 ns;
    end process;
    
    LOADC <= '0' after 50 ns;
    
    counter: entity work.counter_4b(struct)
        port map(CLK, LOADC, ENC, count);

end Behavioral;

