------------------------------------------------------------------------------------
---- Company: 
---- Engineer: 
---- 
---- Create Date: 03/08/2017 08:36:10 PM
---- Design Name: 
---- Module Name: proj1_test - Behavioral
---- Project Name: 
---- Target Devices: 
---- Tool Versions: 
---- Description: 
---- 
---- Dependencies: 
---- 
---- Revision:
---- Revision 0.01 - File Created
---- Additional Comments:
---- 
------------------------------------------------------------------------------------


--library IEEE;
--use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
--use IEEE.STD_LOGIC_UNSIGNED.ALL;
---- Uncomment the following library declaration if using
---- arithmetic functions with Signed or Unsigned values
----use IEEE.NUMERIC_STD.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx leaf cells in this code.
----library UNISIM;
----use UNISIM.VComponents.all;

--entity proj1_test is
--    Port ( clk : in STD_LOGIC;
--           btn : in STD_LOGIC_VECTOR (4 downto 0);
--           sw : in STD_LOGIC_VECTOR (15 downto 0);
--           led : out STD_LOGIC_VECTOR (15 downto 0);
--           an : out STD_LOGIC_VECTOR (3 downto 0);
--           cat : out STD_LOGIC_VECTOR (6 downto 0);
--           txd : out std_logic);
--end proj1_test;

--architecture Behavioral of proj1_test is

--  component proj1 is
--  Port (  clk : in STD_LOGIC;
--            btn : in STD_LOGIC_VECTOR (4 downto 0);
--            step : out std_logic_vector(4 downto 0));
--  end component;
  
--  component seg7 is
--      Port ( inp : in STD_LOGIC_VECTOR (15 downto 0);
--             clk : in STD_LOGIC;
--             an : out STD_LOGIC_VECTOR (3 downto 0);
--             cat : out STD_LOGIC_VECTOR (6 downto 0));
--  end component;
  
--  signal cnt  : std_logic_vector (15 downto 0);
--  signal en   : std_logic_vector (4 downto 0); 
--  signal res : std_logic_vector (15 downto 0);
-- -- signal a : std_logic_vector (15 downto 0);
-- -- signal b : std_logic_vector(15 downto 0);
-- -- signal c : std_logic_vector (15 downto 0);
  
--  type vec is array(0 to 255) of std_logic_vector(15 downto 0);
--  signal rom: vec := (
--      -- op   rS  rT  rd sa fct
--      --  B"000_011_010_001_0_000",--add RF[1]<-RF[2]+RF[3]   res = 0007  0011+0100=0111 = 7                     
--      --  B"000_100_110_101_0_001",--sub RF[5]<-RF[4]-RF[6]   res = FFFE  0100-0110 = 1110 = (FFF)E            
--      --  B"000_000_010_110_1_010",--sll RF[7]<-RF[2] << sa   res = 0006  0011 << 1 = 0110 = 6            
--      --  B"000_000_010_111_1_011",--srl RF[7]<-RF[2] >> sa   res =  0001  0011 >> 1 = 0001 = 1            
--      --  B"000_010_001_111_0_100",--and RF[7]<-RF[2] and RF[1]    res = 0003    0111 & 0011 = 0011 = 3     
--      --  B"000_100_011_111_0_101",--or  RF[7]<-RF[3] or RF[4]     res = 0005    0100 | 0101 = 0101 = 5            
--      --  B"000_110_010_111_0_110",--nand  RF[7]<-RF[2] nand RF[6]    res = FFFD      0011 nand 0111 = 1100 = (FFF)D
--      --  B"000_010_001_111_0_111",--xor  RF[7]<- RF[1] xor RF[2]     res = 0004      0111 xor 0011 = 0100 = 4
--      --  B"001_001_010_0000001",--addi RF[2]<-RF[1]+1                res = 0008      0111 + 0001 = 1000 = 8               
--      --  B"010_001_011_0000011",--lw RF[3]<-M[RF[1]+S_Ext(1)]                                      
--      --  B"011_000_011_0000011",--sw M[RF[0]+S_Ext(3)]<-RF[3]                                        
--      --  B"100_011_010_0000010",--beq                                            
--      --  B"101_010_100_0000111",--xori RF[4]<-RF[2] xor 7            res = 000F      1000 xor 0111 = 1111 = (000)F                  
--      --  B"110_011_101_0000011",--ori  RF[5]<-RF[6] or 3             res = 0007      0111 or 0011 = 0111 = 7                    
--      --  B"111_0000000000001",--j jump to address 1                  jump to 0000
--      B"000_001_001_001_0_111",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"000_010_010_010_0_111",   --xor
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"000_011_011_011_0_111",   --xor
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"000_111_111_111_0_111",   --xor
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"000_101_101_101_0_111",   --xor
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"001_101_101_0100010",     --addi 34 to RF[5]
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"001_001_001_0000001",     --addi 1 to RF[1]
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"001_010_010_0000001",     --addi 1 to RF[2]
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"000_001_010_011_0_000",   --add, RF[3] <- RF[1] + RF[2]
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"000_111_010_001_0_000",   --add RF[1] <- RF[2] + RF[7] (0)
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"000_111_011_010_0_000",   --add RF[2] <- RF[3] + RF[7] (0)
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"100_101_011_0000010",     --beq RF[3] == RF[5], if eq then jump forward
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"111_0000000001000",       --re iterate
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"000_000_000_000_0_111",   --xor
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"011_000_011_0000000",     --store 34 in memory location 0
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--      B"010_000_110_0000000",     --load to RF[6] 34 
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
--         B"000_000_000_000_0_000",
-- others => x"0000");
 
