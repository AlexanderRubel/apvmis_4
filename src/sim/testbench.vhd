----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2023 22:30:18
-- Design Name: 
-- Module Name: testbench - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity testbench is
--  Port ( );
end testbench;

architecture Behavioral of testbench is
  component design_1_wrapper is
    port (
      dipswitch : in STD_LOGIC_VECTOR ( 3 downto 0 );
      ledsboard : out STD_LOGIC_VECTOR ( 3 downto 0 );
      ledsmain : out STD_LOGIC_VECTOR ( 3 downto 0 );
      pushbuttons : in STD_LOGIC_VECTOR ( 4 downto 0 );
      reset : in STD_LOGIC;
      sysclk_n : in STD_LOGIC;
      sysclk_p : in STD_LOGIC
    );
  end component;
begin


end Behavioral;
