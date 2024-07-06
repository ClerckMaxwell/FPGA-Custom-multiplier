----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.01.2024 19:07:07
-- Design Name: 
-- Module Name: A1 - Behavioral
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

--Questo design implementa una somma del tipo a + leftshift di a. Equivale a fare 3*a.
--FUNZIONANTE

entity A1 is
Port(a : in std_logic_vector(3 downto 0);
s : out std_logic_vector(7 downto 0));
end A1;

architecture Behavioral of A1 is
signal c0,c1,c2,c3 : std_logic; 

-- A detailed explaination of the logic down below is in Raffaele's notebook
begin

c0 <= a(1) and a(0);
c1 <= a(1) and (a(2) or a(0));
c2 <= (a(3) and a(2)) or  (c1 and (a(3) or  a(2)));
c3 <= (a(3) and a(2)) or (c1 and a(3));
s(0) <= a(0);
s(1) <= a(1) xor a(0);
s(2) <= a(2) xor a(1) xor c0;
s(3) <= a(3) xor a(2) xor c1;
s(4) <= a(3) xor c2;
s(5) <= c3;
s(6)<= '0';
s(7)<= '0';
end Behavioral;