-- signal rom_data : std_logic_vector (15 downto 0);
 
-- type rvec is array(0 to 15) of std_logic_vector(15 downto 0);
-- signal reg: rvec := (
--    x"0001",
--    x"0002",
--    x"0003",
--    x"0004",
--    x"0005",
--    x"0006",
--    x"0007",
--    x"0008",
-- others => x"0000");
    
-- signal ram: vec:=(
-- x"0009",
-- x"000A",
-- x"000B",
-- x"000C",
-- x"000D",
-- x"000E",
-- x"000F",
-- x"0010",
-- others=>x"0000");
 
-- signal ra1 : std_logic_vector(2 downto 0);
-- signal ra2 : std_logic_vector(2 downto 0);
-- signal wa : std_logic_vector(2 downto 0);
-- signal rd1 : std_logic_vector(15 downto 0);
-- signal rd2 : std_logic_vector(15 downto 0);
-- signal wd : std_logic_vector(15 downto 0);
-- signal ext:std_logic_vector(15 downto 0);
  
-- signal ram_data : std_logic_vector(15 downto 0):=(others=>'0');
-- signal ram_in : std_logic_vector(15 downto 0);
 
--  signal branch_add:std_logic_vector(15 downto 0);
--  signal jmp_add:std_logic_vector(15 downto 0); --:=x"0000";
     
--  signal RegDst,rwrite,jump,alusrc,memread,memwr,memtoreg,branch:std_logic;
--  signal extOp:std_logic:='0';
     
--  signal aluop : std_logic_vector(2 downto 0):="000";
     
--  signal a:std_logic_vector(15 downto 0);
--  signal b:std_logic_vector(15 downto 0);
     
--  signal aluctrl:std_logic_vector(2 downto 0);
--  signal sa:std_logic;
     
--  signal alures:std_logic_vector(15 downto 0);
--  signal ram_out:std_logic_vector(15 downto 0);
--  signal z:std_logic:='0';
  
--  type state_type is(st_idle, st_start, st_bit, st_stop);
--  signal state:state_type:=st_idle;
--  signal rst:std_logic;
--  signal bit_count:std_logic_vector(2 downto 0):="000";
--  signal tx_en:std_logic;
--  signal tx_data:std_logic_vector(7 downto 0);
--  signal aux:std_logic_vector(3 downto 0);
--  signal tx_rdy, tx:std_logic;
--  signal tx_cnt:std_logic_vector(1 downto 0):="00";
--  signal baud_en:std_logic:='0';
--  signal baud_count:std_logic_vector(15 downto 0):=x"0000";
--  signal digit_nr:std_logic_vector(1 downto 0):="00";
  
--  signal if_id:std_logic_vector(31 downto 0);
--  signal id_ex:std_logic_vector(80 downto 0);
--  signal ex_mem:std_logic_vector(55 downto 0);
--  signal mem_wb:std_logic_vector(36 downto 0);
--  signal wa_aux:std_logic_vector(2 downto 0);
--begin

--  proj11: proj1 Port map (clk  => clk, btn  => btn, step => en);
--  p2: seg7 port map(inp => res, clk => clk, an => an, cat => cat);
  
--  txd<=tx;
--  process(digit_nr) 
--  begin
--    case digit_nr is
--        when "00" => aux <= sw(15 downto 12);
--        when "01" => aux <= sw(11 downto 8);
--        when "10" => aux <= sw(7 downto 4);
--        when others => aux <= sw(3 downto 0);
--    end case;
-- end process;
 
-- process (aux)
-- begin
--    case aux is
--        when B"0000" => tx_data <= "00110000";
--        when B"0001" => tx_data <= "00110001";
--        when B"0010" => tx_data <= "00110010";
--        when B"0011" => tx_data <= "00110011";
--        when B"0100" => tx_data <= "00110100"; 
--        when B"0101" => tx_data <= "00110101";
--        when B"0110" => tx_data <= "00110110";
--        when B"0111" => tx_data <= "00110111";
--        when B"1000" => tx_data <= "00111000";
--        when B"1001" => tx_data <= "00111001";
--        when B"1010" => tx_data <= "01000001";
--        when B"1011" => tx_data <= "01000010";
--        when B"1100" => tx_data <= "01000011";
--        when B"1101" => tx_data <= "01000100";
--        when B"1110" => tx_data <= "01000101";
--        when B"1111" => tx_data <= "01000110";
--        when others => tx_data <= "01010000";
--     end case;    
--  end process;
  
--  process (baud_en, tx_en, clk) 
--  begin
--    if (en(2)='1') then
--        state <= st_idle;
--    elsif baud_en='1' then
--        if rising_edge(clk) then
--            case state is
--                when st_idle => if tx_en='1' then
--                                    state <= st_start;
--                                end if;
--                                bit_count <= "000";
--                when st_start => state <= st_bit;
--                when st_bit => if (bit_count<7) then
--                                    state <= st_bit;
--                               elsif bit_count=7 then
--                                    state <= st_stop;
--                               end if;
--                               bit_count <= bit_count + 1;
--                when st_stop => state <= st_idle;
--            end case;
--        end if;
--    end if;
--  end process;
  
--  process (state) 
--  begin
--    case state is 
--        when st_idle => tx <= '1';
--                        tx_rdy <= '1';
--        when st_start => tx <= '0';
--                         tx_rdy <= '0';
--        when st_bit => tx <= tx_data(conv_integer(bit_count));
--                             tx_rdy <= '0';
--        when st_stop => tx <= '1';
--                        tx_rdy <= '0';
--    end case;
--  end process;
  
