v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 210 -260 210 -220 {
lab=VDD}
N 190 -60 190 -30 {
lab=VSS}
N 160 -250 160 -220 {
lab=WWLD[0]}
N 50 -180 90 -180 {
lab=BL}
N 270 -180 310 -180 {
lab=BLB}
N 40 -110 90 -110 {
lab=RBLD}
N 270 -110 320 -110 {
lab=RBLDX}
N 220 40 220 80 {
lab=VDD}
N 200 240 200 270 {
lab=VSS}
N 170 50 170 80 {
lab=WWLD[1]}
N 60 120 100 120 {
lab=BL}
N 280 120 320 120 {
lab=BLB}
N 50 190 100 190 {
lab=RBLD}
N 280 190 330 190 {
lab=RBLDX}
N 230 330 230 370 {
lab=VDD}
N 210 530 210 560 {
lab=VSS}
N 180 340 180 370 {
lab=WWLD[2]}
N 70 410 110 410 {
lab=BL}
N 290 410 330 410 {
lab=BLB}
N 60 480 110 480 {
lab=RBLD}
N 290 480 340 480 {
lab=RBLDX}
N 240 630 240 670 {
lab=VDD}
N 220 830 220 860 {
lab=VSS}
N 190 640 190 670 {
lab=WWLD[3]}
N 80 710 120 710 {
lab=BL}
N 300 710 340 710 {
lab=BLB}
N 70 780 120 780 {
lab=RBLD}
N 300 780 350 780 {
lab=RBLDX}
N 250 920 250 960 {
lab=VDD}
N 230 1120 230 1150 {
lab=VSS}
N 200 930 200 960 {
lab=WWLD[4]}
N 90 1000 130 1000 {
lab=BL}
N 310 1000 350 1000 {
lab=BLB}
N 80 1070 130 1070 {
lab=RBLD}
N 310 1070 360 1070 {
lab=RBLDX}
N 260 1220 260 1260 {
lab=VDD}
N 240 1420 240 1450 {
lab=VSS}
N 210 1230 210 1260 {
lab=WWLD[5]}
N 100 1300 140 1300 {
lab=BL}
N 320 1300 360 1300 {
lab=BLB}
N 90 1370 140 1370 {
lab=RBLD}
N 320 1370 370 1370 {
lab=RBLDX}
N 270 1510 270 1550 {
lab=VDD}
N 250 1710 250 1740 {
lab=VSS}
N 220 1520 220 1550 {
lab=WWLD[6]}
N 110 1590 150 1590 {
lab=BL}
N 330 1590 370 1590 {
lab=BLB}
N 100 1660 150 1660 {
lab=RBLD}
N 330 1660 380 1660 {
lab=RBLDX}
N 280 1810 280 1850 {
lab=VDD}
N 260 2010 260 2040 {
lab=VSS}
N 230 1820 230 1850 {
lab=WWLD[7]}
N 120 1890 160 1890 {
lab=BL}
N 340 1890 380 1890 {
lab=BLB}
N 110 1960 160 1960 {
lab=RBLD}
N 340 1960 390 1960 {
lab=RBLDX}
C {10T_SRAM_bitcell.sym} 240 -140 0 0 {name=x3}
C {devices/lab_pin.sym} 190 -30 3 0 {name=l114 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 210 -260 2 0 {name=l115 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 50 -180 0 0 {name=l116 sig_type=std_logic lab=BL}
C {devices/lab_pin.sym} 310 -180 2 0 {name=l117 sig_type=std_logic lab=BLB}
C {devices/lab_pin.sym} 90 -160 0 0 {name=l121 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 90 -140 0 0 {name=l122 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 160 -240 0 0 {name=l1 sig_type=std_logic lab=WWLD[0]}
C {10T_SRAM_bitcell.sym} 250 160 0 0 {name=x1}
C {devices/lab_pin.sym} 200 270 3 0 {name=l2 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 220 40 2 0 {name=l3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 60 120 0 0 {name=l4 sig_type=std_logic lab=BL}
C {devices/lab_pin.sym} 320 120 2 0 {name=l5 sig_type=std_logic lab=BLB}
C {devices/lab_pin.sym} 100 140 0 0 {name=l6 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 100 160 0 0 {name=l7 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 170 60 0 0 {name=l8 sig_type=std_logic lab=WWLD[1]}
C {10T_SRAM_bitcell.sym} 260 450 0 0 {name=x2}
C {devices/lab_pin.sym} 210 560 3 0 {name=l9 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 230 330 2 0 {name=l10 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 70 410 0 0 {name=l11 sig_type=std_logic lab=BL}
C {devices/lab_pin.sym} 330 410 2 0 {name=l12 sig_type=std_logic lab=BLB}
C {devices/lab_pin.sym} 110 430 0 0 {name=l13 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 110 450 0 0 {name=l14 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 180 350 0 0 {name=l15 sig_type=std_logic lab=WWLD[2]}
C {10T_SRAM_bitcell.sym} 270 750 0 0 {name=x4}
C {devices/lab_pin.sym} 220 860 3 0 {name=l16 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 240 630 2 0 {name=l17 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 80 710 0 0 {name=l18 sig_type=std_logic lab=BL}
C {devices/lab_pin.sym} 340 710 2 0 {name=l19 sig_type=std_logic lab=BLB}
C {devices/lab_pin.sym} 120 730 0 0 {name=l20 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 120 750 0 0 {name=l21 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 190 650 0 0 {name=l22 sig_type=std_logic lab=WWLD[3]}
C {devices/lab_pin.sym} 40 -110 0 0 {name=l23 sig_type=std_logic lab=RBLD}
C {devices/lab_pin.sym} 320 -110 2 0 {name=l24 sig_type=std_logic lab=RBLDX}
C {devices/lab_pin.sym} 330 190 2 0 {name=l25 sig_type=std_logic lab=RBLDX}
C {devices/lab_pin.sym} 340 480 2 0 {name=l26 sig_type=std_logic lab=RBLDX}
C {devices/lab_pin.sym} 350 780 2 0 {name=l27 sig_type=std_logic lab=RBLDX}
C {devices/lab_pin.sym} 70 780 0 0 {name=l28 sig_type=std_logic lab=RBLD}
C {devices/lab_pin.sym} 60 480 0 0 {name=l29 sig_type=std_logic lab=RBLD}
C {devices/lab_pin.sym} 50 190 0 0 {name=l30 sig_type=std_logic lab=RBLD}
C {devices/ipin.sym} -200 240 0 0 {name=p9 lab=WWLD[0:7]}
C {devices/iopin.sym} -220 290 0 0 {name=p14 lab=VDD}
C {devices/iopin.sym} -220 320 0 0 {name=p15 lab=VSS}
C {devices/opin.sym} -220 370 0 0 {name=p22 lab=RBLDX}
C {devices/ipin.sym} -210 400 0 0 {name=p1 lab=BL}
C {devices/ipin.sym} -210 440 0 0 {name=p2 lab=BLB}
C {devices/opin.sym} -220 350 0 0 {name=p3 lab=RBLD}
C {10T_SRAM_bitcell.sym} 280 1040 0 0 {name=x5}
C {devices/lab_pin.sym} 230 1150 3 0 {name=l31 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 250 920 2 0 {name=l32 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 90 1000 0 0 {name=l33 sig_type=std_logic lab=BL}
C {devices/lab_pin.sym} 350 1000 2 0 {name=l34 sig_type=std_logic lab=BLB}
C {devices/lab_pin.sym} 130 1020 0 0 {name=l35 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 130 1040 0 0 {name=l36 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 200 940 0 0 {name=l37 sig_type=std_logic lab=WWLD[4]}
C {10T_SRAM_bitcell.sym} 290 1340 0 0 {name=x6}
C {devices/lab_pin.sym} 240 1450 3 0 {name=l38 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 260 1220 2 0 {name=l39 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 100 1300 0 0 {name=l40 sig_type=std_logic lab=BL}
C {devices/lab_pin.sym} 360 1300 2 0 {name=l41 sig_type=std_logic lab=BLB}
C {devices/lab_pin.sym} 140 1320 0 0 {name=l42 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 140 1340 0 0 {name=l43 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 210 1240 0 0 {name=l44 sig_type=std_logic lab=WWLD[5]}
C {10T_SRAM_bitcell.sym} 300 1630 0 0 {name=x7}
C {devices/lab_pin.sym} 250 1740 3 0 {name=l45 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 270 1510 2 0 {name=l46 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 110 1590 0 0 {name=l47 sig_type=std_logic lab=BL}
C {devices/lab_pin.sym} 370 1590 2 0 {name=l48 sig_type=std_logic lab=BLB}
C {devices/lab_pin.sym} 150 1610 0 0 {name=l49 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 150 1630 0 0 {name=l50 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 220 1530 0 0 {name=l51 sig_type=std_logic lab=WWLD[6]}
C {10T_SRAM_bitcell.sym} 310 1930 0 0 {name=x8}
C {devices/lab_pin.sym} 260 2040 3 0 {name=l52 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 280 1810 2 0 {name=l53 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 120 1890 0 0 {name=l54 sig_type=std_logic lab=BL}
C {devices/lab_pin.sym} 380 1890 2 0 {name=l55 sig_type=std_logic lab=BLB}
C {devices/lab_pin.sym} 160 1910 0 0 {name=l56 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 160 1930 0 0 {name=l57 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 230 1830 0 0 {name=l58 sig_type=std_logic lab=WWLD[7]}
C {devices/lab_pin.sym} 80 1070 0 0 {name=l59 sig_type=std_logic lab=RBLD}
C {devices/lab_pin.sym} 360 1070 2 0 {name=l60 sig_type=std_logic lab=RBLDX}
C {devices/lab_pin.sym} 370 1370 2 0 {name=l61 sig_type=std_logic lab=RBLDX}
C {devices/lab_pin.sym} 380 1660 2 0 {name=l62 sig_type=std_logic lab=RBLDX}
C {devices/lab_pin.sym} 390 1960 2 0 {name=l63 sig_type=std_logic lab=RBLDX}
C {devices/lab_pin.sym} 110 1960 0 0 {name=l64 sig_type=std_logic lab=RBLD}
C {devices/lab_pin.sym} 100 1660 0 0 {name=l65 sig_type=std_logic lab=RBLD}
C {devices/lab_pin.sym} 90 1370 0 0 {name=l66 sig_type=std_logic lab=RBLD}
