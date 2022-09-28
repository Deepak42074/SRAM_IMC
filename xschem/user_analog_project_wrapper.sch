v {xschem version=3.0.0 file_version=1.2 }
G {}
K {}
V {}
S {}
E {}
N 3640 -180 3710 -180 {
lab=wb_clk_i}
N 3640 -160 3710 -160 {
lab=wb_rst_i}
N 3640 -140 3710 -140 {
lab=wbs_we_i}
N 3640 -120 3710 -120 {
lab=wbs_dat_i[31:0]}
N 3640 -100 3710 -100 {
lab=io_analog[10]}
N 3640 -80 3710 -80 {
lab=io_analog[9]}
N 3640 -60 3710 -60 {
lab=io_analog[8]}
N 3640 -40 3710 -40 {
lab=io_analog[7]}
N 3640 -20 3710 -20 {
lab=io_analog[3]}
N 3640 0 3710 0 {
lab=io_analog[2]}
N 3640 20 3710 20 {
lab=wbs_adr_i[31:0]}
N 3870 70 3870 100 {
lab=vssd1}
N 4010 -80 4060 -80 {
lab=wbs_dat_o[31:0]}
N 3860 -250 3860 -230 {
lab=vccd1}
N 4010 -110 4060 -110 {
lab=la_data_out[0]}
C {devices/iopin.sym} 3240 -470 0 0 {name=p1 lab=vdda1}
C {devices/iopin.sym} 3240 -440 0 0 {name=p2 lab=vdda2}
C {devices/iopin.sym} 3240 -410 0 0 {name=p3 lab=vssa1}
C {devices/iopin.sym} 3240 -380 0 0 {name=p4 lab=vssa2}
C {devices/iopin.sym} 3240 -350 0 0 {name=p5 lab=vccd1}
C {devices/iopin.sym} 3240 -320 0 0 {name=p6 lab=vccd2}
C {devices/iopin.sym} 3240 -290 0 0 {name=p7 lab=vssd1}
C {devices/iopin.sym} 3240 -260 0 0 {name=p8 lab=vssd2}
C {devices/ipin.sym} 3290 -190 0 0 {name=p9 lab=wb_clk_i}
C {devices/ipin.sym} 3290 -160 0 0 {name=p10 lab=wb_rst_i}
C {devices/ipin.sym} 3290 -130 0 0 {name=p11 lab=wbs_stb_i}
C {devices/ipin.sym} 3290 -100 0 0 {name=p12 lab=wbs_cyc_i}
C {devices/ipin.sym} 3290 -70 0 0 {name=p13 lab=wbs_we_i}
C {devices/ipin.sym} 3290 -40 0 0 {name=p14 lab=wbs_sel_i[3:0]}
C {devices/ipin.sym} 3290 -10 0 0 {name=p15 lab=wbs_dat_i[31:0]}
C {devices/ipin.sym} 3290 20 0 0 {name=p16 lab=wbs_adr_i[31:0]}
C {devices/opin.sym} 3280 80 0 0 {name=p17 lab=wbs_ack_o}
C {devices/opin.sym} 3280 110 0 0 {name=p18 lab=wbs_dat_o[31:0]}
C {devices/ipin.sym} 3290 150 0 0 {name=p19 lab=la_data_in[127:0]}
C {devices/ipin.sym} 3290 260 0 0 {name=p21 lab=io_in[26:0]}
C {devices/ipin.sym} 3290 290 0 0 {name=p22 lab=io_in_3v3[26:0]}
C {devices/ipin.sym} 3280 570 0 0 {name=p23 lab=user_clock2}
C {devices/opin.sym} 3280 320 0 0 {name=p24 lab=io_out[26:0]}
C {devices/opin.sym} 3280 350 0 0 {name=p25 lab=io_oeb[26:0]}
C {devices/iopin.sym} 3250 410 0 0 {name=p26 lab=gpio_analog[17:0]}
C {devices/iopin.sym} 3250 440 0 0 {name=p27 lab=gpio_noesd[17:0]}
C {devices/iopin.sym} 3250 470 0 0 {name=p29 lab=io_analog[10:0]}
C {devices/iopin.sym} 3250 500 0 0 {name=p30 lab=io_clamp_high[2:0]}
C {devices/iopin.sym} 3250 530 0 0 {name=p31 lab=io_clamp_low[2:0]}
C {devices/opin.sym} 3270 600 0 0 {name=p32 lab=user_irq[2:0]}
C {devices/ipin.sym} 3290 210 0 0 {name=p28 lab=la_oenb[127:0]}
C {SRAM_Wrapper_top.sym} 1750 1390 0 0 {name=x1}
C {devices/lab_pin.sym} 3860 -250 0 0 {name=l1 sig_type=std_logic lab=vccd1}
C {devices/lab_pin.sym} 3640 -180 0 0 {name=l2 sig_type=std_logic lab=wb_clk_i}
C {devices/lab_pin.sym} 3640 -160 0 0 {name=l3 sig_type=std_logic lab=wb_rst_i}
C {devices/lab_pin.sym} 3640 -140 0 0 {name=l4 sig_type=std_logic lab=wbs_we_i}
C {devices/lab_pin.sym} 3640 -120 0 0 {name=l5 sig_type=std_logic lab=wbs_dat_i[31:0]}
C {devices/lab_pin.sym} 3640 -100 0 0 {name=l6 sig_type=std_logic lab=io_analog[10]}
C {devices/lab_pin.sym} 3640 -80 0 0 {name=l7 sig_type=std_logic lab=io_analog[9]}
C {devices/lab_pin.sym} 3640 -60 0 0 {name=l8 sig_type=std_logic lab=io_analog[8]}
C {devices/lab_pin.sym} 3640 -40 0 0 {name=l9 sig_type=std_logic lab=io_analog[7]}
C {devices/lab_pin.sym} 3640 -20 0 0 {name=l10 sig_type=std_logic lab=io_analog[3]}
C {devices/lab_pin.sym} 3640 0 0 0 {name=l11 sig_type=std_logic lab=io_analog[2]}
C {devices/lab_pin.sym} 3640 20 0 0 {name=l12 sig_type=std_logic lab=wbs_adr_i[31:0]}
C {devices/lab_pin.sym} 4060 -80 2 0 {name=l13 sig_type=std_logic lab=wbs_dat_o[31:0]}
C {devices/lab_pin.sym} 3870 100 0 0 {name=l14 sig_type=std_logic lab=vssd1}
C {devices/lab_pin.sym} 4060 -110 2 0 {name=l15 sig_type=std_logic lab=la_data_out[0]}