--   process(clk,tx_rdy)
--     begin
--         if rising_edge(clk) then
--             if tx_cnt = "10" and digit_nr = 3 then
--                 tx_en<='0';
--             elsif en(4) = '1' then
--                 tx_en <= '1';
--             end if;
--         end if;    
--     end process;
     
--     process(clk,tx_rdy)
--     begin
--         if rising_edge(clk) then
--             tx_cnt <= tx_rdy & tx_cnt(1);
--         end if;
--     end process;
     
--     process(tx_cnt,clk)
--     begin
--         if rising_edge(clk) then
--             if(tx_cnt = "10") then
--                 if(digit_nr = "11") then
--                     digit_nr<="00";
--                 else
--                     digit_nr<=digit_nr+1;
--                 end if;
--             end if;
--         end if;   
--     end process;
     
 
-- process (clk)
-- begin
--    if rising_edge(clk) then
--        baud_count <= baud_count + 1;
--        if baud_count = 10416 then
--            baud_en <= '1';
--            baud_count <= x"0000";
--        else
--            baud_en <= '0';
--        end if;
--    end if;
-- end process;
 
--  process(clk, en, cnt) 
--  begin 
--     if en(1) = '1' then
--              cnt<=x"0000";
--          end if;
--          if clk'event and clk = '1' then          
--            if en(3) = '1' then
--              if branch = '1' and z = '1' then
--                  cnt<=cnt + ex_mem(52 downto 37);
--              elsif jump='1' then
--                  cnt<=jmp_add;
--              else
--                  cnt<=cnt+1;
--              end if;
--           end if;
--         end if;
--  end process;
  
--  rom_data <= rom(conv_integer(cnt(7 downto 0)));
  
--  ra1 <= if_id(12 downto 10);
--  ra2 <= if_id(9 downto 7);
--  wa_aux <= id_ex(2 downto 0) when RegDst='0' else id_ex(5 downto 3);
--  rd1<=reg(conv_integer(ra1));
--  rd2<=reg(conv_integer(ra2));
--  wa <= mem_wb(2 downto 0);
--   process(cnt, clk)
--     begin
--         if rising_edge(clk) then
--             if (rwrite and en(3))='1' then
--                 reg(conv_integer(wa))<=wd;
--             end if;
--         end if;           
--  end process;   
--  ram_in<=id_ex(40 downto 25);
--  ram_out<=ram(conv_integer(ex_mem(34 downto 19)));
  
--  process(cnt, clk)
--      begin
--          if rising_edge(clk) then
--              if ex_mem(53)  = '1' then
--                  ram(conv_integer(ex_mem(34 downto 19)))<=ram_in;
--              end if;
--          end if;   
--  end process;
      
--  wd<=mem_wb(34 downto 19) when (mem_wb(36) = '1') else ex_mem(34 downto 19);
      
--  process(if_id)
--       begin
--            case if_id(15 downto 13) is
--                  when "000" => RegDst <='1'; --rtype
--                                rwrite <= '1';
--                                branch<='0';
--                                alusrc<='0';
--                                jump<='0';
--                                memread<='0';
--                                memwr<='0';
--                                memtoreg<='0';
--                                aluop<="000";
--                  when "001" => RegDst <='0'; --addi
--                                rwrite <= '1';
--                                branch<='0';
--                                alusrc<='1';
--                                jump<='0';
--                                memread<='0';
--                                memwr<='0';
--                                memtoreg<='0';
--                                aluop<="001";
--                  when "010" => RegDst <='0'; -- lw
--                               rwrite <= '1';
--                               branch<='0';
--                               alusrc<='1';
--                               jump<='0';
--                               memread<='1';
--                               memwr<='0';
--                               memtoreg<='1';
--                               aluop<="001";
--                  when "011" => RegDst <='0'; -- sw
--                               rwrite <= '0';
--                               branch<='0';
--                               alusrc<='1';
--                               jump<='0';
--                               memread<='0';
--                               memwr<='1';
--                               memtoreg<='0';
--                               aluop<="001";                                                                          
--                   when "100" => RegDst <='0'; -- beq
--                                 rwrite <= '0';
--                                 branch<='1';
--                                 alusrc<='0';
--                                 jump<='0';
--                                 memread<='0';
--                                 memwr<='0';
--                                 memtoreg<='0';
--                                 aluop<="100";
--                   when "101" => RegDst <='0'; --  xori
--                                 rwrite <= '1';
--                                 branch<='0';
--                                 alusrc<='1';
--                                 jump<='0';
--                                 memread<='0';
--                                 memwr<='0';
--                                 memtoreg<='0';
--                                 aluop<="100";
--                  when "110" => RegDst <='0'; -- ori
--                                rwrite <= '1';
--                                branch<='0';
--                                alusrc<='1';
--                                jump<='0';
--                                memread<='0';
--                                memwr<='0';
--                                memtoreg<='0';
--                                aluop<="011";
--                  when others => RegDst <='0'; -- jmp
--                                rwrite <= '0';
--                                branch<='0';
--                                alusrc<='0';
--                                jump<='1';
--                                memread<='0';
--                                memwr<='0';
--                                memtoreg<='0'; 
--             end case;                                                                    
--     end process;
          
--     ext<="100000000"&if_id(6 downto 0) when ExtOp='1' else "000000000"&if_id(6 downto 0);
--     process(sw(15 downto 13))
--         begin
--           case sw(15 downto 13) is
--                when "000" => res <= rom_data;
--                when "001" => res <= cnt;
--                when "010" => res <= rd1;
--                when "011" => res <= rd2;
--                when "100" => res <= ext;
--                when "101" => res <= alures;
--                when "110" => res <= ram_out;
--                when others=> res <= wd; 
--           end case;
--   end process;
   
