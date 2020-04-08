-- Elementos de Sistemas
-- FlipFlopJK.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopJK is
	port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopJK is
	
	signal outAnd1, outAnd2, outNor1, outNor2: STD_LOGIC;


begin
	PROCESS(CLOCK)
		variable TMP: std_logic;
		begin
		if(CLOCK='1' and CLOCK'EVENT) then
		if(J='0' and K='0')then
		TMP:=TMP;
		elsif(J='1' and K='1')then
		TMP:= not TMP;
		elsif(J='0' and K='1')then
		TMP:='0';
		else
		TMP:='1';
		end if;
		end if;
		Q<=TMP;
		Q <=not TMP;
	end PROCESS;

end architecture;
