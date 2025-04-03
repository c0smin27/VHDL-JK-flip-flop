library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity SimulareAutomatJK is
end SimulareAutomatJK;

architecture Behavioral of SimulareAutomatJK is

component AutomatJK is
    Port ( R : in std_logic;
           CLK : in std_logic;
           Q : out std_logic_vector(2 downto 0));
end component AutomatJK;

signal R,CLK: std_logic;
signal Q: std_logic_vector(2 downto 0);

begin
UTT: AutomatJK port map ( R=>R, CLK=>CLK, Q=>Q );
R<='1' after 0ns, '0' after 10ns;
process
begin
CLK<='0'; wait for 5ns;
CLK<='1'; wait for 5ns;
end process;

end Behavioral;