--   --ALU
--   b<= id_ex(40 downto 25) when (id_ex(73)='0') else id_ex(24 downto 9);
   
--   process(id_ex(2 downto 0), id_ex(76 downto 74))
--      begin
--          case id_ex(76 downto 74) is
--              when "000" => aluctrl <=id_ex(2 downto 0);
--              when "001" => aluctrl <="000";
--              when "100" => aluctrl <="001";
--                            branch_add <= "000000000"&id_ex(6 downto 0);
--              when "011" => aluctrl <="101";
--              when others=> aluctrl <="111";
--           end case;
--      end process;    
  
--  --  b<= rd2 when (alusrc='0') else ext; --MUX ALUSrc
--    a<= id_ex(56 downto 41);
--    sa<=if_id(3);
        
--   process(aluctrl)
--   begin
--        case aluctrl is
--               when "000" => alures <= a+b;
--               when "001" => alures <= a-b;
--                             if alures = x"0000" then
--                                  z<='1';
--                             else z<='0';
--                             end if;
--               when "010" => if sa='1' then alures<= b(14 downto 0) & '0';
--                             else alures<=a;
--                             end if;
--               when "011" => if sa='1' then alures<= '0' & b(15 downto 1);
--                             else alures<=a;
--                             end if;
--               when "100" => alures <= a and b;
--               when "101" => alures <= a or b;
--               when "110" => alures <= a nand b;
--               when others => alures <= a xor b;
--               end case;
--  end process;
        
--  jmp_add<="000"& if_id(12 downto 0);


--  process(clk, en(3)) 
--  begin
--    if rising_edge(clk) and en(3) = '1' then
--        if_id(31 downto 16) <= cnt;
--        if_id(15 downto 0) <= rom_data;
--    end if;
--  end process;  
  
--  process(clk, en(3)) 
--  begin
--    if rising_edge(clk) and en(3) = '1' then
--        id_ex(80) <= memtoreg;
--        id_ex(79) <= rwrite;
--        id_ex(78) <= memwr;
--        id_ex(77) <= branch;
--        id_ex(76 downto 74) <= aluop;
--        id_ex(73) <= alusrc;
--        id_ex(72 downto 57) <= if_id(31 downto 16);
--        id_ex(56 downto 41) <= rd1;
--        id_ex(40 downto 25) <= rd2;
--        id_ex(24 downto 9) <= ext;
--        id_ex(8 downto 6) <= if_id(2 downto 0);
--        id_ex(5 downto 3) <= if_id(9 downto 7);
--        id_ex(2 downto 0) <= if_id(6 downto 4);
--    end if;
--  end process;
  
--  process(clk, en(3))
--  begin
--    if rising_edge(clk) and en(3) = '1' then
--        ex_mem(55 downto 52) <= id_ex(80 downto 77);
--        ex_mem(51 downto 36) <= branch_add;
--        ex_mem(35) <= z;
--        ex_mem(34 downto 19) <= alures;
--        ex_mem(18 downto 3) <= id_ex(40 downto 25);
--        ex_mem(2 downto 0) <= wa_aux;
--    end if;
--  end process;
  
--  process(clk, en(3)) 
--  begin
--    if rising_edge(clk) and en(3) = '1' then
--        mem_wb(36 downto 35) <= ex_mem(55 downto 54);
--        mem_wb(34 downto 19) <= ram_out;
--        mem_wb(18 downto 3) <= ex_mem(34 downto 19);
--        mem_wb(2 downto 0) <= ex_mem(2 downto 0);
--    end if;
--  end process;
  
  
-- -- process(clk, cnt)
-- -- begin
-- --   if rising_edge(clk) then
--  --     if en(3) = '1' then
--   --         reg(conv_integer(wa)) <= wd;
--   --    end if;
--    --   if en(1) = '1' then
--    --        rd1 <= reg(conv_integer(ra1));
--   --         rd2 <= reg(conv_integer(ra2));
-- --      end if;
-- --   end if;   
----  end process;
  
-- -- ram_in <= ram_data(13 downto 0) & "00";
  
-- -- process(cnt, clk)
-- -- begin
--     --   if rising_edge(clk) then
--        --    if en(2) = '1' then
--       --         ram(conv_integer(cnt(7 downto 0))) <= ram_in;
--        --    else 
--       --         ram_data <= ram(conv_integer(cnt(7 downto 0)));
--        --    end if;
--      --  end if;    
-- -- end process;
  
----  process(sw(2 downto 0))
----  begin
-- --   case (sw(2 downto 0)) is
--   --      when "000" => res <= rom_data;
--   --      when "001" => res <= rd1;
--   --      when "010" => res <= rd2;
--   --      when "011" => res <= wd;
--   --      when "100" => res <= ram_data;
--    --     when "101" => res <= ram_in;
--    --     when others => res <= x"0000";
-- --   end case;
----  end process;
  
--  led <= cnt;
  
----  a <= "000000000000" & sw (3 downto 0);
----  b <= "000000000000" & sw (7 downto 4);
----  c <= "00000000" & sw (7 downto 0);
  
----  process(cnt)
----  begin
----    case cnt is
----        when "00" => res <= a + b;
----        when "01" => res <= a - b;
----        when "10" => res <= c(14 downto 0) & "0";
----        when "11" => res <= "0" & c(15 downto 1);   
----    end case;
----  end process;
  
