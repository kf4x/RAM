----------------------------------------------------------------------------------
-- School: University of New Mexico 
-- Engineer: Javier Chavez
-- 
-- Create Date:    10/21/2013
-- Module Name:    MUX - Behavioral 
-- Project Name: Random Access Emulator
-- Target Devices: Nexys 3
-- Description: This is extra creadit for ECE238
--
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;



entity MUX is
    Port ( sel : in  STD_LOGIC_VECTOR (2 downto 0);
           I0 : in  STD_LOGIC_VECTOR (3 downto 0);
           I1 : in  STD_LOGIC_VECTOR (3 downto 0);
           I2 : in  STD_LOGIC_VECTOR (3 downto 0);
           I3 : in  STD_LOGIC_VECTOR (3 downto 0);
           I4 : in  STD_LOGIC_VECTOR (3 downto 0);
           I5 : in  STD_LOGIC_VECTOR (3 downto 0);
           I6 : in  STD_LOGIC_VECTOR (3 downto 0);
           I7 : in  STD_LOGIC_VECTOR (3 downto 0);
           E : in  STD_LOGIC;
           mux_out : out  STD_LOGIC_VECTOR (3 downto 0));
end MUX;

architecture Behavioral of MUX is

begin


    mux_out <=  I0 when sel= "000" and E='0' else
                I1 when sel= "001" and E='0' else
                I2 when sel= "010" and E='0' else
                I3 when sel= "011" and E='0' else
                I4 when sel= "100" and E='0' else
                I5 when sel= "101" and E='0' else
                I6 when sel= "110" and E='0' else
                I7 when sel= "111" and E='0' else
                "0000";


end Behavioral;

