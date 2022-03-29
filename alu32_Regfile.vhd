library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity alu32_Regfile is
    port(a, b: in std_logic_vector (31 downto 0);
    ainv, binv, cin: in std_logic;
    op: in std_logic_vector (1 downto 0);
    result: out std_logic_vector (31 downto 0);
    cout: out std_logic;
    clk , wr : in std_logic ; 
    read_reg1, read_reg2 , write_reg:in  std_logic_vector(3 downto 0);
    write_data : in std_logic_vector(31 downto 0));

end alu32_Regfile;

architecture rtl of alu32_Regfile is

component alu_32bit
port(a, b: in std_logic_vector (31 downto 0);
ainv, binv, cin: in std_logic;
op: in std_logic_vector (1 downto 0);
result: out std_logic_vector (31 downto 0);
cout: out std_logic);
end component;

component register_file
port(clk , wr : in std_logic ; 
read_reg1, read_reg2 , write_reg:in  std_logic_vector(3 downto 0);
write_data : in std_logic_vector(31 downto 0);
data_one,data_two :out  std_logic_vector(31 downto 0));
end component;

signal busA, busB, busRes: std_logic_vector(31 downto 0);
begin
    c1: alu_32bit port map (busA, busB, ainv, binv, cin, op, result, cout);
    c2: alu_32bit port map (busA, busB, ainv, binv, cin, op, busRes, cout);
    c3: register_file port map (clk, wr, read_reg1, read_reg2, write_reg, busRes, busA, busB);
end rtl;