-- -- process(cnt)
-- -- begin
--  --    case cnt(3 downto 0) is
--    --      when "0000"     => led <= x"0001";
--        --  when "0001"     => led <= x"0002";
--      --    when "0010"     => led <= x"0004";
--       --   when "0011"     => led <= x"0008";
--         -- when "0100"     => led <= x"0010";
--  --        when "0101"     => led <= x"0020";
--    --      when "0110"     => led <= x"0040";
--      --    when "0111"     => led <= x"0080";
--        --  when "1000"     => led <= x"0100";
--  --        when "1001"     => led <= x"0200";
--    --      when "1010"     => led <= x"0400";
--      --    when "1011"     => led <= x"0800";
--        --  when "1100"     => led <= x"1000";
--  --        when "1101"     => led <= x"2000";
--    --      when "1110"     => led <= x"4000";
--      --    when others     => led <= x"8000"; 
--  --    end case;
-- -- end process;
  
----  an <= btn(3 downto 0);
----  cat <= (others=>'0');
    
    
--end Behavioral;

-------------------------------

----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
 
-- Create Date: 03/08/2017 08:36:10 PM
-- Design Name: 
-- Module Name: proj1_test - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
 
-- Dependencies: 
 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
 
--------------------------------------------------------------------------------


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

entity proj1_test is
    Port ( clk : in STD_LOGIC;
           btn : in STD_LOGIC_VECTOR (4 downto 0);
           sw : in STD_LOGIC_VECTOR (15 downto 0);
           led : out STD_LOGIC_VECTOR (15 downto 0);
           an : out STD_LOGIC_VECTOR (3 downto 0);
           cat : out STD_LOGIC_VECTOR (6 downto 0);
           txd : out std_logic);
end proj1_test;

architecture Behavioral of proj1_test is

  component proj1 is
  Port (  clk : in STD_LOGIC;
            btn : in STD_LOGIC_VECTOR (4 downto 0);
            step : out std_logic_vector(4 downto 0));
  end component;
  
  component seg7 is
      Port ( inp : in STD_LOGIC_VECTOR (15 downto 0);
             clk : in STD_LOGIC;
             an : out STD_LOGIC_VECTOR (3 downto 0);
             cat : out STD_LOGIC_VECTOR (6 downto 0));
  end component;
  
  signal cnt  : std_logic_vector (15 downto 0);
  signal en   : std_logic_vector (4 downto 0); 
  signal res : std_logic_vector (15 downto 0);
 -- signal a : std_logic_vector (15 downto 0);
 -- signal b : std_logic_vector(15 downto 0);
 -- signal c : std_logic_vector (15 downto 0);
  
  type vec is array(0 to 255) of std_logic_vector(15 downto 0);
  signal rom: vec := (
      -- op   rS  rT  rd sa fct
      --  B"000_011_010_001_0_000",--add RF[1]<-RF[2]+RF[3]   res = 0007  0011+0100=0111 = 7                     
      --  B"000_100_110_101_0_001",--sub RF[5]<-RF[4]-RF[6]   res = FFFE  0100-0110 = 1110 = (FFF)E            
      --  B"000_000_010_110_1_010",--sll RF[7]<-RF[2] << sa   res = 0006  0011 << 1 = 0110 = 6            
      --  B"000_000_010_111_1_011",--srl RF[7]<-RF[2] >> sa   res =  0001  0011 >> 1 = 0001 = 1            
      --  B"000_010_001_111_0_100",--and RF[7]<-RF[2] and RF[1]    res = 0003    0111 & 0011 = 0011 = 3     
      --  B"000_100_011_111_0_101",--or  RF[7]<-RF[3] or RF[4]     res = 0005    0100 | 0101 = 0101 = 5            
      --  B"000_110_010_111_0_110",--nand  RF[7]<-RF[2] nand RF[6]    res = FFFD      0011 nand 0111 = 1100 = (FFF)D
      --  B"000_010_001_111_0_111",--xor  RF[7]<- RF[1] xor RF[2]     res = 0004      0111 xor 0011 = 0100 = 4
      --  B"001_001_010_0000001",--addi RF[2]<-RF[1]+1                res = 0008      0111 + 0001 = 1000 = 8               
      --  B"010_001_011_0000011",--lw RF[3]<-M[RF[1]+S_Ext(1)]                                      
      --  B"011_000_011_0000011",--sw M[RF[0]+S_Ext(3)]<-RF[3]                                        
      --  B"100_011_010_0000010",--beq                                            
      --  B"101_010_100_0000111",--xori RF[4]<-RF[2] xor 7            res = 000F      1000 xor 0111 = 1111 = (000)F                  
      --  B"110_011_101_0000011",--ori  RF[5]<-RF[6] or 3             res = 0007      0111 or 0011 = 0111 = 7                    
      --  B"111_0000000000001",--j jump to address 1                  jump to 0000
      B"000_001_001_001_0_111",   --xor
      B"000_010_010_010_0_111",   --xor
      B"000_011_011_011_0_111",   --xor
      B"000_111_111_111_0_111",   --xor
      B"000_101_101_101_0_111",   --xor
      B"001_101_101_0100010",     --addi 34 to RF[5]
      B"001_001_001_0000001",     --addi 1 to RF[1]
      B"001_010_010_0000001",     --addi 1 to RF[2]
      B"000_001_010_011_0_000",   --add, RF[3] <- RF[1] + RF[2]
      B"000_111_010_001_0_000",   --add RF[1] <- RF[2] + RF[7] (0)
      B"000_111_011_010_0_000",   --add RF[2] <- RF[3] + RF[7] (0)
      B"100_101_011_0000010",     --beq RF[3] == RF[5], if eq then jump forward
      B"111_0000000001000",       --re iterate
      B"000_000_000_000_0_111",   --xor
      B"011_000_011_0000000",     --store 34 in memory location 0
      B"010_000_110_0000000",     --load to RF[6] 34 
 others => x"0000");
 
 signal rom_data : std_logic_vector (15 downto 0);
 
 type rvec is array(0 to 15) of std_logic_vector(15 downto 0);
 signal reg: rvec := (
    x"0001",
    x"0002",
    x"0003",
    x"0004",
    x"0005",
    x"0006",
    x"0007",
    x"0008",
 others => x"0000");
    
 signal ram: vec:=(
 x"0009",
 x"000A",
 x"000B",
 x"000C",
 x"000D",
 x"000E",
 x"000F",
 x"0010",
 others=>x"0000");
 
 signal ra1 : std_logic_vector(2 downto 0);
 signal ra2 : std_logic_vector(2 downto 0);
 signal wa : std_logic_vector(2 downto 0);
 signal rd1 : std_logic_vector(15 downto 0);
 signal rd2 : std_logic_vector(15 downto 0);
 signal wd : std_logic_vector(15 downto 0);
 signal ext:std_logic_vector(15 downto 0);
  
 signal ram_data : std_logic_vector(15 downto 0):=(others=>'0');
 signal ram_in : std_logic_vector(15 downto 0);
 
  signal branch_add:std_logic_vector(15 downto 0);
  signal jmp_add:std_logic_vector(15 downto 0); --:=x"0000";
     
  signal RegDst,rwrite,jump,alusrc,memread,memwr,memtoreg,branch:std_logic;
  signal extOp:std_logic:='0';
     
  signal aluop : std_logic_vector(2 downto 0):="000";
     
  signal a:std_logic_vector(15 downto 0);
  signal b:std_logic_vector(15 downto 0);
     
  signal aluctrl:std_logic_vector(2 downto 0);
  signal sa:std_logic;
     
  signal alures:std_logic_vector(15 downto 0);
  signal ram_out:std_logic_vector(15 downto 0);
  signal z:std_logic:='0';
  
  type state_type is(st_idle, st_start, st_bit, st_stop);
  signal state:state_type:=st_idle;
  signal rst:std_logic;
  signal bit_count:std_logic_vector(2 downto 0):="000";
  signal tx_en:std_logic;
  signal tx_data:std_logic_vector(7 downto 0);
  signal aux:std_logic_vector(3 downto 0);
  signal tx_rdy, tx:std_logic;
  signal tx_cnt:std_logic_vector(1 downto 0):="00";
  signal baud_en:std_logic:='0';
  signal baud_count:std_logic_vector(15 downto 0):=x"0000";
  signal digit_nr:std_logic_vector(1 downto 0):="00";
  
  signal if_id:std_logic_vector(31 downto 0);
  signal id_ex:std_logic_vector(83 downto 0);
  signal ex_mem:std_logic_vector(56 downto 0);
  signal mem_wb:std_logic_vector(37 downto 0);
  
