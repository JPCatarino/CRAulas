----------------------------------------------------------------------------------
-- Company: 
-- Engineer: JPCatarino 
-- 
-- Create Date: 26.02.2020 16:08:16
-- Design Name: 
-- Module Name: 7SegDecoder - Behavioral
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

entity Bin7SegDecoder is
    Port ( enableDigit : in STD_LOGIC;
           segIn : in STD_LOGIC_VECTOR (3 downto 0);
           segOut : out STD_LOGIC_VECTOR (6 downto 0));
end Bin7SegDecoder;

architecture Behavioral of Bin7SegDecoder is

begin
    process(enableDigit, segIn)
    begin
        if(enableDigit) then
            case segIn is 
                when "0000" => segOut <= "1000000";     -- 0 
                when "0001" => segOut <= "1111001";     -- 1
                when "0010" => segOut <= "0100100";     -- 2
                when "0011" => segOut <= "0110000";     -- 3
                when "0100" => segOut <= "0011001";     -- 4
                when "0101" => segOut <= "0010010";     -- 5
                when "0110" => segOut <= "0000010";     -- 6
                when "0111" => segOut <= "1111000";     -- 7
                when "1000" => segOut <= "0000000";     -- 8
                when "1001" => segOut <= "0010000";     -- 9
                when "1010" => segOut <= "0001000";     -- A
                when "1011" => segOut <= "0000011";     -- B
                when "1100" => segOut <= "1000110";     -- C
                when "1101" => segOut <= "0100001";     -- D
                when "1110" => segOut <= "0000110";     -- E
                when "1111" => segOut <= "0001110";     -- F
                when others => segOut <= "1111111";     -- NOTHING
            end case;
        end if;
    end process; 
end Behavioral;
