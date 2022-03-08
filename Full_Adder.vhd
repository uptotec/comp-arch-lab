library ieee;
use ieee.std_logic_1164.all;

entity Full_Adder is
port( a , b, cin: in std_logic;
     sum , cout: out std_logic);
end  Full_Adder ;

architecture rtl of  Full_Adder  is
begin 
process (a , b, cin)
begin 
sum <= a xor b xor cin;
cout <= (a and cin) or (b and cin) or (a and b);
end process;
end rtl;
