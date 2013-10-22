----------------------------------------------------------------------------------
-- School: University of New Mexico 
-- Engineer: Javier Chavez
-- 
-- Create Date:    10/21/2013
-- Module Name:    four_bit_reg - Behavioral 
-- Project Name: Random Access Emulator
-- Target Devices: Nexys 3
-- Description: This is extra creadit for ECE238
--
-- Revision 0.01 - File Created
-- Additional Comments: 
-- this register has an enabler and uses clock high
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity four_bit_reg is
    Port ( E : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           clock : in  STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end four_bit_reg;

architecture Behavioral of four_bit_reg is

begin

   process(reset,clock,e)
   
   begin
      --reset
      if(reset= '1') then
         Q <="0000";
      -- Enabler!
      elsif(rising_edge(clock) and E='1') then
         Q <= D;
      end if;
    end process;
    

end Behavioral;

