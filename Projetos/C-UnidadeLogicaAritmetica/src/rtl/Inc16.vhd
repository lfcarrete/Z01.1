library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Inc16 is
	port(
		a   :  in STD_LOGIC_VECTOR(15 downto 0);
		q   : out STD_LOGIC_VECTOR(15 downto 0)
	);
end entity;

architecture rtl of Inc16 is

  component Add16 is
    port(
      a   :  in STD_LOGIC_VECTOR(15 downto 0);
      b   :  in STD_LOGIC_VECTOR(15 downto 0);
      q   : out STD_LOGIC_VECTOR(15 downto 0)
      );
  end component;

begin
  add_1: Add16 port map(
    a => a,
    b => "0000000000000001",
    q => q
  );


end architecture;
