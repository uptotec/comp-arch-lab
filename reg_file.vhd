library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity register_file is 
port(clk , wr : in std_logic ; 
read_reg1, read_reg2 , write_reg:in  std_logic_vector(3 downto 0);
write_data : in std_logic_vector(31 downto 0);
data_one,data_two :out  std_logic_vector(31 downto 0));
END register_file ;

architecture rtl of register_file is
type ram_type is array (0 to 15) of std_logic_vector(31 downto 0);
signal reg_bank:ram_type ;

begin 
process(clk)
begin 
if (rising_edge(clk)) then 
if (wr='1') then 
reg_bank(conv_integer(unsigned(write_reg))) <= write_data;
end if ;
end if ;
end process ;
data_one<= reg_bank(conv_integer(unsigned(read_reg1)));
data_two<= reg_bank(conv_integer(unsigned(read_reg2)));
end rtl ;