begin

  proj11: proj1 Port map (clk  => clk, btn  => btn, step => en);
  p2: seg7 port map(inp => res, clk => clk, an => an, cat => cat);
  
  txd<=tx;
  process(digit_nr) 
  begin
    case digit_nr is
        when "00" => aux <= sw(15 downto 12);
        when "01" => aux <= sw(11 downto 8);
        when "10" => aux <= sw(7 downto 4);
        when others => aux <= sw(3 downto 0);
    end case;
 end process;
 
 process (aux)
 begin
    case aux is
        when B"0000" => tx_data <= "00110000";
        when B"0001" => tx_data <= "00110001";
        when B"0010" => tx_data <= "00110010";
        when B"0011" => tx_data <= "00110011";
        when B"0100" => tx_data <= "00110100"; 
        when B"0101" => tx_data <= "00110101";
        when B"0110" => tx_data <= "00110110";
        when B"0111" => tx_data <= "00110111";
        when B"1000" => tx_data <= "00111000";
        when B"1001" => tx_data <= "00111001";
        when B"1010" => tx_data <= "01000001";
        when B"1011" => tx_data <= "01000010";
        when B"1100" => tx_data <= "01000011";
        when B"1101" => tx_data <= "01000100";
        when B"1110" => tx_data <= "01000101";
        when B"1111" => tx_data <= "01000110";
        when others => tx_data <= "01010000";
     end case;    
  end process;
  
  process (baud_en, tx_en, clk) 
  begin
    if (en(2)='1') then
        state <= st_idle;
    elsif baud_en='1' then
        if rising_edge(clk) then
            case state is
                when st_idle => if tx_en='1' then
                                    state <= st_start;
                                end if;
                                bit_count <= "000";
                when st_start => state <= st_bit;
                when st_bit => if (bit_count<7) then
                                    state <= st_bit;
                               elsif bit_count=7 then
                                    state <= st_stop;
                               end if;
                               bit_count <= bit_count + 1;
                when st_stop => state <= st_idle;
            end case;
        end if;
    end if;
  end process;
  
  process (state) 
  begin
    case state is 
        when st_idle => tx <= '1';
                        tx_rdy <= '1';
        when st_start => tx <= '0';
                         tx_rdy <= '0';
        when st_bit => tx <= tx_data(conv_integer(bit_count));
                             tx_rdy <= '0';
        when st_stop => tx <= '1';
                        tx_rdy <= '0';
    end case;
  end process;
  
   process(clk,tx_rdy)
     begin
         if rising_edge(clk) then
             if tx_cnt = "10" and digit_nr = 3 then
                 tx_en<='0';
             elsif en(4) = '1' then
                 tx_en <= '1';
             end if;
         end if;    
     end process;
     
     process(clk,tx_rdy)
     begin
         if rising_edge(clk) then
             tx_cnt <= tx_rdy & tx_cnt(1);
         end if;
     end process;
     
     process(tx_cnt,clk)
     begin
         if rising_edge(clk) then
             if(tx_cnt = "10") then
                 if(digit_nr = "11") then
                     digit_nr<="00";
                 else
                     digit_nr<=digit_nr+1;
                 end if;
             end if;
         end if;   
     end process;
     
 
 process (clk)
 begin
    if rising_edge(clk) then
        baud_count <= baud_count + 1;
        if baud_count = 10416 then
            baud_en <= '1';
            baud_count <= x"0000";
        else
            baud_en <= '0';
        end if;
    end if;
 end process;
 
  process(clk, en, cnt) 
  begin 
     if en(1) = '1' then
              cnt<=x"0000";
          end if;
          if clk'event and clk = '1' then          
            if en(3) = '1' then
              if branch = '1' and z = '1' then
                  cnt<=cnt+branch_add;
              elsif jump='1' then
                  cnt<=jmp_add;
              else
                  cnt<=cnt+1;
              end if;
           end if;
         end if;
  end process;
  
  rom_data <= rom(conv_integer(cnt(7 downto 0)));
  
  ra1 <= rom_data(12 downto 10);
  ra2 <= rom_data(9 downto 7);
  wa <= rom_data(9 downto 7) when RegDst='0' else rom_data(6 downto 4);
  rd1<=reg(conv_integer(ra1));
  rd2<=reg(conv_integer(ra2));
  
   process(cnt, clk)
     begin
         if rising_edge(clk) then
             if (rwrite and en(3))='1' then
                 reg(conv_integer(wa))<=wd;
             end if;
         end if;           
     end process;   
  ram_in<=rd2;
  ram_out<=ram(conv_integer(alures));
  
  process(cnt, clk)
      begin
          if rising_edge(clk) then
              if memwr  = '1' then
                  ram(conv_integer(alures))<=ram_in;
              end if;
          end if;   
  end process;
      
  wd<=ram_out when (memtoreg = '1') else alures;
      
  process(rom_data)
       begin
            case rom_data(15 downto 13) is
                  when "000" => RegDst <='1'; --rtype
                                rwrite <= '1';
                                branch<='0';
                                alusrc<='0';
                                jump<='0';
                                memread<='0';
                                memwr<='0';
                                memtoreg<='0';
                                aluop<="000";
                  when "001" => RegDst <='0'; --addi
                                rwrite <= '1';
                                branch<='0';
                                alusrc<='1';
                                jump<='0';
                                memread<='0';
                                memwr<='0';
                                memtoreg<='0';
                                aluop<="001";
                  when "010" => RegDst <='0'; -- lw
                               rwrite <= '1';
                               branch<='0';
                               alusrc<='1';
                               jump<='0';
                               memread<='1';
                               memwr<='0';
                               memtoreg<='1';
                               aluop<="001";
                  when "011" => RegDst <='0'; -- sw
                               rwrite <= '0';
                               branch<='0';
                               alusrc<='1';
                               jump<='0';
                               memread<='0';
                               memwr<='1';
                               memtoreg<='0';
                               aluop<="001";                                                                          
                   when "100" => RegDst <='0'; -- beq
                                 rwrite <= '0';
                                 branch<='1';
                                 alusrc<='0';
                                 jump<='0';
                                 memread<='0';
                                 memwr<='0';
                                 memtoreg<='0';
                                 aluop<="100";
                   when "101" => RegDst <='0'; --  xori
                                 rwrite <= '1';
                                 branch<='0';
                                 alusrc<='1';
                                 jump<='0';
                                 memread<='0';
                                 memwr<='0';
                                 memtoreg<='0';
                                 aluop<="100";
                  when "110" => RegDst <='0'; -- ori
                                rwrite <= '1';
                                branch<='0';
                                alusrc<='1';
                                jump<='0';
                                memread<='0';
                                memwr<='0';
                                memtoreg<='0';
                                aluop<="011";
                  when others => RegDst <='0'; -- jmp
                                rwrite <= '0';
                                branch<='0';
                                alusrc<='0';
                                jump<='1';
                                memread<='0';
                                memwr<='0';
                                memtoreg<='0'; 
             end case;                                                                    
     end process;
          
     ext<="100000000"&rom_data(6 downto 0) when ExtOp='1' else "000000000"&rom_data(6 downto 0);
     process(sw(15 downto 13))
         begin
           case sw(15 downto 13) is
                when "000" => res <= rom_data;
                when "001" => res <= cnt;
                when "010" => res <= rd1;
                when "011" => res <= rd2;
                when "100" => res <= ext;
                when "101" => res <= alures;
                when "110" => res <= ram_out;
                when others=> res <= wd; 
           end case;
   end process;
   
   --ALU
   b<= rd2 when (alusrc='0') else ext;
   
   process(rom_data(2 downto 0), aluop)
      begin
          case aluop is
              when "000" => aluctrl <=rom_data(2 downto 0);
              when "001" => aluctrl <="000";
              when "100" => aluctrl <="001";
                            branch_add <= "000000000"&rom_data(6 downto 0);
              when "011" => aluctrl <="101";
              when others=> aluctrl <="111";
           end case;
      end process;    
  
    b<= rd2 when (alusrc='0') else ext; --MUX ALUSrc
    a<= rd1;
    sa<=rom_data(3);
        
   process(aluctrl)
   begin
        case aluctrl is
               when "000" => alures <= a+b;
               when "001" => alures <= a-b;
                             if alures = x"0000" then
                                  z<='1';
                             else z<='0';
                             end if;
               when "010" => if sa='1' then alures<= b(14 downto 0) & '0';
                             else alures<=a;
                             end if;
               when "011" => if sa='1' then alures<= '0' & b(15 downto 1);
                             else alures<=a;
                             end if;
               when "100" => alures <= a and b;
               when "101" => alures <= a or b;
               when "110" => alures <= a nand b;
               when others => alures <= a xor b;
               end case;
  end process;
        
  jmp_add<="000"& rom_data(12 downto 0);


