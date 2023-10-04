----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.10.2023 20:33:58
-- Design Name: 
-- Module Name: divider - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider is
    generic (
        OUT_FREQ_HZ : integer := 2;
        IN_FREQ_HZ : integer := 5000000
    );
    Port ( 
        clk_i     : in  std_logic;
        reset_i   : in  std_logic;
        div_clk_o : out std_logic
    );
end divider;

architecture Behavioral of divider is
    signal div_clk : std_logic;
    signal counter : unsigned (31 downto 0) := 32x"00000000";
    constant div_value: unsigned(31 downto 0) := (IN_FREQ_HZ / (OUT_FREQ_HZ * 2)) - 1;
begin

    process (all) 
    begin
        if (clk_i'event and clk_i = '1') then
            if (reset_i = '1') then
                div_clk <= '0';
            elsif (counter = div_value) then
                div_clk <= not div_clk;
            end if;
        end if;
    end process;

    process (all)
    begin
        if (clk_i'event and clk_i = '1') then
            if ((reset_i = '1') or (counter = div_value)) then
                counter <= 32x"00000000";
            else
                counter <= counter + 1;
            end if;
        end if;
    end process;

end Behavioral;


-- //parameter (100 MHz / (25 * 2)) - 1 = 1_999_999
-- module divider #(
--     parameter OUT_FREQ_HZ = 25,
--     parameter IN_FREQ_HZ = 100000000
-- )(
--     input clk, //100 Mhz
--     output reg divided_clk // T = 0,04 s // F = 25 Hz
-- );

-- // integer div_value;
-- localparam div_value =(IN_FREQ_HZ / (OUT_FREQ_HZ * 2)) - 1;
-- initial begin
--     divided_clk = 0;
--     // div_value = (IN_FREQ_HZ / (OUT_FREQ_HZ * 2)) - 1;
-- end

-- reg [31:0] counter = 0;

-- always @(posedge clk) begin
--     if (counter == div_value) begin
--         counter <= 0;
--         divided_clk <= ~divided_clk;
--     end
--     else begin
--         counter <= counter + 1;
--     end
-- end

-- endmodule