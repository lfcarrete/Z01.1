library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity zerador16 is
  port(
        z   : in STD_LOGIC;
	    a   : in STD_LOGIC_VECTOR(15 downto 0);
        y   : out STD_LOGIC_VECTOR(15 downto 0)
      );
end zerador16;

architecture rtl of zerador16 is

begin
  y <= "0000000000000000" when (z = '1') else a;

end architecture;
