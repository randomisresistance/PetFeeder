EESchema Schematic File Version 4
EELAYER 30 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 1
Title "PetFeeder"
Date "2019-10-31"
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L power:GND #PWR02
U 1 1 5DB898A6
P 2000 3500
F 0 "#PWR02" H 2000 3250 50  0001 C CNN
F 1 "GND" H 2005 3327 50  0000 C CNN
F 2 "" H 2000 3500 50  0001 C CNN
F 3 "" H 2000 3500 50  0001 C CNN
	1    2000 3500
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR03
U 1 1 5DB89BBD
P 4650 800
F 0 "#PWR03" H 4650 650 50  0001 C CNN
F 1 "+5V" H 4665 973 50  0000 C CNN
F 2 "" H 4650 800 50  0001 C CNN
F 3 "" H 4650 800 50  0001 C CNN
	1    4650 800 
	1    0    0    -1  
$EndComp
$Comp
L Transistor_FET:BUZ11 Q1
U 1 1 5DB8A137
P 4650 2550
F 0 "Q1" H 4856 2596 50  0000 L CNN
F 1 "BUZ11" H 4856 2505 50  0000 L CNN
F 2 "Package_TO_SOT_THT:TO-220-3_Horizontal_TabDown" H 4900 2475 50  0001 L CIN
F 3 "http://www.fairchildsemi.com/ds/BU/BUZ11.pdf" H 4650 2550 50  0001 L CNN
	1    4650 2550
	1    0    0    -1  
$EndComp
$Comp
L MCU_Module:Arduino_Nano_v3.x A1
U 1 1 5DB8B285
P 1650 1750
F 0 "A1" H 1650 661 50  0000 C CNN
F 1 "Arduino_Nano_v3.x" H 1650 570 50  0000 C CNN
F 2 "Module:Arduino_Nano" H 1800 800 50  0001 L CNN
F 3 "http://www.mouser.com/pdfdocs/Gravitech_Arduino_Nano3_0.pdf" H 1650 750 50  0001 C CNN
	1    1650 1750
	1    0    0    -1  
$EndComp
$Comp
L Device:D_Zener D3
U 1 1 5DB90836
P 5650 1600
F 0 "D3" H 5650 1816 50  0000 C CNN
F 1 "D_Zener" H 5650 1725 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 5650 1600 50  0001 C CNN
F 3 "~" H 5650 1600 50  0001 C CNN
	1    5650 1600
	0    -1   -1   0   
$EndComp
$Comp
L Device:D D2
U 1 1 5DB9176E
P 5650 1200
F 0 "D2" H 5650 1416 50  0000 C CNN
F 1 "D" H 5650 1325 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 5650 1200 50  0001 C CNN
F 3 "~" H 5650 1200 50  0001 C CNN
	1    5650 1200
	0    1    1    0   
$EndComp
$Comp
L Device:D_Zener D1
U 1 1 5DB92205
P 5550 2600
F 0 "D1" H 5550 2816 50  0000 C CNN
F 1 "D_Zener" H 5550 2725 50  0000 C CNN
F 2 "Diode_THT:D_A-405_P7.62mm_Horizontal" H 5550 2600 50  0001 C CNN
F 3 "~" H 5550 2600 50  0001 C CNN
	1    5550 2600
	0    1    1    0   
$EndComp
Wire Wire Line
	4650 800  4650 1050
Wire Wire Line
	5650 1050 4650 1050
Connection ~ 4650 1050
Wire Wire Line
	4650 2350 4750 2350
Wire Wire Line
	5650 1750 4650 1750
Connection ~ 4650 1750
Wire Wire Line
	4650 1750 4650 2350
Wire Wire Line
	4750 2350 5550 2350
Wire Wire Line
	5550 2350 5550 2450
Connection ~ 4750 2350
Wire Wire Line
	5550 2750 4750 2750
Wire Wire Line
	4750 2750 4750 3200
Connection ~ 4750 2750
$Comp
L power:GND #PWR04
U 1 1 5DBA2E3E
P 4750 3300
F 0 "#PWR04" H 4750 3050 50  0001 C CNN
F 1 "GND" H 4755 3127 50  0000 C CNN
F 2 "" H 4750 3300 50  0001 C CNN
F 3 "" H 4750 3300 50  0001 C CNN
	1    4750 3300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R1
