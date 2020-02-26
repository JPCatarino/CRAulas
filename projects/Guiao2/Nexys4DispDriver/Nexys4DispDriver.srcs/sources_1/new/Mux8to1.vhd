----------------------------------------------------------------------------------
-- Company: 
-- Engineer: JPCatarino
-- 
-- Create Date: 26.02.2020 16:46:55
-- Design Name: 
-- Module Name: Mux8to1 - Behavioral
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

entity Mux8to1 is
    Port ( bIn : in STD_LOGIC_VECTOR (7 downto 0);
           sel : in STD_LOGIC_VECTOR (2 downto 0);
           bOut : out STD_LOGIC);
end Mux8to1;

architecture Behavioral of Mux8to1 is
    
begin
    process(bIn, sel)
    begin
        case sel is
            when "111"  => bOut <= bIn(7); 
            when "110"  => bOut <= bIn(6);
            when "101"  => bOut <= bIn(5);
            when "100"  => bOut <= bIn(4);
            when "011"  => bOut <= bIn(3);
            when "010"  => bOut <= bIn(2);
            when "001"  => bOut <= bIn(1);
            when "000"  => bOut <= bIn(0);
        end case;
    end process;

end Behavioral;
