----------------------------------------------------------------------------------
-- Company: 
-- Engineer: JPCatarino
-- 
-- Create Date: 17.03.2020 02:27:45
-- Design Name: 
-- Module Name: ControlUnit - Behavioral
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

entity ControlUnit is
    Port ( btnDown : in STD_LOGIC;
           btnSet : in STD_LOGIC;
           btnStart : in STD_LOGIC;
           btnUp : in STD_LOGIC;
           clk : in STD_LOGIC;
           reset : in STD_LOGIC;
           upDownEn : in STD_LOGIC;
           zeroFlag : in STD_LOGIC;
           minLSSetDec : out STD_LOGIC;
           minLSSetInc : out STD_LOGIC;
           minMSSetDec : out STD_LOGIC;
           minMSSetInc : out STD_LOGIC;
           runFlag : out STD_LOGIC;
           secLSSetDec : out STD_LOGIC;
           secLSSetInc : out STD_LOGIC;
           secMSSetDec : out STD_LOGIC;
           secMSSetInc : out STD_LOGIC;
           setFlags : out STD_LOGIC_VECTOR (3 downto 0));
end ControlUnit;

architecture Behavioral of ControlUnit is

    type TState is (ST_STOPPED, ST_RUN,ST_MINMS, ST_MINLS, ST_SECMS, ST_SECLS);
    signal s_currentState, s_nextState : TState;

begin
    
    sync_proc: 
    process(clk)
    begin
        if(rising_edge(clk)) then
            if(reset='1') then
                s_currentState <= ST_STOPPED;
            else
                s_currentState <= s_nextState;
            end if;
        end if;
    end process;

    fsm_proc:
    process(s_currentState, btnStart, btnSet, btnUp,  btnDown, zeroFlag, upDownEn)
    begin
        
        setFlags <= "0000";
        
        minMSSetInc <= '0';
        minMSSetDec <= '0';
        minLSSetInc <= '0';
        minLSSetDec <= '0';
        secMSSetInc <= '0';
        secMSSetDec <= '0';
        secLSSetInc <= '0';
        secLSSetDec <= '0';
        
        runFlag <= '0';

        
        case s_currentState is
        
            when ST_STOPPED => 
                runFlag <= '0';
                if(btnStart = '1') then
                    s_nextState <= ST_RUN;
                elsif(btnSet = '1') then
                    s_nextState <= ST_MINMS;
                else
                    s_nextState <= ST_STOPPED;
                end if;
            
            when ST_RUN => 
                runFlag <= '1';
                if(btnStart = '1' or zeroFlag = '1') then
                    s_nextState <= ST_STOPPED;
                else
                    s_nextState <= ST_RUN;
                end if;
            
            when ST_MINMS =>
                setFlags(3) <= '1';
                minMSSetInc <= '0';
                minMSSetDec <= '0';
                
                if(btnUp = '1' and upDownEn = '1') then
                    minMSSetInc <= '1';
                    s_nextState <= ST_MINMS;
                elsif(btnDown = '1' and upDownEn = '1') then
                    minMSSetDec <= '1';
                    s_nextState <= ST_MINMS;
                elsif(btnSet = '1') then
                    s_nextState <= ST_MINLS;
                else
                    s_nextState <= ST_MINMS;
                end if;
                
            when ST_MINLS =>
                setFlags(2) <= '1';
                minLSSetInc <= '0';
                minLSSetDec <= '0';
                
                if(btnUp = '1' and upDownEn = '1') then
                    minLSSetInc <= '1';
                    s_nextState <= ST_MINLS;
                elsif(btnDown = '1' and upDownEn = '1') then
                    minLSSetDec <= '1';
                    s_nextState <= ST_MINLS;
                elsif(btnSet = '1') then
                    s_nextState <= ST_SECMS;
                else
                    s_nextState <= ST_MINLS;
                end if;
                
            when ST_SECMS =>
                setFlags(1) <= '1';
                secMSSetInc <= '0';
                secMSSetDec <= '0';
                
                if(btnUp = '1' and upDownEn = '1') then
                    secMSSetInc <= '1';
                    s_nextState <= ST_SECMS;                    
                elsif(btnDown = '1' and upDownEn = '1') then
                    secMSSetDec <= '1';
                    s_nextState <= ST_SECMS;
                elsif(btnSet = '1') then
                    s_nextState <= ST_SECLS;
                else
                    s_nextState <= ST_SECMS;
                end if;
                    
            when ST_SECLS =>
                setFlags(0) <= '1';
                secLSSetInc <= '0';
                secLSSetDec <= '0';
                
                if(btnUp = '1' and upDownEn = '1') then
                    secLSSetInc <= '1';
                    s_nextState <= ST_SECLS;
                elsif(btnDown = '1' and upDownEn = '1') then
                    secLSSetDec <= '1';
                    s_nextState <= ST_SECLS;
                elsif(btnSet = '1') then
                    s_nextState <= ST_STOPPED;
                else
                    s_nextState <= ST_SECLS;
                end if;
             
             when others =>
                s_nextState <= ST_STOPPED;
        end case;
    end process;

end Behavioral;
