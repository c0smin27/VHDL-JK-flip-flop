library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JKTest is
end JKTest;

architecture Behavioral of JKTest is
component JK is
    Port ( CK : in STD_LOGIC;
           R : in STD_LOGIC;
           J : in STD_LOGIC;
           K : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qn : out STD_LOGIC);
end component JK;

signal CLK, RST, J, K: std_logic;
signal Qout, Qoutn: std_logic;

begin
UUT: JK port map ( CK=>CLK, R=>RST, J=>J, K=>K, Q=>Qout, Qn=>Qoutn);

generate_CLK: process
begin
CLK<='0'; wait for 1ns;
CLK<='1'; wait for 1ns;
end process;

generate_rst: process
begin
RST<='1'; wait for 1ns;
RST<='0'; wait;
end process;

generate_J: process
begin
J<='0'; wait for 4ns;
J<='1'; wait for 4ns;
end process;

generate_K: process
begin
K<='0'; wait for 2ns;
K<='1'; wait for 2ns;
end process;

end Behavioral;
