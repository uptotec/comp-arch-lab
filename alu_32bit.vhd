library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity alu_32bit is 
	port(a, b: in std_logic_vector (31 downto 0);
	ainv, binv, cin: in std_logic;
	op: in std_logic_vector (1 downto 0);
	result: out std_logic_vector (31 downto 0);
	cout: out std_logic);
end alu_32bit;

architecture rtl of alu_32bit is
component alu_1bit is
	port(a, b, ainv, binv, cin : in std_logic;
		op: in std_logic_vector (1 downto 0);
		result, cout: out std_logic);
end component;

signal c: std_logic_vector (30 downto 0);
begin
A1: alu_1bit port map (a(0), b(0), ainv, binv, cin, op, result(0), c(0));
G1: for i in 1 to 30 generate
	ALUs: alu_1bit port map (a(i), b(i), ainv, binv, c(i-1), op, result(i),  c(i));
end generate;
A32: alu_1bit port map (a(31), b(31), ainv, binv, c(30), op, result(31), cout);
end rtl;

