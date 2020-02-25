----------------------------------------------------------------------------------
-- Company: 
-- Engineer: JPCatarino
-- 
-- Create Date: 20.02.2020 12:33:49
-- Design Name: 
-- Module Name: FreqDivStatic_tb - Behavioral
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

entity FreqDivStatic_tb is
end FreqDivStatic_tb;

architecture Behavioral of FreqDivStatic_tb is

component FreqDevStatic
port( reset : in STD_LOGIC;
      clkIn : in STD_LOGIC;
      clkOut : out STD_LOGIC);
end component; 

signal clkIn : std_logic := '0';
signal reset : std_logic := '0';

signal clkOut : std_logic;

signal s_counter: natural;

constant period : time := 20 ns;

begin

    uut: FreqDevStatic PORT MAP( clkIn => clkIn,
                                 reset => reset,
                                 clkOut => clkOut);
    
    clk_proc: process
    begin
        clkIn <= '0';
        wait for period/2;
        clkIn <= '1';
        wait for period/2;
    end process;

    stm_proc: process
    begin
        wait for 100 ns;
        reset <= '1';
        wait for 100 ns;
        reset <= '0';
        wait;
    end process;


end Behavioral;
