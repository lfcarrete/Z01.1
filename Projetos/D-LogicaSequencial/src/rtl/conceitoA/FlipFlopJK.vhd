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


begin

	process(clock) begin

	if (rising_edge(CLOCK)) then
	if (J = '0' and K = '0') then
	q<='0';
	elsif (J='1' and K='1')  then
	q<='1';
	elsif  (J='0' and K='1') then
	q<='0';
	else
	q<='1';
	end if; 
	end if;
	end process;
end architecture;