--  process(clk, en(3)) 
--  begin
--    if rising_edge(clk) and en(3) = '1' then
--        if_id(31 downto 16) <= cnt;
--        if_id(15 downto 0) <= rom_data;
--    end if;
--  end process;  
  
--  process(clk, en(3)) 
--  begin
--    if rising_edge(clk) and en(3) = '1' then
--        id_ex(83) <= memtoreg;
--        id_ex(82) <= rwrite;
--        id_ex(81) <= memwr;
--        id_ex(80) <= branch;
--        id_ex(79 downto 77) <= aluop;
--        id_ex(76) <= alusrc;
--        id_ex(75 downto 60) <= if_id(31 downto 16);
--        id_ex(59 downto 44) <= rd1;
--        id_ex(43 downto 28) <= rd2;
--        id_ex(27 downto 12) <= ext;
--        id_ex(11 downto 8) <= if_id(3 downto 0);
--        id_ex(7 downto 4) <= if_id(11 downto 8);
--        id_ex(3 downto 0) <= if_id(7 downto 4);
--    end if;
--  end process;
  
--  process(clk, en(3))
--  begin
--    if rising_edge(clk) and en(3) = '1' then
--        ex_mem(56 downto 53) <= id_ex(83 downto 80);
--        ex_mem(52 downto 37) <= branch_add;
--        ex_mem(36) <= z;
--        ex_mem(35 downto 20) <= alures;
--        ex_mem(19 downto 4) <= id_ex(43 downto 28);
--        ex_mem(3 downto 0) <= wa;
--    end if;
--  end process;
  
