library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Pipeline is
Port(a,b: in std_logic_vector(3 downto 0);
reset, clock: in std_logic;
s: out std_logic_vector(7 downto 0) 
); 
end Pipeline;

architecture Behavioral of Pipeline is
signal a_p, b_p : std_logic_vector(3 downto 0);
signal s_p : std_logic_vector(7 downto 0);

component MULTIPLIER is 
Port(a,b: in std_logic_vector(3 downto 0);
s: out std_logic_vector(7 downto 0) 
); 
end component;

begin

X: MULTIPLIER port map (a_p, b_p, s_p);

process(clock,reset)
begin
if(reset= '1') then
s<= (others=>'0');
elsif(rising_edge(clock)) then
a_p <= a;
b_p <= b;
s<=s_p;
end if;

end process;




end Behavioral;
