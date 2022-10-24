------CDABB

entity DETECTA is
port( CLK : in std_logic;
A : in std_logic;
B : in std_logic;
C : in std_logic;
D : in std_logic;
RST:in std_logic;

OutLed: out std_logic;
end DETECTA;




architecture Locker of DETECTA is
type ESTADO is (INIC, ST_C, ST_CD, ST_CDA, ST_CDAB, ST_CDABB );
signal ACTUAL, SIGUE : ESTADO;
begin
SEQ: process(CLK, RST)
begin
if RST = ‘1’ then
ACTUAL <= INIC;
elsif CLK’event and CLK = ‘1’ then
ACTUAL <= SIGUE;
end if;
end process SEQ;



LOCK: process(ACTUAL, A, B, C, D)
begin
    case ACTUAL is
        when INIC =>
        OutLed <= ‘0’;
          if C = ‘1’ then
             SIGUE <= ST_C;
            else
             SIGUE <= INIC;
          end if;
        when ST_C =>
        OutLed <= ‘0’;
          if D = ‘1’ then
             SIGUE <= ST_CD;
            else
             SIGUE <= INIC;
          end if;
        when ST_CD =>
        OutLed <= ‘0’;
          if D = ‘1’ then
             SIGUE <= ST_CDA;
            else
             SIGUE <= INIC;
          end if;
        when ST_CDA =>
        OutLed <= ‘0’;
          if D = ‘1’ then
             SIGUE <= ST_CDAB;
            else
             SIGUE <= INIC;
          end if;
        when ST_CDAB =>
        OutLed <= ‘0’;
          if D = ‘1’ then
             SIGUE <= ST_CDABB;
            else
             SIGUE <= INIC;
          end if;
        when ST_CDABB =>
        OutLed <= ‘1’;
          if D = ‘1’ then
             SIGUE <= ST_CDABB;
            else
             SIGUE <= INIC;
          end if;
end if;
end case;
end process COMB;
