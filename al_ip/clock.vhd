--------------------------------------------------------------
 --  Copyright (c) 2011-2021 Anlogic, Inc.
 --  All Right Reserved.
--------------------------------------------------------------
 -- Log	:	This file is generated by Anlogic IP Generator.
 -- File	:	/home/nf/ws/td/potato/al_ip/clock.vhd
 -- Date	:	2019 07 31
 -- TD version	:	4.5.12562
--------------------------------------------------------------

-------------------------------------------------------------------------------
--	Input frequency:             24.000Mhz
--	Clock multiplication factor: 25
--	Clock division factor:       12
--	Clock information:
--		Clock name	| Frequency 	| Phase shift
--		C0        	| 50.000000 MHZ	| 0  DEG     
--		C1        	| 10.000000 MHZ	| 0  DEG     
-------------------------------------------------------------------------------

LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
USE ieee.std_logic_unsigned.ALL;
USE ieee.std_logic_arith.ALL;
LIBRARY eagle_macro;
USE eagle_macro.EAGLE_COMPONENTS.ALL;

ENTITY clock IS
	PORT ( refclk	: IN	STD_LOGIC;
		reset	: IN	STD_LOGIC;
		extlock	: OUT	STD_LOGIC;
		clk0_out	: OUT	STD_LOGIC;
		clk1_out	: OUT	STD_LOGIC);
END clock;

ARCHITECTURE rtl OF clock IS
	SIGNAL clkc_wire	: STD_LOGIC_VECTOR (4 DOWNTO 0);
BEGIN
	pll_inst : EG_PHY_PLL	GENERIC MAP ( DPHASE_SOURCE => "DISABLE",
		DYNCFG => "DISABLE",
		FIN => "24.000",
		FEEDBK_MODE => "ZERODELAY",
		FEEDBK_PATH => "CLKC0_INT",
		STDBY_ENABLE => "DISABLE",
		PLLRST_ENA => "ENABLE",
		SYNC_ENABLE => "DISABLE",
		DERIVE_PLL_CLOCKS => "DISABLE",
		GEN_BASIC_CLOCK => "DISABLE",
		GMC_GAIN => 6,
		ICP_CURRENT => 3,
		KVCO => 6,
		LPF_CAPACITOR => 3,
		LPF_RESISTOR => 2,
		REFCLK_DIV => 12,
		FBCLK_DIV => 25,
		CLKC0_ENABLE => "ENABLE",
		CLKC0_DIV => 20,
		CLKC0_CPHASE => 19,
		CLKC0_FPHASE => 0,
		CLKC1_ENABLE => "ENABLE",
		CLKC1_DIV => 100,
		CLKC1_CPHASE => 99,
		CLKC1_FPHASE => 0)
		PORT MAP ( refclk => refclk,
			reset => reset,
			stdby => '0',
			extlock => extlock,
			psclk => '0',
			psdown => '0',
			psstep => '0',
			psclksel => "000",
			dclk => '0',
			dcs => '0',
			dwe => '0',
			di => "00000000",
			daddr => "000000",
			fbclk => '0',
			clkc => clkc_wire);

		clk1_out <= clkc_wire(1);
		clk0_out <= clkc_wire(0);

END rtl;
