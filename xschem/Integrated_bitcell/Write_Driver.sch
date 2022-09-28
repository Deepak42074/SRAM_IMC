v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1010 1080 1010 1190 { lab=#net1}
N 1350 1080 1350 1190 { lab=#net2}
N 1010 930 1010 1020 { lab=BL}
N 1350 930 1350 1020 { lab=BLB}
N 1010 1250 1010 1350 { lab=VSS}
N 1010 1350 1280 1350 { lab=VSS}
N 1050 1050 1310 1050 { lab=WE}
N 1210 1180 1210 1240 { lab=#net3}
N 1150 1150 1170 1150 { lab=#net4}
N 1150 1150 1150 1270 { lab=#net4}
N 1150 1270 1170 1270 { lab=#net4}
N 1210 1270 1220 1270 { lab=VSS}
N 1220 1270 1220 1300 { lab=VSS}
N 1210 1300 1220 1300 { lab=VSS}
N 1210 1300 1210 1330 { lab=VSS}
N 1210 1150 1220 1150 { lab=VDD}
N 1220 1120 1220 1150 { lab=VDD}
N 1210 1120 1220 1120 { lab=VDD}
N 1210 1090 1210 1120 { lab=VDD}
N 790 1130 790 1190 { lab=#net4}
N 730 1100 750 1100 { lab=Din}
N 730 1100 730 1220 { lab=Din}
N 730 1220 750 1220 { lab=Din}
N 790 1220 800 1220 { lab=VSS}
N 800 1220 800 1250 { lab=VSS}
N 790 1250 800 1250 { lab=VSS}
N 790 1250 790 1280 { lab=VSS}
N 790 1100 800 1100 { lab=VDD}
N 800 1070 800 1100 { lab=VDD}
N 790 1070 800 1070 { lab=VDD}
N 790 1040 790 1070 { lab=VDD}
N 1150 990 1150 1050 { lab=WE}
N 700 990 1150 990 { lab=WE}
N 1350 1250 1350 1350 { lab=VSS}
N 1280 1350 1350 1350 { lab=VSS}
N 1210 1220 1310 1220 { lab=#net3}
N 1050 1220 1150 1220 { lab=#net4}
N 1210 1330 1210 1350 { lab=VSS}
N 1210 1350 1210 1400 { lab=VSS}
N 990 1050 1010 1050 { lab=VSS}
N 1350 1220 1360 1220 { lab=VSS}
N 1360 1220 1360 1250 { lab=VSS}
N 1350 1250 1360 1250 { lab=VSS}
N 1000 1220 1010 1220 { lab=VSS}
N 1000 1220 1000 1250 { lab=VSS}
N 1000 1250 1010 1250 { lab=VSS}
N 1350 1050 1370 1050 { lab=VSS}
N 790 1150 1090 1150 { lab=#net4}
N 1090 1150 1090 1220 { lab=#net4}
N 690 1150 730 1150 { lab=Din}
C {sky130_fd_pr/nfet_01v8.sym} 1330 1050 0 0 {name=M1
L=0.15
W=1
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
C {sky130_fd_pr/nfet_01v8.sym} 1030 1050 0 1 {name=M2
L=0.15
W=1
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
C {sky130_fd_pr/nfet_01v8.sym} 1330 1220 0 0 {name=M3
L=0.15
W=1
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
C {sky130_fd_pr/nfet_01v8.sym} 1030 1220 0 1 {name=M4
L=0.15
W=1
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
C {sky130_fd_pr/nfet_01v8.sym} 1190 1270 0 0 {name=M5
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
C {sky130_fd_pr/pfet_01v8.sym} 1190 1150 0 0 {name=M6
L=0.15
W=0.84
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
C {sky130_fd_pr/nfet_01v8.sym} 770 1220 0 0 {name=M7
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
C {sky130_fd_pr/pfet_01v8.sym} 770 1100 0 0 {name=M8
L=0.15
W=0.84
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
C {devices/lab_pin.sym} 1010 930 0 0 {name=l1 sig_type=std_logic lab=BL}
C {devices/lab_pin.sym} 1350 930 0 0 {name=l2 sig_type=std_logic lab=BLB}
C {devices/lab_pin.sym} 700 990 0 0 {name=l3 sig_type=std_logic lab=WE}
C {devices/lab_pin.sym} 690 1150 0 0 {name=l4 sig_type=std_logic lab=Din}
C {devices/lab_pin.sym} 790 1040 0 0 {name=l5 sig_type=std_logic lab=VDD}
C {devices/lab_pin.sym} 790 1280 0 0 {name=l6 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1210 1390 0 0 {name=l7 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 990 1050 0 0 {name=l8 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1370 1050 2 0 {name=l9 sig_type=std_logic lab=VSS}
C {devices/lab_pin.sym} 1210 1090 0 0 {name=l10 sig_type=std_logic lab=VDD}
C {devices/ipin.sym} 530 990 0 0 {name=p1 lab=WE}
C {devices/ipin.sym} 530 1030 0 0 {name=p2 lab=Din}
C {devices/iopin.sym} 490 1080 0 0 {name=p3 lab=BL}
C {devices/iopin.sym} 490 1110 0 0 {name=p4 lab=BLB}
C {devices/iopin.sym} 490 1150 0 0 {name=p5 lab=VDD}
C {devices/iopin.sym} 490 1180 0 0 {name=p6 lab=VSS}
