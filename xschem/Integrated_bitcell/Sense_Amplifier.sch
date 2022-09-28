v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 1170 20 1170 90 { lab=SO_N}
N 1170 90 1170 200 { lab=SO_N}
N 1130 120 1130 170 { lab=SO}
N 1310 90 1310 170 { lab=SO_N}
N 1270 120 1270 200 { lab=SO}
N 1130 -20 1130 -10 { lab=VDD}
N 1310 -20 1310 -10 { lab=VDD}
N 1110 20 1130 20 { lab=VDD}
N 1110 -20 1110 20 { lab=VDD}
N 1110 -20 1130 -20 { lab=VDD}
N 1310 20 1330 20 { lab=VDD}
N 1330 -20 1330 20 { lab=VDD}
N 1310 -20 1330 -20 { lab=VDD}
N 1110 200 1130 200 { lab=VSS}
N 1310 200 1330 200 { lab=VSS}
N 1130 120 1270 120 { lab=SO}
N 1170 90 1310 90 { lab=SO_N}
N 1310 90 1360 90 { lab=SO_N}
N 1380 90 1410 90 { lab=SO_N}
N 1020 120 1130 120 { lab=SO}
N 1130 -40 1130 -20 { lab=VDD}
N 1310 -40 1310 -20 { lab=VDD}
N 1130 230 1130 240 { lab=#net1}
N 1310 230 1310 250 { lab=#net2}
N 1130 50 1130 120 { lab=SO}
N 1270 20 1270 120 { lab=SO}
N 1310 50 1310 90 { lab=SO_N}
N 1360 90 1380 90 { lab=SO_N}
N 970 -40 1440 -40 { lab=VDD}
N 1440 -40 1470 -40 { lab=VDD}
N 1470 -40 1470 -30 { lab=VDD}
N 1410 90 1470 90 { lab=SO_N}
N 1470 30 1470 90 { lab=SO_N}
N 1020 40 1020 120 { lab=SO}
N 1020 -40 1020 -20 { lab=VDD}
N 950 10 980 10 { lab=CLK}
N 1510 -0 1540 0 { lab=CLK}
N 1450 -0 1470 0 { lab=VDD}
N 1450 -40 1450 -0 { lab=VDD}
N 1020 10 1040 10 { lab=VDD}
N 1040 -30 1040 10 { lab=VDD}
N 1020 -30 1040 -30 { lab=VDD}
N 1130 240 1130 310 { lab=#net1}
N 1090 310 1130 310 { lab=#net1}
N 1310 250 1310 310 { lab=#net2}
N 1310 310 1370 310 { lab=#net2}
N 1090 340 1120 340 { lab=VSS}
N 1350 340 1370 340 { lab=VSS}
N 1090 370 1090 420 { lab=#net3}
N 1090 420 1370 420 { lab=#net3}
N 1370 370 1370 420 { lab=#net3}
N 1240 420 1240 450 { lab=#net3}
N 1240 510 1240 540 { lab=VSS}
N 990 340 1050 340 { lab=VIN}
N 1410 340 1460 340 { lab=VIP}
N 1160 480 1200 480 { lab=CLK}
N 1240 480 1310 480 { lab=VSS}
N 950 340 950 370 { lab=VIN}
N 950 340 990 340 { lab=VIN}
N 1500 340 1500 370 { lab=VIP}
N 1460 340 1500 340 { lab=VIP}
C {sky130_fd_pr/nfet_01v8.sym} 1290 200 0 0 {name=M1
L=0.15
W=3
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
C {sky130_fd_pr/nfet_01v8.sym} 1150 200 0 1 {name=M2
L=0.15
W=3
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
C {sky130_fd_pr/pfet_01v8.sym} 1150 20 0 1 {name=M3
L=0.15
W=2
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
C {sky130_fd_pr/pfet_01v8.sym} 1290 20 0 0 {name=M4
L=0.15
W=2
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
C {devices/lab_pin.sym} 1210 -40 0 0 {name=l3 sig_type=std_logic lab=VDD}
C {sky130_fd_pr/pfet_01v8.sym} 1490 0 0 1 {name=M5
L=0.15
W=2
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
C {sky130_fd_pr/pfet_01v8.sym} 1000 10 0 0 {name=M6
L=0.15
W=2
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
C {sky130_fd_pr/nfet_01v8.sym} 1390 340 0 1 {name=M7
L=0.15
W=3
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
C {sky130_fd_pr/nfet_01v8.sym} 1070 340 0 0 {name=M8
L=0.15
W=3
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
C {sky130_fd_pr/nfet_01v8.sym} 1220 480 0 0 {name=M9
L=0.15
W=3
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
C {devices/lab_pin.sym} 1240 530 0 0 {name=l1 sig_type=std_logic lab=VSS
}
C {devices/lab_pin.sym} 950 10 0 0 {name=l2 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} 1160 480 0 0 {name=l4 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} 1540 0 2 0 {name=l5 sig_type=std_logic lab=CLK}
C {devices/lab_pin.sym} 1500 370 3 0 {name=l12 sig_type=std_logic lab=VIP
}
C {devices/lab_pin.sym} 1300 480 2 0 {name=l14 sig_type=std_logic lab=VSS
}
C {devices/lab_pin.sym} 1360 340 0 0 {name=l15 sig_type=std_logic lab=VSS
}
C {devices/lab_pin.sym} 1120 340 2 0 {name=l16 sig_type=std_logic lab=VSS
}
C {devices/lab_pin.sym} 950 360 0 0 {name=l13 sig_type=std_logic lab=VIN
}
C {devices/iopin.sym} 440 130 0 0 {name=p1 lab=VDD}
C {devices/iopin.sym} 440 160 0 0 {name=p2 lab=VSS}
C {devices/ipin.sym} 450 200 0 0 {name=p3 lab=CLK}
C {devices/ipin.sym} 450 240 0 0 {name=p4 lab=VIN}
C {devices/ipin.sym} 450 270 0 0 {name=p5 lab=VIP}
C {devices/opin.sym} 450 290 0 0 {name=p6 lab=SO
}
C {devices/lab_pin.sym} 1330 200 2 0 {name=l6 sig_type=std_logic lab=VSS
}
C {devices/lab_pin.sym} 1110 200 0 0 {name=l9 sig_type=std_logic lab=VSS
}
C {devices/lab_pin.sym} 1130 130 0 0 {name=l7 sig_type=std_logic lab=SO}
C {devices/lab_pin.sym} 1310 130 2 0 {name=l8 sig_type=std_logic lab=SO_N
_N}
