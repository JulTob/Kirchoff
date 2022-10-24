
------
entity Reloj is
port (clk1 : in std_logic;
       clk : out std_logic :=0
     );
end Reloj;
------
architecture Behavioral of Reloj is

signal count : natural range 0 to 2**26-1;


RELOJ:process(clk1) 
begin
if(clk1'event and clk1='1') then
count <=count+1;

--Para señal cuadrada ___---___---___
--Preguntar si ESTA es la señal ?!?!!!!

--Alterar !        ! si necesario --50000000ciclos es 1Hz
if(count = 2500000) then
clk <= not clk;

end if;

if(count=5000000) then 
clk<= not clk;   ---Si es pulso clk<=1;
count <=0;


end if;
end process;
end Behavioral