U 1 1 5DBA34B7
P 4150 2550
F 0 "R1" V 3943 2550 50  0000 C CNN
F 1 "250" V 4034 2550 50  0000 C CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4080 2550 50  0001 C CNN
F 3 "~" H 4150 2550 50  0001 C CNN
	1    4150 2550
	0    1    1    0   
$EndComp
Wire Wire Line
	4300 2550 4350 2550
$Comp
L Device:R R2
U 1 1 5DBA57F9
P 4350 2950
F 0 "R2" H 4420 2996 50  0000 L CNN
F 1 "10k" H 4420 2905 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 4280 2950 50  0001 C CNN
F 3 "~" H 4350 2950 50  0001 C CNN
	1    4350 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	4350 2800 4350 2550
Connection ~ 4350 2550
Wire Wire Line
	4350 2550 4450 2550
Wire Wire Line
	4350 3100 4350 3200
Wire Wire Line
	4350 3200 4750 3200
Connection ~ 4750 3200
Wire Wire Line
	4750 3200 4750 3300
$Comp
L power:+5V #PWR01
U 1 1 5DBA6618
P 1500 550
F 0 "#PWR01" H 1500 400 50  0001 C CNN
F 1 "+5V" H 1515 723 50  0000 C CNN
F 2 "" H 1500 550 50  0001 C CNN
F 3 "" H 1500 550 50  0001 C CNN
	1    1500 550 
	1    0    0    -1  
$EndComp
Wire Wire Line
	1500 750  1550 750 
Wire Wire Line
	1750 3500 2000 3500
Wire Wire Line
	4000 2550 3650 2550
Wire Wire Line
	1150 1350 850  1350
Text Label 3650 2550 0    50   ~ 0
signal_pump
Text Label 850  1350 0    50   ~ 0
signal_pump
Wire Wire Line
	5650 1350 5650 1450
NoConn ~ 2150 1250
NoConn ~ 2150 1550
NoConn ~ 2150 1750
NoConn ~ 2150 1850
NoConn ~ 2150 1950
NoConn ~ 2150 2050
NoConn ~ 2150 2150
NoConn ~ 2150 2250
NoConn ~ 2150 2350
NoConn ~ 2150 2450
NoConn ~ 1150 2450
NoConn ~ 1150 2350
NoConn ~ 1150 2250
NoConn ~ 1150 2150
NoConn ~ 1150 2050
NoConn ~ 1150 1950
NoConn ~ 1150 1850
NoConn ~ 1150 1750
NoConn ~ 1150 1250
NoConn ~ 1150 1150
NoConn ~ 1650 2750
NoConn ~ 1750 750 
NoConn ~ 1850 750 
Wire Wire Line
	4650 1450 4650 1750
Wire Wire Line
	4650 1050 4650 1350
$Comp
L power:GND #PWR0101
U 1 1 5DBC3D05
P 2850 2500
F 0 "#PWR0101" H 2850 2250 50  0001 C CNN
F 1 "GND" H 2855 2327 50  0000 C CNN
F 2 "" H 2850 2500 50  0001 C CNN
F 3 "" H 2850 2500 50  0001 C CNN
	1    2850 2500
	1    0    0    -1  
$EndComp
$Comp
L Connector:USB_B_Mini J2
U 1 1 5DBC42F7
P 2850 1900
F 0 "J2" H 2907 2367 50  0000 C CNN
F 1 "power" H 2907 2276 50  0000 C CNN
F 2 "Connector_USB:USB_Mini-B_Lumberg_2486_01_Horizontal" H 3000 1850 50  0001 C CNN
F 3 "~" H 3000 1850 50  0001 C CNN
	1    2850 1900
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR0102
U 1 1 5DBC7D6A
P 3300 1500
F 0 "#PWR0102" H 3300 1350 50  0001 C CNN
F 1 "+5V" H 3315 1673 50  0000 C CNN
F 2 "" H 3300 1500 50  0001 C CNN
F 3 "" H 3300 1500 50  0001 C CNN
	1    3300 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	3300 1500 3300 1700
