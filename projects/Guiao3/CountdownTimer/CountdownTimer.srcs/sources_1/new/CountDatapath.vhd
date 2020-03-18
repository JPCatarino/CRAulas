----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 17.03.2020 02:34:06
-- Design Name: 
-- Module Name: CountDatapath - Behavioral
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

entity CountDatapath is
    Port ( clk : in STD_LOGIC;
           clkEnable : in STD_LOGIC;
           minLSSetDec : in STD_LOGIC;
           minLSSetInc : in STD_LOGIC;
           minMSSetDec : in STD_LOGIC;
           minMSSetInc : in STD_LOGIC;
           reset : in STD_LOGIC;
           runFlag : in STD_LOGIC;
           secLSSetDec : in STD_LOGIC;
           secLSSetInc : in STD_LOGIC;
           secMSSetDec : in STD_LOGIC;
           secMSSetInc : in STD_LOGIC;
           minLSCntVal : out STD_LOGIC_VECTOR (3 downto 0);
           minMSCntVal : out STD_LOGIC_VECTOR (3 downto 0);
           secLSCntVal : out STD_LOGIC_VECTOR (3 downto 0);
           secMSCntVal : out STD_LOGIC_VECTOR (3 downto 0);
           zeroFlag : out STD_LOGIC);
end CountDatapath;

architecture Behavioral of CountDatapath is

    signal s_SLSTerm, s_SMSTerm, s_MLSTerm, s_MMSTerm : std_logic;
    signal s_MLSEn, s_MMSEn                           : std_logic;
begin
    counterSecLS: 
    entity work.CounterDown4(Behavioral)
    generic map(MAX_VAL => 9)
    port map(reset      => reset,   
		     clk        => clk,    
		     clkEnable  => clkEnable,
		     cntEnable  => runFlag, 
		     setIncrem  => secLSSetInc, 
		     setDecrem  => secLSSetDec,
		     valOut     => secLSCntVal,
		     termCnt    => s_SLSTerm
    );
    
    counterSecMS: 
    entity work.CounterDown4(Behavioral)
    generic map(MAX_VAL => 5)
    port map(reset      => reset,   
		     clk        => clk,    
		     clkEnable  => clkEnable,
		     cntEnable  => s_SLSTerm, 
		     setIncrem  => secMSSetInc, 
		     setDecrem  => secMSSetDec,
		     valOut     => secMSCntVal,
		     termCnt    => s_SMSTerm
    );
    
    s_MLSEn <= s_SLSTerm and s_SMSTerm;
    
    counterMinLS: 
    entity work.CounterDown4(Behavioral)
    generic map(MAX_VAL => 9)
    port map(reset      => reset,   
		     clk        => clk,    
		     clkEnable  => clkEnable,
		     cntEnable  => s_MLSEn, 
		     setIncrem  => minLSSetInc, 
		     setDecrem  => minLSSetDec,
		     valOut     => minLSCntVal,
		     termCnt    => s_MLSTerm
    );
    
    s_MMSEn <= s_MLSEn and s_MLSTerm;
    
    counterMinMS: 
    entity work.CounterDown4(Behavioral)
    generic map(MAX_VAL => 5)
    port map(reset      => reset,   
		     clk        => clk,    
		     clkEnable  => clkEnable,
		     cntEnable  => s_MMSEn, 
		     setIncrem  => minMSSetInc, 
		     setDecrem  => minMSSetDec,
		     valOut     => minMSCntVal,
		     termCnt    => s_MMSTerm
    );
    
    zeroFlag <= s_MMSTerm and s_MMSEn;
    
    
end Behavioral;
