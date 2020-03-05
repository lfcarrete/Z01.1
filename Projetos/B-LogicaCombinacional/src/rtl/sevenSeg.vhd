library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0));
end entity;

architecture arch of sevenSeg is
begin
	-- 0: on 1: off
	-- 0=0000
	-- 1=0001
	-- 2=0010
	-- 3=0011
	-- 4=0100
	-- 5=0101
	-- 6=0110
	-- 7=0111
	-- 8=1000
	-- 9=1001
	-- a=1010
	-- b=1011
	-- c=1100
	-- d=1101
	-- e=1110
	-- f=1111

	leds <= not "1111110" when (bcd = "0000") else --0
			not "0110000" when (bcd = "0001") else --1
			not "1101101" when (bcd = "0010") else --2
			not "1111001" when (bcd = "0011") else --3
			not "0110001" when (bcd = "0100") else --4
			not "1011011" when (bcd = "0101") else --5
			not "1011111" when (bcd = "0110") else --6
			not "1110000" when (bcd = "0111") else --7
			not "1111111" when (bcd = "1000") else --8
			not "1111011" when (bcd = "1001") else --9
			not "1111101" when (bcd = "1010") else --a
			not "0011111" when (bcd = "1011") else --b
			not "1001110" when (bcd = "1100") else --c
			not "0111101" when (bcd = "1101") else --d
			not "1001111" when (bcd = "1110") else --e
			not "1000111" when (bcd = "1111"); --f





end architecture;