Wire Wire Line
	3300 1700 3150 1700
Wire Wire Line
	2850 2300 2850 2400
NoConn ~ 3150 1900
NoConn ~ 3150 2000
NoConn ~ 3150 2100
$Comp
L power:GND #PWR0103
U 1 1 5DBCD13E
P 3850 5050
F 0 "#PWR0103" H 3850 4800 50  0001 C CNN
F 1 "GND" H 3855 4877 50  0000 C CNN
F 2 "" H 3850 5050 50  0001 C CNN
F 3 "" H 3850 5050 50  0001 C CNN
	1    3850 5050
	1    0    0    -1  
$EndComp
Wire Wire Line
	2850 4400 2150 4400
Wire Wire Line
	2150 4050 3200 4050
Wire Wire Line
	2850 3750 2150 3750
Text Label 2150 3750 0    50   ~ 0
signal_button_set
Text Label 2150 4050 0    50   ~ 0
signal_button_select
Text Label 2150 4400 0    50   ~ 0
signal_button_reset
Wire Wire Line
	2850 3800 2850 3750
Wire Wire Line
	4000 4250 3600 4250
Wire Wire Line
	4000 4700 3600 4700
Wire Wire Line
	2850 4700 2850 4400
Wire Wire Line
	3200 4050 3200 4250
Text Label 2900 1150 0    50   ~ 0
signal_button_reset
Wire Wire Line
	1150 1450 850  1450
Wire Wire Line
	1150 1550 850  1550
Text Label 850  1450 0    50   ~ 0
signal_button_set
Text Label 850  1550 0    50   ~ 0
signal_button_select
$Comp
L power:+5V #PWR0104
U 1 1 5DBF0679
P 3350 3200
F 0 "#PWR0104" H 3350 3050 50  0001 C CNN
F 1 "+5V" H 3365 3373 50  0000 C CNN
F 2 "" H 3350 3200 50  0001 C CNN
F 3 "" H 3350 3200 50  0001 C CNN
	1    3350 3200
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5DBF0DBC
P 3600 3450
F 0 "R3" H 3670 3496 50  0000 L CNN
F 1 "10k" H 3670 3405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3530 3450 50  0001 C CNN
F 3 "~" H 3600 3450 50  0001 C CNN
	1    3600 3450
	1    0    0    -1  
$EndComp
$Comp
L Device:R R4
U 1 1 5DBF11F8
P 3600 4000
F 0 "R4" H 3670 4046 50  0000 L CNN
F 1 "10k" H 3670 3955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3530 4000 50  0001 C CNN
F 3 "~" H 3600 4000 50  0001 C CNN
	1    3600 4000
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5DBF17B9
P 3600 4450
F 0 "R5" H 3670 4496 50  0000 L CNN
F 1 "10k" H 3670 4405 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 3530 4450 50  0001 C CNN
F 3 "~" H 3600 4450 50  0001 C CNN
	1    3600 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	2150 1150 2900 1150
Wire Wire Line
	3350 3200 3600 3200
Wire Wire Line
	3600 3200 3600 3300
Wire Wire Line
	3600 3600 3600 3800
Wire Wire Line
	2850 3800 3600 3800
Connection ~ 3600 3800
Wire Wire Line
	3600 3800 4000 3800
Wire Wire Line
	3600 3850 3350 3850
Wire Wire Line
	3350 3850 3350 3200
Connection ~ 3350 3200
Wire Wire Line
	3600 4150 3600 4250
Connection ~ 3600 4250
Wire Wire Line
	3600 4250 3200 4250
Wire Wire Line
	3600 4300 3350 4300
Wire Wire Line
	3350 4300 3350 3850
Connection ~ 3350 3850
Wire Wire Line
	3600 4600 3600 4700
Connection ~ 3600 4700
Wire Wire Line
	3600 4700 2850 4700
Wire Wire Line
	1150 1650 850  1650
