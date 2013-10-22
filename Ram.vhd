----------------------------------------------------------------------------------
-- School: University of New Mexico 
-- Engineer: Javier Chavez
-- 
-- Create Date:    10/21/2013
-- Module Name:    RAM - Behavioral 
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

entity Ram is
    Port ( reset : in  STD_LOGIC;
           D_in : in  STD_LOGIC_VECTOR (3 downto 0);
           clock : in  STD_LOGIC;
           address : in  STD_LOGIC_VECTOR (2 downto 0);
           wr_rd : in  STD_LOGIC;
           an : out  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
end Ram;


architecture Behavioral of Ram is

component MUX is
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
end component;

component decoder is
    Port ( address : in  STD_LOGIC_VECTOR (2 downto 0);
           E : in  STD_LOGIC;
           reg_out : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component decoder_HEX is
    Port ( h_dec_in : in  STD_LOGIC_VECTOR (3 downto 0);
           seg : out  STD_LOGIC_VECTOR (7 downto 0));
end component;

component four_bit_reg is
    Port ( E : in  STD_LOGIC;
           D : in  STD_LOGIC_VECTOR (3 downto 0);
           clock : in  STD_LOGIC;
           reset : in STD_LOGIC;
           Q : out  STD_LOGIC_VECTOR (3 downto 0));
end component;

signal t : STD_LOGIC_VECTOR (7 downto 0);
signal mout : STD_LOGIC_VECTOR (3 downto 0);
signal Q0,Q1,Q2,Q3,Q4,Q5,Q6,Q7 : STD_LOGIC_VECTOR (3 downto 0);

begin

   -- registers
   reg0: four_bit_reg PORT MAP ( E => t(0), D => D_in, clock => clock, Q => Q0, reset => reset);
   reg1: four_bit_reg PORT MAP ( E => t(1), D => D_in, clock => clock, Q => Q1, reset => reset);
   reg2: four_bit_reg PORT MAP ( E => t(2), D => D_in, clock => clock, Q => Q2, reset => reset);
   reg3: four_bit_reg PORT MAP ( E => t(3), D => D_in, clock => clock, Q => Q3, reset => reset);
   reg4: four_bit_reg PORT MAP ( E => t(4), D => D_in, clock => clock, Q => Q4, reset => reset);
   reg5: four_bit_reg PORT MAP ( E => t(5), D => D_in, clock => clock, Q => Q5, reset => reset);
   reg6: four_bit_reg PORT MAP ( E => t(6), D => D_in, clock => clock, Q => Q6, reset => reset);
   reg7: four_bit_reg PORT MAP ( E => t(7), D => D_in, clock => clock, Q => Q7, reset => reset);

   -- getting data out of specific register *dependent on address*
   m_mux: MUX PORT MAP(
      sel => address,
      I0 =>Q0,
      I1 =>Q1,
      I2 =>Q2,
      I3 =>Q3,
      I4 =>Q4,
      I5 =>Q5,
      I6 =>Q6,
      I7 =>Q7,
      E => wr_rd,
      mux_out => mout
   );
   -- converts saved data into HEX and sends data to seven seg disp
   dechex: decoder_HEX PORT MAP(
      h_dec_in => mout,
      seg => seg
   );
   -- decoder chooses what register to save data *dependent on address*
   dec: decoder PORT MAP(
      address => address,
      E => wr_rd,
      reg_out => t
   );
   -- segment 
   an <="1110";
   
end Behavioral;

