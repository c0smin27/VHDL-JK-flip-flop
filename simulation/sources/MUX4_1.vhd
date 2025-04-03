library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4_1 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           I2 : in STD_LOGIC;
           I3 : in STD_LOGIC;
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           Y : out STD_LOGIC);
end MUX4_1;

architecture Behavioral of MUX4_1 is

signal a: std_logic_vector(1 downto 0);

begin
a <= A1 & A0;
with a select
Y <= I0 when "00", I1 when "01", I2 when "10", I3 when "11", I0 when others;

end Behavioral;