Text Label 850  1650 0    50   ~ 0
signal_motor
$Comp
L Connector_Generic:Conn_01x03 J6
U 1 1 5DC20E7C
P 6750 2050
F 0 "J6" H 6830 2092 50  0000 L CNN
F 1 "motor" H 6830 2001 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x03_P2.54mm_Horizontal" H 6750 2050 50  0001 C CNN
F 3 "~" H 6750 2050 50  0001 C CNN
	1    6750 2050
	0    1    1    0   
$EndComp
$Comp
L power:+5V #PWR0105
U 1 1 5DC2143A
P 6200 1800
F 0 "#PWR0105" H 6200 1650 50  0001 C CNN
F 1 "+5V" H 6215 1973 50  0000 C CNN
F 2 "" H 6200 1800 50  0001 C CNN
F 3 "" H 6200 1800 50  0001 C CNN
	1    6200 1800
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR0106
U 1 1 5DC2186D
P 7000 2350
F 0 "#PWR0106" H 7000 2100 50  0001 C CNN
F 1 "GND" H 7005 2177 50  0000 C CNN
F 2 "" H 7000 2350 50  0001 C CNN
F 3 "" H 7000 2350 50  0001 C CNN
	1    7000 2350
	1    0    0    -1  
$EndComp
Text Label 6150 1450 0    50   ~ 0
signal_motor
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 5DBBB7B3
P 4450 1450
F 0 "J1" H 4530 1442 50  0000 L CNN
F 1 "pump" H 4530 1351 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 4450 1450 50  0001 C CNN
F 3 "~" H 4450 1450 50  0001 C CNN
	1    4450 1450
	-1   0    0    1   
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J5
U 1 1 5DBD81B1
P 4200 4600
F 0 "J5" H 4280 4592 50  0000 L CNN
F 1 "button_reset" H 4280 4501 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 4200 4600 50  0001 C CNN
F 3 "~" H 4200 4600 50  0001 C CNN
	1    4200 4600
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J4
U 1 1 5DBD59A9
P 4200 4150
F 0 "J4" H 4280 4142 50  0000 L CNN
F 1 "button_select" H 4280 4051 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 4200 4150 50  0001 C CNN
F 3 "~" H 4200 4150 50  0001 C CNN
	1    4200 4150
	1    0    0    -1  
$EndComp
$Comp
L Connector_Generic:Conn_01x02 J3
U 1 1 5DBD4FE5
P 4200 3700
F 0 "J3" H 4280 3692 50  0000 L CNN
F 1 "button_set" H 4280 3601 50  0000 L CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Horizontal" H 4200 3700 50  0001 C CNN
F 3 "~" H 4200 3700 50  0001 C CNN
	1    4200 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2400 2850 2400
Connection ~ 2850 2400
Wire Wire Line
	2850 2400 2850 2500
Wire Wire Line
	2750 2300 2750 2400
Wire Wire Line
	1500 550  1500 750 
Wire Wire Line
	1750 2750 1750 3500
Wire Wire Line
	3850 3700 4000 3700
Wire Wire Line
	3850 3700 3850 4150
Wire Wire Line
	3850 4150 4000 4150
Connection ~ 3850 4150
Wire Wire Line
	3850 4150 3850 4600
Wire Wire Line
	3850 4600 4000 4600
Connection ~ 3850 4600
Wire Wire Line
	3850 4600 3850 5050
Wire Wire Line
	6750 1850 6750 1450
Wire Wire Line
	6750 1450 6150 1450
Wire Wire Line
	6650 1850 6200 1850
Wire Wire Line
	6200 1850 6200 1800
Wire Wire Line
	6850 1850 7000 1850
Wire Wire Line
	7000 1850 7000 2350
$Comp
L Device:R R6
U 1 1 5DC125A4
P 7000 1600
F 0 "R6" H 7070 1646 50  0000 L CNN
F 1 "10k" H 7070 1555 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P10.16mm_Horizontal" V 6930 1600 50  0001 C CNN
F 3 "~" H 7000 1600 50  0001 C CNN
	1    7000 1600
	1    0    0    -1  
$EndComp
Wire Wire Line
	6750 1450 7000 1450
Connection ~ 6750 1450
Wire Wire Line
	7000 1750 7000 1850
Connection ~ 7000 1850
$EndSCHEMATC
