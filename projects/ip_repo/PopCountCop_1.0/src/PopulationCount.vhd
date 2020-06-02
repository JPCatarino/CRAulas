library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PopulationCount is
  generic(N    : positive := 4);
  port(dataIn  : in  std_logic_vector(N-1 downto 0);
       cntOut  : out std_logic_vector(N-1 downto 0));
end PopulationCount;

architecture Behavioral of PopulationCount is
begin
    process(dataIn)
        variable s_counter : unsigned(N-1 downto 0);

    begin
        s_counter := (others => '0');
        for i in 0 to (N - 1) loop
            next when dataIn(i) = '0';
            s_counter := s_counter + 1;
        end loop;
        cntOut <= std_logic_vector(s_counter);  
    end process;
end Behavioral;
