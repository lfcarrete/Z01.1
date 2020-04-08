-- Elementos de Sistemas
-- CounterDown.vhd

library ieee;
use ieee.std_logic_1164.all;

entity CounterDown is
	port(
		clock:  in std_logic;
		q:      out std_logic_vector(2 downto 0) :=(others => '0')
	);
end entity;

architecture arch of CounterDown is

signal notq : STD_LOGIC_VECTOR(2 downto 0);

	component FlipFlopT is
	    port(
			clock:  in std_logic;
			t:      in std_logic;
			q:      out std_logic;
			notq:   out std_logic
		);
    end component;

begin

fft0: FlipFlopT port map (
	clock => clock,
	t => '1',
	q => q(0),
	notq => notq(0)
);

fft1: FlipFlopT port map (
	clock => notq(0),
	t => '1',
	q => q(1),
	notq => notq(1)
);

fft2: FlipFlopT port map (
	clock => q(1),
	t => '1',
	q => q(2),
	notq => notq(2)
);


end architecture;
