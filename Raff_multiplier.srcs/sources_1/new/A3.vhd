----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 31.01.2024 20:38:30
-- Design Name: 
-- Module Name: A3 - Behavioral
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

--a+lsx3a = 9*a
--Funzionante

entity A3 is
Port(a : in std_logic_vector(3 downto 0);
s : out std_logic_vector(7 downto 0));
end A3;

architecture Behavioral of A3 is

signal c0,c1,c2 : std_logic;

-- A detailed explaination of the logic down below is in Raffaele's notebook
begin

c0 <= a(3) and a(0);
c1 <= a(3) and a(1) and a(0);
c2 <= a(0) and a(1) and a(2) and a(3);
s(0) <= a(0);
s(1) <= a(1);
s(2) <= a(2);
s(3) <= a(3) xor a(0);
s(4) <= c0 xor a(1);
s(5) <= c1 xor a(2);
s(6) <= c2 xor a(3);
s(7) <= c2;


end Behavioral;
