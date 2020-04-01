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
<<<<<<< HEAD
  y <= "0000000000000000" when (z = '1') else a;
=======
  
  y <= "0000000000000000" when z = '1' else 
  a;
>>>>>>> 34f8135778a3221722084b181ff68db2d2357ee7

end architecture;
