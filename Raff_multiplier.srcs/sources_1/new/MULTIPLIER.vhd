library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_ARITH.all;
use IEEE.NUMERIC_STD.ALL;
 
entity MULTIPLIER is 
Port(a,b: in std_logic_vector(3 downto 0);
s: out std_logic_vector(7 downto 0) 
); 
end MULTIPLIER; 


architecture Behavioral of MULTIPLIER is

component A1 is --times 3
Port(a : in std_logic_vector(3 downto 0);
s : out std_logic_vector(7 downto 0));
end component;

component A2 is --times 5
Port(a : in std_logic_vector(3 downto 0);
s : out std_logic_vector(7 downto 0));
end component;

component A3 is -- times 9
Port(a : in std_logic_vector(3 downto 0);
s : out std_logic_vector(7 downto 0));
end component;

component A7 is --times 7
Port(a : in std_logic_vector(3 downto 0);
s : out std_logic_vector(7 downto 0));
end component;

component ADDER8 is 
port ( A,B : in std_logic_vector (7 downto 0); 
Cin : in std_logic; 
Sum : out std_logic_vector (8 downto 0)); 
end component;

signal s_1,s_2,s_3,s_7,a8,s1_4,s7_1,a8_1: std_logic_vector(7 downto 0);
signal sum1, sum2, sum3 : std_logic_vector(8 downto 0);

begin 

times_three: A1 port map (a, s_1);
times_five: A2 port map(a,s_2);
times_seven: A7 port map (a, s_7);
times_nine: A3 port map (a, s_3);

a8<="0000"&a;
a8_1<="000"&a&'0';
s1_4<=s_1(5 downto 0) &"00";
s7_1<=s_7(6 downto 0) &'0';
First: ADDER8 port map(s_3, a8_1,'0',sum1);
second:ADDER8 port map(s1_4, a8,'0',sum2);
third: ADDER8 port map(s7_1, a8,'0',sum3);
 
with b select
   s <= "0000"&a  when "0001",

      "000"&a&'0' when "0010",

    s_1 when "0011",
    
    "00"&a&"00" when "0100",
    
     s_2 when "0101",
    
     s_1(6 downto 0) &'0' when "0110",
    
    s_7 when "0111",
    
    '0'&a&"000" when "1000",
    
    s_3 when "1001",

    s_2(6 downto 0)&'0' when "1010",
    
    sum1(7 downto 0) when "1011",
    
    s_1(5 downto 0) &"00" when "1100",
    
     sum2(7 downto 0) when "1101",
    
    s_7(6 downto 0) &'0' when "1110",
    
     sum3(7 downto 0) when "1111",
    
    (others=>'0') when others;
    
end Behavioral;