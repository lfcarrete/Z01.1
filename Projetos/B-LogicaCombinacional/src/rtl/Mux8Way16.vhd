library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity Mux8Way16 is
	port ( 
			a:   in  STD_LOGIC_VECTOR(15 downto 0);
			b:   in  STD_LOGIC_VECTOR(15 downto 0);
			c:   in  STD_LOGIC_VECTOR(15 downto 0);
			d:   in  STD_LOGIC_VECTOR(15 downto 0);
			e:   in  STD_LOGIC_VECTOR(15 downto 0);
			f:   in  STD_LOGIC_VECTOR(15 downto 0);
			g:   in  STD_LOGIC_VECTOR(15 downto 0);
			h:   in  STD_LOGIC_VECTOR(15 downto 0);
			sel: in  STD_LOGIC_VECTOR(2 downto 0);
			q:   out STD_LOGIC_VECTOR(15 downto 0));
end entity;

architecture arch of Mux8Way16 is
begin

	q(15 downto 0) <= a(15 downto 0) when (sel = "000") else
					  b(15 downto 0) when (sel = "001") else
					  c(15 downto 0) when (sel = "010") else
					  d(15 downto 0) when (sel = "011") else
					  e(15 downto 0) when (sel = "100") else
					  f(15 downto 0) when (sel = "101") else
					  g(15 downto 0) when (sel = "110") else
					  h(15 downto 0) when (sel = "111");

end architecture;
