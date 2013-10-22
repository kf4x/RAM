--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:05:10 10/22/2013
-- Design Name:   
-- Module Name:   C:/Users/javierAle/Xilinx/RAM_Emulator/tb_ram.vhd
-- Project Name:  RAM_Emulator
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Ram
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY tb_ram IS
END tb_ram;
 
ARCHITECTURE behavior OF tb_ram IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT Ram
    PORT(
         reset : IN  std_logic;
         D_in : IN  std_logic_vector(3 downto 0);
         clock : IN  std_logic;
         address : IN  std_logic_vector(2 downto 0);
         wr_rd : IN  std_logic;
         an : OUT  std_logic_vector(3 downto 0);
         seg : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal reset : std_logic := '0';
   signal D_in : std_logic_vector(3 downto 0) := (others => '0');
   signal clock : std_logic := '0';
   signal address : std_logic_vector(2 downto 0) := (others => '0');
   signal wr_rd : std_logic := '0';

 	--Outputs
   signal an : std_logic_vector(3 downto 0);
   signal seg : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clock_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Ram PORT MAP (
          reset => reset,
          D_in => D_in,
          clock => clock,
          address => address,
          wr_rd => wr_rd,
          an => an,
          seg => seg
        );

   -- Clock process definitions
   clock_process :process
   begin
		clock <= '0';
		wait for clock_period/2;
		clock <= '1';
		wait for clock_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      
      --Frist write
      wait for clock_period*10;
      wr_rd <= '1';
      address <= "101";
      D_in <= "1010";
      --First Read
      wait for clock_period*10;
      wr_rd <= '0';
      address <= "101";
      
      --Second write
      wait for clock_period*10;
      wr_rd <= '1';
      address <= "001";
      D_in <= "1111";
      --Second Read
      wait for clock_period*10;
      wr_rd <= '0';
      address <= "001";
      
      --Test reset
      wait for clock_period*10;
      reset <='1';

      wait;
   end process;

END;
