library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity JK is
    Port ( CK : in STD_LOGIC;
           R : in STD_LOGIC;
           J : in STD_LOGIC;
           K : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qn : out STD_LOGIC);
end JK;

architecture Behavioral of JK is

signal input : std_logic_vector(1 downto 0);
signal stare : std_logic;

begin
input <= J&K;
process(CK,R)
begin
if R='1' then stare <= '0';
else
    if falling_edge(CK) then case input is when "00" => stare <= stare;
                                           when "01" => stare <='0';
                                           when "10" => stare <='1';
                                           when "11" => stare <= not stare;
                                           when others => stare <= 'X';
                        end case;
    end if;
end if;
end process;

Q <= stare;
Qn <= not stare;

end Behavioral;
