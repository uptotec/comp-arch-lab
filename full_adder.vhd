library ieee;
use ieee.std_logic_1164.all;
entity full_adder is 
port(
a,b,cin: in std_logic;
sum,cout: out std_logic);
end full_adder;
architecture rtl of full_adder is 
begin
process(a,b,cin)
begin
sum<= a xor b xor cin;
cout<=  (a and cin) or (b and cin) or(a and b);
end process;
end rtl;