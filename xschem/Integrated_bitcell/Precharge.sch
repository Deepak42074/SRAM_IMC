v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 2590 -3490 3120 -3490 { lab=PRE_SRAM}
N 2550 -3580 2550 -3520 { lab=VDD}
N 2550 -3580 3160 -3580 { lab=VDD}
N 3160 -3580 3160 -3520 { lab=VDD}
N 3160 -3490 3170 -3490 { lab=VDD}
N 3170 -3520 3170 -3490 { lab=VDD}
N 3160 -3520 3170 -3520 { lab=VDD}
N 2530 -3490 2550 -3490 { lab=VDD}
N 2530 -3520 2530 -3490 { lab=VDD}
N 2530 -3520 2550 -3520 { lab=VDD}
N 2550 -3370 2850 -3370 { lab=BL}
N 2910 -3370 3160 -3370 { lab=BLB}
N 2880 -3370 2880 -3320 { lab=VDD}
N 2880 -3490 2880 -3410 { lab=PRE_SRAM}
N 2870 -3640 2870 -3580 { lab=VDD}
N 2880 -3520 2880 -3490 { lab=PRE_SRAM}
N 2880 -3530 2880 -3520 { lab=PRE_SRAM}
N 2550 -3460 2550 -3300 {
lab=BL}
N 3160 -3460 3160 -3300 {
lab=BLB}
C {sky130_fd_pr/pfet_01v8.sym} 2570 -3490 0 1 {name=M7
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
C {sky130_fd_pr/pfet_01v8.sym} 3140 -3490 0 0 {name=M8
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
C {sky130_fd_pr/pfet_01v8.sym} 2880 -3390 3 1 {name=M9
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
C {devices/lab_pin.sym} 2870 -3640 0 0 {name=l22 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} 2880 -3320 0 0 {name=l23 sig_type=std_logic lab=VDD
}
C {devices/lab_pin.sym} 2880 -3530 0 0 {name=l16 sig_type=std_logic lab=PRE_SRAM
}
C {devices/lab_pin.sym} 2550 -3300 0 0 {name=l1 sig_type=std_logic lab=BL}
C {devices/lab_pin.sym} 3160 -3300 0 0 {name=l2 sig_type=std_logic lab=BLB}
C {devices/ipin.sym} 2240 -3600 0 0 {name=p1 lab=PRE_SRAM}
C {devices/iopin.sym} 2220 -3550 0 0 {name=p2 lab=VDD}
C {devices/iopin.sym} 2220 -3510 0 0 {name=p3 lab=BL}
C {devices/iopin.sym} 2220 -3480 0 0 {name=p4 lab=BLB}
