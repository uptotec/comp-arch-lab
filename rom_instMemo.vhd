library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity rom_instMemo is 
port (
	pc: in std_logic_vector(31 downto 0);
	data: out std_logic_vector (31 downto 0)
     );
end rom_instMemo;

architecture rtl of rom_instMemo is
signal addr: std_logic_vector (3 downto 0);
type rom_type is array (0 to 15) of std_logic_vector(31 downto 0);

constant rom_content: rom_type :=
(	
	X"0000007F",
	X"00000080",
	X"000000F0",
	X"000000C3",
	X"000000EE",
	X"0000009F",
	X"000000FE",
	X"000000F5",
	X"00000090",
	X"00000080",
	X"00000000",
	X"00000000",
	X"00000000",
	X"00000000",
	X"00000000",
	X"00000000"
);	

begin
addr <=pc (3 downto 0);
data <= rom_content (conv_integer(unsigned(addr))); 
end rtl;