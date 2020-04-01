library ieee;
use ieee.std_logic_1164.all;

library vunit_lib;
context vunit_lib.vunit_context;

entity tb_xor16 is
  generic (runner_cfg : string);
end entity;

architecture tb of tb_xor16 is

  component xor16 is
      port(a:   in  STD_LOGIC_VECTOR(15 downto 0);
           b:   in  STD_LOGIC_VECTOR(15 downto 0);
           q:   out STD_LOGIC_VECTOR(15 downto 0)
         );
  end component;

  signal  inX, inY: STD_LOGIC_VECTOR(15 downto 0);
  signal saida: STD_LOGIC_VECTOR(15 downto 0);
begin

	mapping: xor16 port map(
    a => inX,
    b => inY,
    q => saida
  );

  main : process
  begin
    test_runner_setup(runner, runner_cfg);

      -- Teste: 1
      inX <= "0000000000000000"; inY <= "0000000000000000";
      wait for 200 ps;
      assert(saida= "0000000000000000")  report "Falha em teste: 1" severity error;

      -- Teste: 2
      inX <= "1111111111111111"; inY <= "1111111111111111";
      wait for 200 ps;
     assert(saida = "0000000000000000") report "Falha em teste: 2" severity error;

      -- Teste: 3
      inX <= "0000000000000000"; inY <= "1111111111111111";
      wait for 200 ps;
      assert(saida = "1111111111111111") report "Falha em teste: 3" severity error;

      -- Teste: 4
      inX <= "1111111111111111"; inY <= "0000000000000000";
      wait for 200 ps;
      assert(saida = "1111111111111111") report "Falha em teste: 4" severity error;

      -- Teste: 5
      inX <= "0101101101010100"; inY <= "1110001110101011";
      wait for 200 ps;
      assert(saida = "1011100011111111") report "Falha em teste: 5" severity error;


    test_runner_cleanup(runner); -- Simulacao acaba aqui
  end process;
end architecture;