--  process(clk, en(3)) 
--  begin
--    if rising_edge(clk) and en(3) = '1' then
--        mem_wb(37 downto 36) <= ex_mem(56 downto 55);
--        mem_wb(35 downto 20) <= ram_out;
--        mem_wb(19 downto 4) <= ex_mem(35 downto 20);
--        mem_wb(3 downto 0) <= ex_mem(3 downto 0);
--    end if;
--  end process;
  
  
 -- process(clk, cnt)
 -- begin
 --   if rising_edge(clk) then
  --     if en(3) = '1' then
   --         reg(conv_integer(wa)) <= wd;
   --    end if;
    --   if en(1) = '1' then
    --        rd1 <= reg(conv_integer(ra1));
   --         rd2 <= reg(conv_integer(ra2));
 --      end if;
 --   end if;   
--  end process;
  
 -- ram_in <= ram_data(13 downto 0) & "00";
  
 -- process(cnt, clk)
 -- begin
     --   if rising_edge(clk) then
        --    if en(2) = '1' then
       --         ram(conv_integer(cnt(7 downto 0))) <= ram_in;
        --    else 
       --         ram_data <= ram(conv_integer(cnt(7 downto 0)));
        --    end if;
      --  end if;    
 -- end process;
  
--  process(sw(2 downto 0))
--  begin
 --   case (sw(2 downto 0)) is
   --      when "000" => res <= rom_data;
   --      when "001" => res <= rd1;
   --      when "010" => res <= rd2;
   --      when "011" => res <= wd;
   --      when "100" => res <= ram_data;
    --     when "101" => res <= ram_in;
    --     when others => res <= x"0000";
 --   end case;
--  end process;
  
  led <= cnt;
  
--  a <= "000000000000" & sw (3 downto 0);
--  b <= "000000000000" & sw (7 downto 4);
--  c <= "00000000" & sw (7 downto 0);
  
--  process(cnt)
--  begin
--    case cnt is
--        when "00" => res <= a + b;
--        when "01" => res <= a - b;
--        when "10" => res <= c(14 downto 0) & "0";
--        when "11" => res <= "0" & c(15 downto 1);   
--    end case;
--  end process;
  
 -- process(cnt)
 -- begin
  --    case cnt(3 downto 0) is
    --      when "0000"     => led <= x"0001";
        --  when "0001"     => led <= x"0002";
      --    when "0010"     => led <= x"0004";
       --   when "0011"     => led <= x"0008";
         -- when "0100"     => led <= x"0010";
  --        when "0101"     => led <= x"0020";
    --      when "0110"     => led <= x"0040";
      --    when "0111"     => led <= x"0080";
        --  when "1000"     => led <= x"0100";
  --        when "1001"     => led <= x"0200";
    --      when "1010"     => led <= x"0400";
      --    when "1011"     => led <= x"0800";
        --  when "1100"     => led <= x"1000";
  --        when "1101"     => led <= x"2000";
    --      when "1110"     => led <= x"4000";
      --    when others     => led <= x"8000"; 
  --    end case;
 -- end process;
  
--  an <= btn(3 downto 0);
--  cat <= (others=>'0');
    
    
end Behavioral;
