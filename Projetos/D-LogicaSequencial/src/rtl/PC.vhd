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

 signal inInc, outInc, outLoad, outReset, outRegister : STD_LOGIC_VECTOR(15 downto 0);

  component Inc16 is
      port(
          a   :  in STD_LOGIC_VECTOR(15 downto 0);
          q   : out STD_LOGIC_VECTOR(15 downto 0)
          );
  end component;

  component Mux16 is
        port ( 
            a:   in  STD_LOGIC_VECTOR(15 downto 0);
            b:   in  STD_LOGIC_VECTOR(15 downto 0);
            sel: in  STD_LOGIC;
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
    outRegister<= input;

    inc: Inc16 port map (
        a => outRegister,
        q => inInc
    );

    muxInc: Mux16 port map (
        a => outRegister,
        b => inInc,
        sel => increment,
        q => outInc
    );

    muxLoad: Mux16 port map (
        a => outInc,
        b => input,
        sel => load,
        q => outLoad
    );

    muxReset: Mux16 port map (
        a => outLoad,
        b => "0000000000000000",
        sel => reset,
        q => outReset
    );

    reg: Register16 port map (
        clock => clock,
        input => outReset,
        load => load,
        output => outRegister
    );

    output <= outRegister;

    

end architecture;
