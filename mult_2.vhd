library ieee;
use ieee.std_logic_1164.all;

entity mult_2 is
port( a , b, sel: in std_logic;
      y: out std_logic);
end mult_2;


architecture rtl of mult_2 is
begin 
process (sel , a, b)
begin 
case sel is 
when '0' => y <= a;
when others => y <= b;
end case;
end process;
end rtl;
