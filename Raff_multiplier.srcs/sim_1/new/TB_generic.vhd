library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_ARITH.all;


entity TB_generic is
--  Port ( );
end TB_generic;

architecture Behavioral of TB_generic is

signal a_tb : std_logic_vector (3 downto 0) := (others => '0');
signal b_tb : std_logic_vector (3 downto 0) := (others => '0');
signal s_tb : std_logic_vector (7 downto 0) := (others => '0');
signal clk, rst : std_logic := '0';

constant clk_period : time := 2.2 ns; 

component Pipeline is 
Port(a,b: in std_logic_vector(3 downto 0);
reset, clock: in std_logic;
s: out std_logic_vector(7 downto 0) 
); 
end component;

begin

dut: Pipeline port map (a_tb, b_tb, rst, clk, s_tb);

process
begin
wait for clk_period/2;
clk<= not clk;
end process;

process
begin
rst <= '1';
wait for 100*clk_period;
rst <= '0';
wait for 50*clk_period;
for i in 0 to 15 loop
for j in 0 to 15 loop
a_tb <=conv_std_logic_vector(i,4);
b_tb <=conv_std_logic_vector(j,4);
wait for clk_period;
end loop;
end loop;
wait;
end process;
end Behavioral;
