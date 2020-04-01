library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_shift is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_shift is

  component shift is
      port(a:   in  STD_LOGIC_VECTOR(15 downto 0);
           lr:  in  STD_LOGIC;
           q:   out STD_LOGIC_VECTOR(15 downto 0)
         );
  end component;

  signal entrada: STD_LOGIC_VECTOR(15 downto 0);
  signal sel: STD_LOGIC;
  signal saida: STD_LOGIC_VECTOR(15 downto 0);
begin

	mapping: shift port map(
    a => entrada,
    lr => sel,
    q => saida
  );

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

      -- Teste: 1
      entrada <= "0000000000000000"; sel <= '0';
      wait for 200 ps;
      assert(saida= "0000000000000000")  report "Falha em teste: 1" severity error;

      -- Teste: 2
      entrada <= "0000000000000000"; sel <= '1';
      wait for 200 ps;
     assert(saida = "0000000000000000") report "Falha em teste: 2" severity error;

      -- Teste: 3
      entrada <= "1111111111111111"; sel <= '0';
      wait for 200 ps;
      assert(saida = "1111111111111110") report "Falha em teste: 3" severity error;

      -- Teste: 4
      entrada <= "1111111111111111"; sel <= '1';
      wait for 200 ps;
      assert(saida = "0111111111111111") report "Falha em teste: 4" severity error;


    test_runner_cleanup(runner); -- Simulacao acaba aqui
  end process;
end architecture;
