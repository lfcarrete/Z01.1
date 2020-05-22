library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity MemoryIO is
  port(
    -- Sistema
    CLK_SLOW : in  STD_LOGIC;
    CLK_FAST : in  STD_LOGIC;
    RST      : in  STD_LOGIC;

    -- RAM 16K
    address		: in  STD_LOGIC_VECTOR (14 DOWNTO 0);
    input	  	: in  STD_LOGIC_VECTOR (15 DOWNTO 0);
    load		  : in  STD_LOGIC ;
    output		: out STD_LOGIC_VECTOR (15 DOWNTO 0);

    -- LCD EXTERNAL I/OS
    LCD_CS_N     : out   STD_LOGIC;
    LCD_D        : inout STD_LOGIC_VECTOR(15 downto 0);
    LCD_RD_N     : out   STD_LOGIC;
    LCD_RESET_N  : out   STD_LOGIC;
    LCD_RS       : out   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
    LCD_WR_N     : out   STD_LOGIC;
    LCD_ON       : out   STD_LOGIC := '1';	-- liga e desliga o LCD
    LCD_INIT_OK  : out   STD_LOGIC;

    -- Switches
    SW  : in std_logic_vector(9 downto 0);
    LED : out std_logic_vector(9 downto 0)
  );

end entity;


architecture logic of MemoryIO is

  component Screen is
    port(
      input        : in  STD_LOGIC_VECTOR(15 downto 0);
      load         : in  STD_LOGIC;
      address      : in  STD_LOGIC_VECTOR(13 downto 0);
      LCD_INIT_OK  : out STD_LOGIC;

      -- System
      CLK_FAST : in STD_LOGIC;
      CLK_SLOW : in STD_LOGIC;
      RST 	   : in STD_LOGIC;

      -- LCD external I/OS
      LCD_CS_N     : out   STD_LOGIC;
      LCD_D        : inout STD_LOGIC_VECTOR(15 downto 0);
      LCD_RD_N     : out   STD_LOGIC;
      LCD_RESET_N  : out   STD_LOGIC;
      LCD_RS       : out   STD_LOGIC;	-- (DCx) 0 : reg, 1: command
      LCD_WR_N     : out   STD_LOGIC
    );
  end component;

  component RAM16K is
    port(
      address	: in STD_LOGIC_VECTOR (13 downto 0);
      clock		: in STD_LOGIC  := '1';
      data		: in STD_LOGIC_VECTOR (15 downto 0);
      wren		: in STD_LOGIC ;
      q		    : out STD_LOGIC_VECTOR (15 downto 0)
    );
  end component;

  component Mux4Way16 is
    port(
      sel : in  STD_LOGIC_VECTOR ( 1 downto 0);  -- select input
      a   : in  STD_LOGIC_VECTOR (15 downto 0);  -- inputs
      b   : in  STD_LOGIC_VECTOR (15 downto 0);  -- inputs
      c   : in  STD_LOGIC_VECTOR (15 downto 0);  -- inputs
      d   : in  STD_LOGIC_VECTOR (15 downto 0);  -- inputs
      q   : out STD_LOGIC_VECTOR (15 downto 0)   -- output
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
      clock:   in STD_LOGIC;
      input:   in STD_LOGIC_VECTOR(15 downto 0);
      load:    in STD_LOGIC;
      output: out STD_LOGIC_VECTOR(15 downto 0)
    );
  end component;

  signal load_RAM         : STD_LOGIC := '0';
  signal load_screen     : STD_LOGIC := '0';
  signal load_LED         : STD_LOGIC := '0';
  signal sel_SW           : STD_LOGIC := '0';

  signal SW16             : STD_LOGIC_VECTOR(15 downto 0);
  signal LED16            : STD_LOGIC_VECTOR(15 downto 0);

  signal address_RAM      : STD_LOGIC_VECTOR(14 downto 0);
  signal address_screen   : STD_LOGIC_VECTOR(14 downto 0);

  signal output_RAM       : STD_LOGIC_VECTOR(15 downto 0);
  signal out_reg_LED      : STD_LOGIC_VECTOR(15 downto 0);

  --signal output_display   : STD_LOGIC_VECTOR(15 downto 0);
  --signal mux_sel          : STD_LOGIC_VECTOR( 1 downto 0);
  --signal mux_sel1         : STD_LOGIC;
  --signal mux_sel2         : STD_LOGIC;
  --signal s_key_code       : STD_LOGIC_VECTOR( 6 downto 0);
  --signal s_key_new        : STD_LOGIC;

	--signal RST_internal     : STD_LOGIC := '1';

	--signal input_internal   : STD_LOGIC_VECTOR(15 downto 0);
	--signal address_internal : STD_LOGIC_VECTOR(14 downto 0);

	--signal load_screen      : STD_LOGIC := '0';

  signal input_RAM        : STD_LOGIC_VECTOR(15 downto 0);
	signal input_screen     : STD_LOGIC_VECTOR(15 downto 0);
  signal input_LED        : STD_LOGIC_VECTOR(15 downto 0);



begin

  -- Controls LOAD selectors for Display, RAM e LED --

  load_RAM     <= '1' when ( (address >= "000000000000000") and (address <= "011111111111111") and (load = '1') ) else '0'; -- Address from 0 to 16383 (RAM)
  load_screen  <= '1' when ( (address >= "100000000000000") and (address <= "101001010111111") and (load = '1') ) else '0'; -- Address from 16384 to 21183 (LCD)
  load_LED     <= '1' when ( (address = "101001011000000") and (load = '1') ) else '0';                                     -- Address 21184 (LED)
  sel_SW       <= '1' when ( (address = "101001011000001") and (load = '1') ) else '0';                                     -- Address 21185 (SW)


  ---------- SW and LED size compatibility -----------

  LED16(15 downto 10) <= (others => '0');
  LED16( 9 downto 0 ) <= input(9 downto 0);

  SW16(15 downto 10) <= (others => '0');
  SW16( 9 downto  0) <= SW;



  Memory: RAM16K port map (
    address => address(13 downto 0),
    clock   => CLK_FAST,
    data    => input,
    wren    => load_RAM,
    q       => output_RAM
  );

  MuxRAM_SW: Mux16 port map (
    a => SW16,
    b => output_RAM,
    sel => sel_SW,
    q => output
  );


  LED_register: Register16 port map (
    clock => CLK_SLOW,
    input => LED16,
    load  => load_LED,
    output => out_reg_LED
  );

  LED <= out_reg_LED(9 downto 0);


  ScreenLoader: Screen port map (
    RST          => RST,
    CLK_FAST     => CLK_FAST,
    CLK_SLOW     => CLK_SLOW,

    input        => input,
    load         => load_screen,
    address      => address(13 downto 0),
    LCD_INIT_OK  => LCD_INIT_OK,

    LCD_CS_N 	   => LCD_CS_N,
    LCD_D 		   => LCD_D,
    LCD_RD_N 	   => LCD_RD_N,
    LCD_RESET_N  => LCD_RESET_N,
    LCD_RS 	     => LCD_RS,
    LCD_WR_N 	   => LCD_WR_N
  );


end logic;
