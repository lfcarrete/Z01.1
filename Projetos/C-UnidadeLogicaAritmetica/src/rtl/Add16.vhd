-- Soma dois valores de 16 bits
-- ignorando o carry mais significativo

library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Add16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		b   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0);
    carry: out STD_LOGIC
	);
end entity;

architecture rtl of Add16 is
  -- Aqui declaramos sinais (fios auxiliares)
  -- e componentes (outros módulos) que serao
  -- utilizados nesse modulo.

  component FullAdder is
    port(
      a,b,c:      in STD_LOGIC;   -- entradas
      soma, vaium: out STD_LOGIC   -- sum e carry
    );
  end component;

    signal c0, c1, c2, c3, c4, c5, c6, c7, c8, c9, c10, c11, c12, c13, c14, c15: STD_LOGIC;

begin

  bit0: FullAdder port map(
    a => a(0),
    b => b(0),
    c => '0',
    soma => q(0), 
    vaium => c0
  );

  bit1: FullAdder port map(
    a => a(1),
    b => b(1),
    c => c0,
    soma => q(1), 
    vaium => c1
  );

  bit2: FullAdder port map(
    a => a(2),
    b => b(2),
    c => c1,
    soma => q(2),
    vaium => c2
  );

  bit3: FullAdder port map(
    a => a(3),
    b => b(3),
    c => c2,
    soma => q(3),
    vaium => c3
  );
  
  bit4: FullAdder port map(
    a => a(4),
    b => b(4),
    c => c3,
    soma => q(4),
    vaium => c4
  );
  
  bit5: FullAdder port map(
    a => a(5),
    b => b(5),
    c => c4,
    soma => q(5),
    vaium => c5
  );

  bit6: FullAdder port map(
    a => a(6),
    b => b(6),
    c => c5,
    soma => q(6),
    vaium => c6
  );

  bit7: FullAdder port map(
    a => a(7),
    b => b(7),
    c => c6,
    soma => q(7),
    vaium => c7
  );

  bit8: FullAdder port map(
    a => a(8),
    b => b(8),
    c => c7,
    soma => q(8),
    vaium => c8
  );

  bit9: FullAdder port map(
    a => a(9),
    b => b(9),
    c => c8,
    soma => q(9),
    vaium => c9
  );

  bit10: FullAdder port map(
    a => a(10),
    b => b(10),
    c => c9,
    soma => q(10),
    vaium => c10
  );

  bit11: FullAdder port map(
    a => a(11),
    b => b(11),
    c => c10,
    soma => q(11),
    vaium => c11
  );

  bit12: FullAdder port map(
    a => a(12),
    b => b(12),
    c => c11,
    soma => q(12),
    vaium => c12
  );

  bit13: FullAdder port map(
    a => a(13),
    b => b(13),
    c => c12,
    soma => q(13),
    vaium => c13
  );

  bit14: FullAdder port map(
    a => a(14),
    b => b(14),
    c => c13,
    soma => q(14),
    vaium => c14
  );

  bit15: FullAdder port map(
    a => a(15),
    b => b(15),
    c => c14,
    soma => q(15),
    vaium => c15
  );

  carry <= c15;

end architecture;
