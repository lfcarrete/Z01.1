-- Elementos de Sistemas
-- FlipFlopT.vhd

library ieee;
use ieee.std_logic_1164.all;

entity FlipFlopT is
	port(
		clock:  in std_logic;
		t:      in std_logic;
		q:      out std_logic:= '0';
		notq:   out std_logic:= '1'
	);
end entity;

architecture arch of FlipFlopT is

 component FlipFlopJK is
     port(
		clock:  in std_logic;
		J:      in std_logic;
		K:      in std_logic;
		q:      out std_logic;
		notq:   out std_logic
	);
    end component;

begin

fft: FlipFlopJK port map (
	clock => clock,
	J => t,
	K => t,
	q => q,
	notq => notq
);

end architecture;
