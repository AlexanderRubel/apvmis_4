----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2023 23:17:16
-- Design Name: 
-- Module Name: test - Behavioral
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

entity test is
--  Port ( );
end test;

architecture Behavioral of test is
    component divider is
        generic (
            DIV_VAL : integer := 10000000
        );
        Port ( 
            clk_i     : in  std_logic;
            reset_i   : in  std_logic;
            div_clk_o : out std_logic
        );
    end component;
    signal clk : std_logic := '0';
    signal reset : std_logic;
    signal div_clk : std_logic;
begin
    u_divider: divider 
    generic map (
        DIV_VAL => 10000000
    )
    port map (
        clk_i => clk,
        reset_i => reset,
        div_clk_o => div_clk
    );

    clk <= not clk after 100 ns;

    process begin
        reset <= '1';
        wait for 400 ns;
        reset <= '0';
        wait;
    end process;

end Behavioral;
