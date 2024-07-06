----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 01.02.2024 16:04:34
-- Design Name: 
-- Module Name: A7 - Behavioral
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
use IEEE.std_logic_unsigned.all;
use IEEE.std_logic_ARITH.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity A7 is
Port(a : in std_logic_vector(3 downto 0);
s : out std_logic_vector(7 downto 0));
end A7;

--7*A
--FUNZIONANTE

architecture Behavioral of A7 is

signal c0,c1,c2,c3,c4,c5: std_logic;
signal b: std_logic_vector (7 downto 0);

component A2 is
Port(a : in std_logic_vector(3 downto 0);
s : out std_logic_vector(7 downto 0));
end component;

-- A detailed explaination of the logic down below is in Raffaele's notebook
begin

FIVE_TIMES_A: A2 port map (a,b);

c0 <= a(1) and a(0);
c1 <= a(1) and (a(0) or b(2));
c2 <= (c1 and b(3)) or (c1 and a(2)) or (a(2) and b(3));
c3 <= (c2 and b(4)) or (c2 and a(3)) or (b(4) and a(3));
c4 <= c3 and b(5);
c5 <= c4 and b(6);
s(0) <= a(0);
s(1) <= a(1) xor a(0);
s(2) <= c0 xor b(2) xor a(1);
s(3) <= c1 xor b(3) xor a(2);
s(4) <= c2 xor b(4) xor a(3);
s(5) <= c3 xor b(5);
s(6) <= c4 xor b(6);
s(7) <= c5;
end Behavioral;
