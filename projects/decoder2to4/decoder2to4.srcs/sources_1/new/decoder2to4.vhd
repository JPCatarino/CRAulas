----------------------------------------------------------------------------------
-- Company: 
-- Engineer: JPCatarino
-- 
-- Create Date: 25.02.2020 19:15:49
-- Design Name: 
-- Module Name: decoder2to4 - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity decoder2to4 is
    Port ( enable : in STD_LOGIC;
           inputs : in STD_LOGIC_VECTOR (1 downto 0);
           outputs : out STD_LOGIC_VECTOR (3 downto 0));
end decoder2to4;

architecture Behavioral of decoder2to4 is

begin
    process(enable, inputs)
    begin
        if(enable = '0') then
            outputs <= "0000";
        else 
            if(inputs = "00") then
                outputs <= "0001";
            elsif(inputs = "01") then
                outputs <= "0010";
            elsif(inputs = "10") then
                outputs <= "0100";
            else 
                outputs <= "1000";
            end if;
        end if;
    end process;
end Behavioral;
