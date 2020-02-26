----------------------------------------------------------------------------------
-- Company: 
-- Engineer: JPCatarino
-- 
-- Create Date: 26.02.2020 16:05:20
-- Design Name: 
-- Module Name: Nexys4Disp - Behavioral
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

entity Nexys4Disp is
    Port ( clk          : in  STD_LOGIC;
           enableClk    : in  STD_LOGIC;
           enableDigits : in  STD_LOGIC_VECTOR (7 downto 0);
           enablePoints : in  STD_LOGIC_VECTOR (7 downto 0);
           v0           : in  STD_LOGIC_VECTOR (3 downto 0);
           v1           : in  STD_LOGIC_VECTOR (3 downto 0);
           v2           : in  STD_LOGIC_VECTOR (3 downto 0);
           v3           : in  STD_LOGIC_VECTOR (3 downto 0);
           v4           : in  STD_LOGIC_VECTOR (3 downto 0);
           v5           : in  STD_LOGIC_VECTOR (3 downto 0);
           v6           : in  STD_LOGIC_VECTOR (3 downto 0);
           v7           : in  STD_LOGIC_VECTOR (3 downto 0);
           an           : out STD_LOGIC_VECTOR (7 downto 0);
           dp           : out STD_LOGIC;
           seg          : out STD_LOGIC_VECTOR (6 downto 0));
end Nexys4Disp;

architecture Behavioral of Nexys4Disp is
    signal s_enableDigit : STD_LOGIC;
    signal s_currentV    : STD_LOGIC_VECTOR(3 downto 0);
    signal s_counter     : STD_LOGIC_VECTOR(2 downto 0);

begin

    dgMux:  entity work.Mux8to1(Behavioral)
            port map(bIn  => enableDigits,
                     sel  => s_counter,
                     bOut => s_enableDigit);

    ptMux:  entity work.Mux8To1(Behavioral)
            port map(bIn  => enablePoints,
                     sel  => s_counter,
                     bOut => dp);

    segDec: entity work.Bin7SegDecoder(Behavioral)
            port map(enableDigit => s_enableDigit,
                     segIn       => s_currentV,
                     segOut      => seg);

end Behavioral;
