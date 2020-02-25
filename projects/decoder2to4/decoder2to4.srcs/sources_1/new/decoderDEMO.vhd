----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 25.02.2020 19:40:27
-- Design Name: 
-- Module Name: decoderDEMO - Behavioral
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

entity decoderDEMO is
    Port ( sw : in STD_LOGIC_VECTOR (2 downto 0);
           led : out STD_LOGIC_VECTOR (3 downto 0));
end decoderDEMO;

architecture Shell of decoderDEMO is

begin
    core: entity work.decoder2to4(Behavioral) 
          port map(enable => sw(2),
                   inputs => sw(1 downto 0),
                   outputs => led(3 downto 0));

end Shell;
