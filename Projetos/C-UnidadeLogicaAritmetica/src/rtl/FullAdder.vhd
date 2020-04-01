Library ieee;
use ieee.std_logic_1164.all;

entity FullAdder is
	port(
		a,b,c:      in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end entity;

architecture rtl of FullAdder is
	signal s1, s2, s3, s4: STD_LOGIC;
begin
	
	s1 <= (a and not(b) and not(c));
	s2 <= (not(a) and b and not(c));
	s3 <= (not(a) and not(b) and c);
	s4 <= (a and b and c);

	soma <= (s1) or (s2) or (s3) or (s4);
	vaium <= (a and b) or (b and c) or (a and c);

end architecture;
