library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity impressora is
	port (
    SW1,SW2,SW3,SW4 : in  STD_LOGIC;
    x : out STD_LOGIC );
    signal e : std_logic;
    signal l : std_logic;
   
end entity;

architecture arch of impressora is

begin

	e <= SW3 and (SW1 or SW2 or SW4);
	l <= SW2 and (SW1 or SW4);
	x <= e or l;


end architecture;
