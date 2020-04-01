library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity shift is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			lr:  in  STD_LOGIC;
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch of shift is

signal left, right : STD_LOGIC_VECTOR(15 downto 0);

begin
	-- Left shift:
	left(14 downto 0) <= a(14 downto 0) when (lr = '1');
	left(15) <= '0' when (lr = '1');

	-- Right shift:
	right(15 downto 1) <= a(15 downto 1) when (lr = '0');
	right(0) <= '0' when (lr = '0');

	-- Output selection:
	q <= right when (lr = '0') else left;

end architecture;
