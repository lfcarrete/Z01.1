-- Elementos de Sistemas
-- by Luciano Soares
-- HalfAdder.vhd

-- Implementa Half Adder

Library ieee;
use ieee.std_logic_1164.all;

entity HalfAdder is
	port(
		a,b:         in STD_LOGIC;   -- entradas
		soma,vaium: out STD_LOGIC   -- sum e carry
	);
end entity;

architecture rtl of HalfAdder is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

begin
<<<<<<< HEAD
  
  soma <= (a and not(b)) or (not(a) and b);
=======
  -- Implementação vem aqui!
  soma <= a xor b;
>>>>>>> 34f8135778a3221722084b181ff68db2d2357ee7
  vaium <= a and b;

end architecture;
