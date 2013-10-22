----------------------------------------------------------------------------------
-- School: University of New Mexico 
-- Engineer: Javier Chavez
-- 
-- Create Date:    10/21/2013
-- Module Name:    decoder_HEX - Behavioral 
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


entity decoder_HEX is
    Port ( h_dec_in : in  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
end decoder_HEX;

architecture Behavioral of decoder_HEX is

begin

   -- seg(7) is the decimal point
   seg<=  "11000000" when h_dec_in="0000" else   
          "11111001" when h_dec_in="0001" else
          "10100100" when h_dec_in="0010" else
          "10110000" when h_dec_in="0011" else
          "10011001" when h_dec_in="0100" else
          "10010010" when h_dec_in="0101" else
          "10000010" when h_dec_in="0110" else
          "11111000" when h_dec_in="0111" else
          "10000000" when h_dec_in="1000" else
          "10010000" when h_dec_in="1001" else
          "10001000" when h_dec_in="1010" else
          "10000011" when h_dec_in="1011" else
          "11000110" when h_dec_in="1100" else
          "10100001" when h_dec_in="1101" else
          "10000110" when h_dec_in="1110" else
          "10001110" when h_dec_in="1111" else
          "10000000";
       
end Behavioral;

