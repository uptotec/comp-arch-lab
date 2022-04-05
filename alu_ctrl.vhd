library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity alu_ctrl is
port(
	funct: in std_logic_vector (5 downto 0);
	ALUOp: in std_logic_vector (1 downto 0);
	ALUCtrl: out std_logic_vector (1 downto 0)
);
end alu_ctrl;

architecture rtl of alu_ctrl is
begin
ALUCtrl <= "00" when (ALUOp="10" and funct="100100")
else
"01" when (ALUOp="10" and funct="100101")
else
"10" when (ALUOp="10" and funct="100000");
end rtl;
