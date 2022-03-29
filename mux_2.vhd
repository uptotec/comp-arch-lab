library ieee;
use ieee.std_logic_1164.all;
entity mux_2 is 
port (a,b,sel: in std_logic; 
	y: out std_logic);
end mux_2;

architecture rtl of mux_2 is
begin 
process (a,b,sel)
begin 
case sel is 
when '0' => y <= a ;
when others => y <= b ;
end case;
end process ;
end rtl;
