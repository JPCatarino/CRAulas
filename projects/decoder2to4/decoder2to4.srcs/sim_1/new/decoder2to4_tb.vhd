----------------------------------------------------------------------------------
-- Company: 
-- Engineer: JPCatarino
-- 
-- Create Date: 25.02.2020 19:52:43
-- Design Name: 
-- Module Name: decoder2to4_tb - Behavioral
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
use IEEE.STD_LOGIC_1164.all;
-- Entidade sem portos
entity decoder2to4_tb is

end decoder2to4_tb;

architecture Stimulus of decoder2to4_tb is
 -- Sinais para ligar �s entradas da UUT
	signal s_enable : std_logic;
	signal s_inputs : std_logic_vector(1 downto 0);

 -- Sinal para ligar �s sa�das da UUT
	signal s_outputs : std_logic_vector(3 downto 0);
begin
 -- Instancia��o da Unit Under Test (UUT)
	uut: entity work.decoder2to4(Behavioral)
		port map(enable => s_enable,
					inputs => s_inputs,
					outputs => s_outputs);

 --Process stim
 stim_proc : process
 begin
		wait for 100 ns;
		s_enable <= '0';
		wait for 100 ns;
		s_enable <= '1';
		wait for 100 ns;
		s_inputs <= "00";
		wait for 100 ns;
		s_inputs <= "10";
		wait for 100 ns;
		s_inputs <= "01";
		wait for 100 ns;
		s_inputs <= "11";
		wait for 100 ns;
	end process;
end Stimulus;