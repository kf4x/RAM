----------------------------------------------------------------------------------
-- School: University of New Mexico 
-- Engineer: Javier Chavez
-- 
-- Create Date:    10/21/2013
-- Module Name:    decoder - Behavioral 
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

entity decoder is
    Port ( address : in  STD_LOGIC_VECTOR (2 downto 0);
           E : in  STD_LOGIC;
           reg_out : out  STD_LOGIC_VECTOR (7 downto 0));
end decoder;

architecture Behavioral of decoder is

begin
reg_out <=   "00000001" when address="000" and E='1' else
             "00000010" when address="001" and E='1' else
             "00000100" when address="010" and E='1' else
             "00001000" when address="011" and E='1' else
             "00010000" when address="100" and E='1' else
             "00100000" when address="101" and E='1' else
             "01000000" when address="110" and E='1' else
             "10000000" when address="111" and E='1' else
             "00000000";
             

end Behavioral;

