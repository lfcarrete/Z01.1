--
-- Elementos de Sistemas - Aula 5 - Logica Combinacional
-- Rafael . Corsi @ insper . edu . br
--
-- Arquivo exemplo para acionar os LEDs e ler os bottoes
-- da placa DE0-CV utilizada no curso de elementos de
-- sistemas do 3s da eng. da computacao

----------------------------
-- Bibliotecas ieee       --
----------------------------
library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use work.all;

----------------------------
-- Entrada e saidas do bloco
----------------------------
entity TopLevel is
	port(
		CLOCK_50										: in  std_logic;
		SW     										: in  std_logic_vector(9 downto 0);
		LEDR   										: out std_logic_vector(9 downto 0);
		KEY0											: in std_logic;
		HEX0, HEX1, HEX2, HEX3, HEX4, HEX5	: out std_logic_vector(0 to 6)
		
	);
end entity;

----------------------------
-- Implementacao do bloco --
----------------------------
architecture rtl of TopLevel is

component binarioToBcd is
    generic(N: positive := 10);
    port(
        clk, reset: in std_logic;
        binary_in: in std_logic_vector(N-1 downto 0);
        bcd0, bcd1, bcd2, bcd3, bcd4: out std_logic_vector(3 downto 0)
		  );
end component;


component sevenSeg is
	port (
			bcd : in  STD_LOGIC_VECTOR(3 downto 0);
			leds: out STD_LOGIC_VECTOR(6 downto 0)
			);
end component;

--------------
-- signals
--------------
signal s1, s2, s3, s4: STD_LOGIC_VECTOR(6 downto 0); -- Hexadecimal output
signal s5, s6, s7, s8: STD_LOGIC_VECTOR(3 downto 0); 
signal dec0, dec1, dec2, dec3, dec4: STD_LOGIC_VECTOR(3 downto 0); -- Decimal output
signal reset_sw, clk_state: STD_LOGIC;
---------------
-- implementacao
---------------
begin

	--LEDR(8) <= SW(8);
	--LEDR(9) <= SW(9);
	
	--HEX0 <= not "1111101";
	
	-- UNDEFINED ENTITY ERROR
	--seg7: sevenSeg port map(
	--	bcd => SW(3 downto 0),
	--	leds => HEX0
	--);
	
	
			
	s3 <= not "1111110" when (SW(9 downto 8) = "00") else --0
			not "0110000" when (SW(9 downto 8) = "01") else --1
			not "1101101" when (SW(9 downto 8) = "10") else --2
			not "1111001" when (SW(9 downto 8) = "11"); --3
			
	s4 <= not "0000000"; --0
	
	
	reset_sw <= '1';
	clk_state <= '1';

	bcd_out: binarioToBcd port map(
		clk => CLOCK_50,
		reset => '0',
      	binary_in => SW(9 downto 0),
      	bcd0 => dec0,
		bcd1 => dec1,
		bcd2 => dec2,
		bcd3 => dec3,
		bcd4 => dec4

	);
	
	seg7_0: sevenSeg port map(
		bcd => dec0,
		leds => HEX0
	);
	
	seg7_1: sevenSeg port map(
		bcd => dec1,
		leds => HEX1
	);
	
	seg7_2: sevenSeg port map(
		bcd => dec2,
		leds => HEX2
	);
	
	seg7_3: sevenSeg port map(
		bcd => dec3,
		leds => HEX3
	);

	HEX4 <= s4;
	HEX5 <= s4;
	
	
end rtl;
