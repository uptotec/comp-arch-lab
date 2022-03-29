library ieee;
use ieee.std_logic_1164.all;

entity or_2 is 
	port(
 	a, b: in std_logic;
	y: out std_logic );
end or_2;

architecture rtl of or_2 is
begin process(a, b)
begin
 y <= a or b;
end process;
end rtl;