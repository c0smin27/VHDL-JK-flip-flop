library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity AutomatJK is
    Port ( R : in std_logic;
           CLK : in std_logic;
           Q : out std_logic_vector(2 downto 0));
end AutomatJK;

architecture Behavioral of AutomatJK is

component MUX4_1 is
    Port ( I0 : in STD_LOGIC;
           I1 : in STD_LOGIC;
           I2 : in STD_LOGIC;
           I3 : in STD_LOGIC;
           A0 : in STD_LOGIC;
           A1 : in STD_LOGIC;
           Y : out STD_LOGIC);
end component MUX4_1;

component JK is
    Port ( CK : in STD_LOGIC;
           R : in STD_LOGIC;
           J : in STD_LOGIC;
           K : in STD_LOGIC;
           Q : out STD_LOGIC;
           Qn : out STD_LOGIC);
end component JK;

signal net: std_logic_vector(2 downto 0);
signal Qint: std_logic_vector(2 downto 0);
signal Q0_neg, Q1_neg, Q2_neg: std_logic;

begin
U1: JK port map ( CK=>CLK, R=>R, J=>net(0), K=>net(0), Q=>Qint(0), Qn=>Q0_neg );
U2: JK port map ( CK=>CLK, R=>R, J=>net(1), K=>net(1), Q=>Qint(1), Qn=>Q1_neg );
U3: JK port map ( CK=>CLK, R=>R, J=>net(2), K=>net(2), Q=>Qint(2), Qn=>Q2_neg );
Q0_neg <= not Qint(0);
Q1_neg <= not Qint(1);
Q2_neg <= not Qint(2);
U4: MUX4_1 port map ( I0=>'1', I1=>Q0_neg, I2=>Q0_neg, I3=>'0', A1=>Qint(2), A0=>Qint(1), Y=>net(0) );
U5: MUX4_1 port map ( I0=>'1', I1=>'1', I2=>'1', I3=>'0', A1=>Qint(2), A0=>Qint(1), Y=>net(1) );
U6: MUX4_1 port map ( I0=>'1', I1=>Q0_neg, I2=>Q0_neg, I3=>'1', A1=>Qint(2), A0=>Qint(1), Y=>net(2) );

Q <= Qint;

end Behavioral;
