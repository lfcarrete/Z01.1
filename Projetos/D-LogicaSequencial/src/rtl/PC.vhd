-- Elementos de Sistemas
-- developed by Luciano Soares
-- file: PC.vhd
-- date: 4/4/2017

-- Contador de 16bits
-- if (reset[t] == 1) out[t+1] = 0
-- else if (load[t] == 1)  out[t+1] = in[t]
-- else if (inc[t] == 1) out[t+1] = out[t] + 1
-- else out[t+1] = out[t]

library ieee;
use ieee.std_logic_1164.all;
use IEEE.NUMERIC_STD.ALL;

entity PC is
    port(
        clock     : in  STD_LOGIC;
        increment : in  STD_LOGIC;
        load      : in  STD_LOGIC;
        reset     : in  STD_LOGIC;
        input     : in  STD_LOGIC_VECTOR(15 downto 0);
        output    : out STD_LOGIC_VECTOR(15 downto 0)
    );
end entity;

architecture arch of PC is

 signal outInc, outLoad : STD_LOGIC_VECTOR(15 downto 0);
 signal muxSelector : STD_LOGIC_VECTOR(1 downto 0);

  component Inc16 is
      port(
          a   :  in STD_LOGIC_VECTOR(15 downto 0);
          q   : out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

  component Mux4Way16 is
        port ( 
            a:   in  STD_LOGIC_VECTOR(15 downto 0);
            b:   in  STD_LOGIC_VECTOR(15 downto 0);
            c:   in  STD_LOGIC_VECTOR(15 downto 0);
            d:   in  STD_LOGIC_VECTOR(15 downto 0);
            sel: in  STD_LOGIC_VECTOR(1 downto 0);
            q:   out STD_LOGIC_VECTOR(15 downto 0)
            );
    end component;


  component Register16 is
      port(
          clock  : in STD_LOGIC;
          input  : in STD_LOGIC_VECTOR(15 downto 0);
          load   : in STD_LOGIC;
          output : out STD_LOGIC_VECTOR(15 downto 0)
        );
    end component;

begin

--    inc: Inc16 port map (
--        a => input,
--        q => outInc
--    );

--    load: Register16 port map (
--        clock => clock,
--        input => input,
--        load => load,
--        output => outLoad
--    );

--    muxout: Mux4Way16 port map ( 
--            a: "0000000000000000",
--            b: outLoad,
--            c: outInc,
--            d: input,
--            sel: muxSelector,
--            q: output
--    );

--    muxSelector <= "00" when (reset = '1') else
--                   "01" when (load = '1') else
--                   "10" when (increment = '1') else
--                   "11";

end architecture;
