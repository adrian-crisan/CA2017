----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03/08/2017 08:28:37 PM
-- Design Name: 
-- Module Name: proj1 - Behavioral
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
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity proj1 is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           step : out std_logic_vector(4 downto 0));
end proj1;

architecture Behavioral of proj1 is

    signal cnt  : std_logic_vector(15 downto 0);
    signal q0   : std_logic_vector(4 downto 0);
    signal q1   : std_logic_vector(4 downto 0);
    signal q2   : std_logic_vector(4 downto 0);
    signal en : std_logic_vector(4 downto 0);
    
begin
    process(clk, cnt)
    begin
        if rising_edge(clk) then
            cnt <= cnt + 1;
        end if;
    end process;

    process(clk, cnt, btn)
    begin
        if rising_edge(clk) then
            if cnt = x"FFFF" then
                q0 <= btn;
            end if;
        end if;
    end process;
    
    process(clk, q0)
    begin
        if rising_edge(clk) then
            q1 <= q0;
        end if;
    end process;
    
    process(clk, q1)
    begin
        if rising_edge(clk) then
            q2 <= q1;
        end if;
    end process;
    
    step <= q1 and not q2;


end Behavioral;
