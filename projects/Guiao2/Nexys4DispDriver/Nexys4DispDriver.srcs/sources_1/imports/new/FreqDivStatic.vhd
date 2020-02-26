----------------------------------------------------------------------------------
-- Company: 
-- Engineer: JPCatarino
-- 
-- Create Date: 20.02.2020 12:02:56
-- Design Name: 
-- Module Name: FreqDivStatic - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity FreqDivStatic is
    generic(K : positive := 4);
    Port ( reset : in STD_LOGIC;
           clkIn : in STD_LOGIC;
           clkOut : out STD_LOGIC);
end FreqDivStatic;

architecture Behavioral of FreqDivStatic is
signal s_counter : natural;
begin
    process(clkIn)
    begin
        if rising_edge(clkIn) then
            if ((reset = '1') or (s_counter = K - 1)) then
                clkOut <= '0';
                s_counter <= 0;
            else
                if (s_counter = K/2 - 1) then
                    clkOut <= '1';
                end if;
            s_counter <= s_counter + 1;
            end if;
        end if;
    end process;
end Behavioral;