v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1850 1680 1850 1750 { lab=#net1}
N 1850 1750 1850 1860 { lab=#net1}
N 1810 1780 1810 1830 { lab=#net2}
N 1990 1750 1990 1830 { lab=#net1}
N 1950 1780 1950 1860 { lab=#net2}
N 1810 1640 1810 1650 { lab=VDD}
N 1990 1640 1990 1650 { lab=VDD}
N 1810 1620 1990 1620 { lab=VDD}
N 1790 1680 1810 1680 { lab=VDD}
N 1790 1640 1790 1680 { lab=VDD}
N 1790 1640 1810 1640 { lab=VDD}
N 1990 1680 2010 1680 { lab=VDD}
N 2010 1640 2010 1680 { lab=VDD}
N 1990 1640 2010 1640 { lab=VDD}
N 1810 1900 1810 1920 { lab=VSS}
N 1810 1920 1990 1920 { lab=VSS}
N 1990 1910 1990 1920 { lab=VSS}
N 1790 1860 1810 1860 { lab=VSS}
N 1790 1860 1790 1900 { lab=VSS}
N 1790 1900 1810 1900 { lab=VSS}
N 1990 1860 2010 1860 { lab=VSS}
N 2010 1860 2010 1910 { lab=VSS}
N 1990 1910 2010 1910 { lab=VSS}
N 1810 1780 1950 1780 { lab=#net2}
N 1850 1750 1990 1750 { lab=#net1}
N 1990 1750 2040 1750 { lab=#net1}
N 2060 1750 2090 1750 { lab=#net1}
N 1700 1780 1810 1780 { lab=#net2}
N 2150 1750 2200 1750 { lab=BLB}
N 1580 1780 1620 1780 { lab=BL}
N 1650 1710 1650 1740 { lab=WWL}
N 2120 1680 2120 1710 { lab=WWL}
N 1810 1620 1810 1640 { lab=VDD}
N 1990 1620 1990 1640 { lab=VDD}
N 1810 1890 1810 1900 { lab=VSS}
N 1990 1890 1990 1910 { lab=VSS}
N 1810 1710 1810 1780 { lab=#net2}
N 1950 1680 1950 1780 { lab=#net2}
N 1990 1710 1990 1750 { lab=#net1}
N 1680 1780 1700 1780 { lab=#net2}
N 1650 1780 1650 1800 { lab=VSS}
N 2120 1750 2120 1770 { lab=VSS}
N 2040 1750 2060 1750 { lab=#net1}
N 1650 1590 1650 1710 { lab=WWL}
N 1650 1590 2120 1590 { lab=WWL}
N 2120 1590 2120 1680 { lab=WWL}
N 1580 1590 1650 1590 { lab=WWL}
N 1720 1780 1720 1970 { lab=#net2}
N 1630 2080 1650 2080 { lab=VSS}
N 1650 2110 1650 2130 { lab=VSS}
N 1720 1970 1720 2040 { lab=#net2}
N 1600 2030 1650 2030 { lab=#net3}
N 1650 2030 1650 2050 { lab=#net3}
N 1570 2030 1570 2060 { lab=VSS}
N 1510 2030 1540 2030 { lab=RBL}
N 1720 2040 1720 2080 { lab=#net2}
N 1690 2080 1720 2080 { lab=#net2}
N 2070 2100 2090 2100 { lab=VSS}
N 2070 2130 2070 2150 { lab=VSS}
N 2070 2050 2120 2050 { lab=#net4}
N 2070 2050 2070 2070 { lab=#net4}
N 2150 2050 2150 2080 { lab=VSS}
N 2180 2050 2210 2050 { lab=RBLB}
N 1570 1940 1570 1990 { lab=RWL}
N 1490 1940 1570 1940 { lab=RWL}
N 2150 1970 2150 2010 { lab=RWLB}
N 2030 1750 2030 2100 { lab=#net1}
N 1630 2080 1630 2110 { lab=VSS}
N 1630 2110 1650 2110 { lab=VSS}
N 2090 2100 2090 2120 { lab=VSS}
N 2090 2120 2090 2130 { lab=VSS}
N 2070 2130 2090 2130 { lab=VSS}
N 1650 2130 1650 2170 { lab=VSS}
N 2070 2150 2070 2170 { lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} 1970 1860 0 0 {name=M1
L=0.15
W=0.64
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1830 1860 0 1 {name=M2
L=0.15
W=0.64
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1830 1680 0 1 {name=M3
L=0.15
W=0.42
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/pfet_01v8.sym} 1970 1680 0 0 {name=M4
L=0.15
W=0.42
nf=1
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=pfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 1580 1590 0 0 {name=l1 sig_type=std_logic lab=WWL}
C {devices/lab_pin.sym} 1890 1620 0 0 {name=l3 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 2190 1750 1 0 {name=l5 sig_type=std_logic lab=BLB
}
C {devices/lab_pin.sym} 1580 1780 0 0 {name=l6 sig_type=std_logic lab=BL
}
C {sky130_fd_pr/nfet_01v8.sym} 2120 1730 3 1 {name=M6
L=0.15
W=0.42
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 1650 1760 1 0 {name=M5
L=0.15
W=0.42
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 1900 1920 0 0 {name=l4 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} 1670 2080 2 0 {name=M7
L=0.15
W=0.42
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 1650 1800 0 0 {name=l25 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2120 1770 0 0 {name=l26 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} 1570 2010 3 1 {name=M8
L=0.15
W=0.42
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 1570 2060 2 0 {name=l2 sig_type=std_logic lab=VSS}
C {sky130_fd_pr/nfet_01v8.sym} 2050 2100 2 1 {name=M9
L=0.15
W=0.42
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {sky130_fd_pr/nfet_01v8.sym} 2150 2030 1 0 {name=M10
L=0.15
W=0.42
nf=1 
mult=1
ad="'int((nf+1)/2) * W/nf * 0.29'" 
pd="'2*int((nf+1)/2) * (W/nf + 0.29)'"
as="'int((nf+2)/2) * W/nf * 0.29'" 
ps="'2*int((nf+2)/2) * (W/nf + 0.29)'"
nrd="'0.29 / W'" nrs="'0.29 / W'"
sa=0 sb=0 sd=0
model=nfet_01v8
spiceprefix=X
}
C {devices/lab_pin.sym} 2150 2080 2 1 {name=l10 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1490 1940 0 0 {name=l13 sig_type=std_logic lab=RWL}
C {devices/lab_pin.sym} 2150 1970 0 0 {name=l14 sig_type=std_logic lab=RWLB}
C {devices/lab_pin.sym} 1510 2030 0 0 {name=l15 sig_type=std_logic lab=RBL
}
C {devices/lab_pin.sym} 1650 2160 2 0 {name=l11 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2070 2160 2 0 {name=l12 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 2210 2050 2 0 {name=l7 sig_type=std_logic lab=RBLB
}
C {devices/iopin.sym} 1050 1700 0 0 {name=p4 lab=BL}
C {devices/iopin.sym} 1050 1730 0 0 {name=p5 lab=BLB}
C {devices/iopin.sym} 1050 1770 0 0 {name=p6 lab=VDD}
C {devices/iopin.sym} 1050 1800 0 0 {name=p7 lab=VSS}
C {devices/iopin.sym} 1030 2060 0 0 {name=p8 lab=RBL}
C {devices/iopin.sym} 1030 2100 0 0 {name=p9 lab=RBLB}
C {devices/ipin.sym} 1050 1660 0 0 {name=p10 lab=WWL}
C {devices/ipin.sym} 1030 1980 0 0 {name=p1 lab=RWL}
C {devices/ipin.sym} 1030 2020 0 0 {name=p11 lab=RWLB}
