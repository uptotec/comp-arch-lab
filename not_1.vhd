library ieee;
use ieee.std_logic_1164.all;

entity not_1 is 
port(
 a,b: in std_logic;
  y: out std_logic );
end not_1;

architecture rtl of not_1 is
begin
process (a)
begin
y <= not a;
end process;
end rtl;