library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity inversor16 is
  port(
        z   : in STD_LOGIC;
        a   : in STD_LOGIC_VECTOR(15 downto 0);
        y   : out STD_LOGIC_VECTOR(15 downto 0)
      );
end entity;

architecture rtl of inversor16 is

begin

	y <= not(a) when (z = '1') else a;

end architecture;
