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
signal outQ0, outQ1, outQ2 : STD_LOGIC;
signal outNotQ0, outNotQ1, outNotQ2 : STD_LOGIC;


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
		q => outQ0,
		notq => outNotQ0
	);

	fft1: FlipFlopT port map (
		clock => clock,
		t => '1',
		q => outQ1,
		notq => outNotQ1
	);

	fft2: FLipFLopT port map (
		clock => clock,
		t => '1',
		q => outQ2,
		notq => outNotQ2
	);

	q <= outQ0 & outQ1 & outQ2;


end architecture;
