library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity MUX4_1Test is
end MUX4_1Test;

architecture Behavioral of MUX4_1Test is
component MUX4_1 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           I2 : in STD_LOGIC;
           I3 : in STD_LOGIC;
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           Y : out STD_LOGIC);
end component MUX4_1;

signal INA0,INA1,IN0,IN1,IN2,IN3,OUTY: std_logic;
begin
UUT: MUX4_1 port map (I0 => IN0, I1 =>IN1, I2 =>IN2, I3 => IN3, A0 =>INA0, A1 =>INA1, Y =>OUTY);

generate_INA0: process
begin
INA0<='0'; wait for 2ns;
INA0<='1'; wait for 2ns;
end process;

generate_INA1: process
begin
INA1<='0'; wait for 3ns;
INA1<='1'; wait for 3ns;
end process;

generate_IN0: process
begin
IN0<='0'; wait for 4ns;
IN0<='1'; wait for 4ns;
end process;

generate_IN1: process
begin
IN1<='0'; wait for 5ns;
IN1<='1'; wait for 5ns;
end process;

generate_IN2: process
begin
IN2<='0'; wait for 6ns;
IN2<='1'; wait for 6ns;
end process;

generate_IN3: process
begin
IN3<='0'; wait for 7ns;
IN3<='1'; wait for 7ns;
end process;

end Behavioral;
