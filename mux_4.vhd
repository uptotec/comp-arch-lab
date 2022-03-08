library ieee;
use ieee.std_logic_1164.all;

entity mux_4 is
port( 
	sel: in std_logic_vector (1 downto 0);
	a , b, c , d: in std_logic;
      y: out std_logic);
end mux_4;


architecture rtl of mux_4 is
begin 
process (sel , a, b , c ,d)
begin 
case sel is 
when "00" => y <= a;
when "01" => y <= b;
when "10" => y <= c;
when others => y <= d;
end case;
end process;
end rtl;