LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY fourbitcomparator IS
    PORT (
        i_a : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        i_b : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
        o_gt, o_lt, o_eq : OUT STD_LOGIC
    );
END fourbitcomparator;

ARCHITECTURE structural OF fourbitcomparator IS
SIGNAL int_eq_signals : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL int_gt_signals : STD_LOGIC_VECTOR(3 DOWNTO 0);
SIGNAL int_eq, int_gt : STD_LOGIC;
BEGIN
    int_eq_signals(0) <= i_a(0) xor i_b(0);
	 int_eq_signals(1) <= i_a(1) xor i_b(1);
	 int_eq_signals(2) <= i_a(2) xor i_b(2);
	 int_eq_signals(3) <= i_a(3) xor i_b(3);
    int_eq <= (int_eq_signals(0) nor int_eq_signals(1)) and (int_eq_signals(2) nor int_eq_signals(3));

    int_gt_signals(0) <= not(i_a(3) xor i_b(3)) and not(i_a(2) xor i_b(2)) and not(i_a(1) xor i_b(1)) and i_a(0) and not i_b(0);
    int_gt_signals(1) <= not(i_a(3) xor i_b(3)) and not(i_a(2) xor i_b(2)) and i_a(1) and not i_b(1);
    int_gt_signals(2) <= not(i_a(3) xor i_b(3)) and i_a(2) and not i_b(2);
    int_gt_signals(3) <= i_a(3) and (not i_b(3));
    int_gt <= int_gt_signals(0) or int_gt_signals(1) or int_gt_signals(2) or int_gt_signals(3);

    o_gt <= int_gt;
    o_eq <= int_eq;
    o_lt <= int_gt nor int_eq;

END structural;
