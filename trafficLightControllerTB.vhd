library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity trafficLightControllerTB is
end trafficLightControllerTB;

architecture Behavioral of trafficLightControllerTB is
    signal CLK: std_logic;
    signal MSC, SSC: std_logic_vector(3 downto 0);
    signal reset: std_logic := '1';
    signal MSTL, SSTL: std_logic_vector(2 downto 0);
    signal SSCS: std_logic := '0';
begin
    

    MSC <= "1110";
    SSC <= "1010";

    -- clock
    CLK_process: process is
    begin

        CLK <= '0';
        wait for 50 ns;
        CLK <= '1';
        wait for 50 ns;
    end process;
    
    SSCS <= '1' after 1550 ns;
    
    reset <= '0' after 50 ns;

    TLC: entity work.trafficLightController(struct)
        port map(MSC, SSC, SSCS, CLK, reset, MSTL, SSTL);


end Behavioral;
