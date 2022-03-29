library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;

entity data_memory is
    port(clk: in std_logic;
        mem_access_addr: in std_logic_vector(31 downto 0);
        memWrite, memRead: in std_logic;
        writeData: in std_logic_vector(31 downto 0);
        readData: out std_logic_vector(31 downto 0));
end data_memory;

architecture rtl of data_memory is
    signal addr: std_logic_vector(3 downto 0);
    type ram_type is array(0 to 15) of std_logic_vector(31 downto 0);
    signal dm: ram_type;
    begin
        addr <= mem_access_addr(3 downto 0);
        process(clk) begin
            if(rising_edge(clk)) then
                if(memWrite = '1') then
                    dm(conv_integer(unsigned(addr))) <= writeData;
                end if;
            end if;
        end process;
    readData <= dm(conv_integer(unsigned(addr))) when (memRead = '1');
end rtl;
    