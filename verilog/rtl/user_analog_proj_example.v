// SPDX-FileCopyrightText: 2020 Efabless Corporation
//
// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//      http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.
// SPDX-License-Identifier: Apache-2.0

`default_nettype none

`include "example_por.v"

/*
 * I/O mapping for analog
 *
 * mprj_io[37]  io_in/out/oeb/in_3v3[26]  ---                    ---
 * mprj_io[36]  io_in/out/oeb/in_3v3[25]  ---                    ---
 * mprj_io[35]  io_in/out/oeb/in_3v3[24]  gpio_analog/noesd[17]  ---
 * mprj_io[34]  io_in/out/oeb/in_3v3[23]  gpio_analog/noesd[16]  ---
 * mprj_io[33]  io_in/out/oeb/in_3v3[22]  gpio_analog/noesd[15]  ---
 * mprj_io[32]  io_in/out/oeb/in_3v3[21]  gpio_analog/noesd[14]  ---
 * mprj_io[31]  io_in/out/oeb/in_3v3[20]  gpio_analog/noesd[13]  ---
 * mprj_io[30]  io_in/out/oeb/in_3v3[19]  gpio_analog/noesd[12]  ---
 * mprj_io[29]  io_in/out/oeb/in_3v3[18]  gpio_analog/noesd[11]  ---
 * mprj_io[28]  io_in/out/oeb/in_3v3[17]  gpio_analog/noesd[10]  ---
 * mprj_io[27]  io_in/out/oeb/in_3v3[16]  gpio_analog/noesd[9]   ---
 * mprj_io[26]  io_in/out/oeb/in_3v3[15]  gpio_analog/noesd[8]   ---
 * mprj_io[25]  io_in/out/oeb/in_3v3[14]  gpio_analog/noesd[7]   ---
 * mprj_io[24]  ---                       ---                    user_analog[10]
 * mprj_io[23]  ---                       ---                    user_analog[9]
 * mprj_io[22]  ---                       ---                    user_analog[8]
 * mprj_io[21]  ---                       ---                    user_analog[7]
 * mprj_io[20]  ---                       ---                    user_analog[6]  clamp[2]
 * mprj_io[19]  ---                       ---                    user_analog[5]  clamp[1]
 * mprj_io[18]  ---                       ---                    user_analog[4]  clamp[0]
 * mprj_io[17]  ---                       ---                    user_analog[3]
 * mprj_io[16]  ---                       ---                    user_analog[2]
 * mprj_io[15]  ---                       ---                    user_analog[1]
 * mprj_io[14]  ---                       ---                    user_analog[0]
 * mprj_io[13]  io_in/out/oeb/in_3v3[13]  gpio_analog/noesd[6]   ---
 * mprj_io[12]  io_in/out/oeb/in_3v3[12]  gpio_analog/noesd[5]   ---
 * mprj_io[11]  io_in/out/oeb/in_3v3[11]  gpio_analog/noesd[4]   ---
 * mprj_io[10]  io_in/out/oeb/in_3v3[10]  gpio_analog/noesd[3]   ---
 * mprj_io[9]   io_in/out/oeb/in_3v3[9]   gpio_analog/noesd[2]   ---
 * mprj_io[8]   io_in/out/oeb/in_3v3[8]   gpio_analog/noesd[1]   ---
 * mprj_io[7]   io_in/out/oeb/in_3v3[7]   gpio_analog/noesd[0]   ---
 * mprj_io[6]   io_in/out/oeb/in_3v3[6]   ---                    ---
 * mprj_io[5]   io_in/out/oeb/in_3v3[5]   ---                    ---
 * mprj_io[4]   io_in/out/oeb/in_3v3[4]   ---                    ---
 * mprj_io[3]   io_in/out/oeb/in_3v3[3]   ---                    ---
 * mprj_io[2]   io_in/out/oeb/in_3v3[2]   ---                    ---
 * mprj_io[1]   io_in/out/oeb/in_3v3[1]   ---                    ---
 * mprj_io[0]   io_in/out/oeb/in_3v3[0]   ---                    ---
 *
 */

/*
 *----------------------------------------------------------------
 *
 * user_analog_proj_example
 *
 * This is an example of a (trivially simple) analog user project,
 * showing how the user project can connect to the I/O pads, both
 * the digital pads, the analog connection on the digital pads,
 * and the dedicated analog pins used as an additional power supply
 * input, with a connected ESD clamp.
 *
 * See the testbench in directory "mprj_por" for the example
 * program that drives this user project.
 *
 *----------------------------------------------------------------
 */

module user_analog_proj_example (
`ifdef USE_POWER_PINS
    inout vdda1,	// User area 1 3.3V supply
    inout vdda2,	// User area 2 3.3V supply
    inout vssa1,	// User area 1 analog ground
    inout vssa2,	// User area 2 analog ground
    inout vccd1,	// User area 1 1.8V supply
    inout vccd2,	// User area 2 1.8v supply
    inout vssd1,	// User area 1 digital ground
    inout vssd2,	// User area 2 digital ground
`endif

    // Wishbone Slave ports (WB MI A)
    input wb_clk_i,
    input wb_rst_i,
    input wbs_stb_i,
    input wbs_cyc_i,
    input wbs_we_i,
    input [3:0] wbs_sel_i,
    input [31:0] wbs_dat_i,
    input [31:0] wbs_adr_i,
    output wbs_ack_o,
    output [31:0] wbs_dat_o,

    // Logic Analyzer Signals
    input  [127:0] la_data_in,
    output [127:0] la_data_out,
    input  [127:0] la_oenb,

    // IOs
    input  [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_in,
    input  [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_in_3v3,
    output [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_out,
    output [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_oeb,

    // GPIO-analog
    inout [`MPRJ_IO_PADS-`ANALOG_PADS-10:0] gpio_analog,
    inout [`MPRJ_IO_PADS-`ANALOG_PADS-10:0] gpio_noesd,

    // Dedicated analog
    inout [`ANALOG_PADS-1:0] io_analog,
    inout [2:0] io_clamp_high,
    inout [2:0] io_clamp_low,

    // Clock
    input   user_clock2,

    // IRQ
    output [2:0] irq
);
    wire [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_in_3v3;
    wire [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-`ANALOG_PADS-1:0] io_oeb;
    wire [`ANALOG_PADS-1:0] io_analog;

    // wire [31:0] rdata; 
    // wire [31:0] wdata;

    // wire valid;
    // wire [3:0] wstrb;

    wire isupply;	// Independent 3.3V supply
    wire io16, io15, io12, io11;

    // WB MI A
    // assign valid = wbs_cyc_i && wbs_stb_i; 
    // assign wstrb = wbs_sel_i & {4{wbs_we_i}};
    // assign wbs_dat_o = rdata;
    // assign wdata = wbs_dat_i;

    // IO --- unused (no need to connect to anything)
    // assign io_out[`MPRJ_IO_PADS-`ANALOG_PADS-1:17] = 0;
    // assign io_out[14:13] = 11'b0;
    // assign io_out[10:0] = 11'b0;

    // assign io_oeb[`MPRJ_IO_PADS-`ANALOG_PADS-1:17] = -1;
    // assign io_oeb[14:13] = 11'b1;
    // assign io_oeb[10:0] = 11'b1;

    // IO --- enable outputs on 11, 12, 15, and 16
    assign io_out[12:11] = {io12, io11};
    assign io_oeb[12:11] = {vssd1, vssd1};

    assign io_out[16:15] = {io16, io15};
    assign io_oeb[16:15] = {vssd1, vssd1};

    // IRQ
    assign irq = 3'b000;	// Unused

    // LA --- unused (no need to connect to anything)
    // assign la_data_out = {128{1'b0}};	// Unused

    // Instantiate the POR.  Connect the digital power to user area 1
    // VCCD, and connect the analog power to user area 1 VDDA.

    // Monitor the 3.3V output with mprj_io[10] = gpio_analog[3]
    // Monitor the 1.8V outputs with mprj_io[11,12] = io_out[11,12]
    
//---------------------------------- user middle wire ----------------------------
    wire clk;
    wire rst;
    
    wire [`MPRJ_IO_PADS-1:0] io_in;
    wire [`MPRJ_IO_PADS-1:0] io_out;
    wire [`MPRJ_IO_PADS-1:0] io_oeb;

    wire wb_we_i;
    wire [31:0] wb_addr_i;
    wire [31:0] wdata;
    wire VCLP;
    wire iref0, iref1, iref2, iref3;
    wire EN;
    wire halt;

    assign clk = wb_clk_i;
    assign rst = wb_rst_i;
    assign wb_we_i = wbs_we_i;
    assign wb_addr_i = wbs_adr_i;
    assign wdata = wbs_dat_i;
    assign wbs_dat_o = wdata;
    assign EN = io_analog[9];
    assign VCLP = io_analog[10];
    assign iref0 = io_analog[8];
    assign iref1 = io_analog[7];
    assign iref2 = io_analog[3];
    assign iref3 = io_analog[2];
    assign halt = la_data_out[0];
    

   
//--------------------------------------------------------------------------------------------------
    SRAM_Wrapper_top SRAM_Wrapper_top_DUT(
	.VDD(vccd1),
	.VSS(vssd2),
	.clk(clk),					// Common clock
	.reset_n(rst),					//wb_rst_i
	.wbs_we_i(wb_we_i),				//wbs_we_i=0 for read ;wbs_we_i=1 for write				      
	.wishbone_buffer_data_in(wdata),      		//wbs_dat_i,  
	.wishbone_databus_out(wdata),			//wbs_dat_o
	.wishbone_rw_addr(wb_addr_i),    		//wishbone_addr				
	.Iref0(iref0),					// Reference inputs for ADC ,Connect to Aalog IO	
	.Iref1(iref1), 				// Reference inputs for ADC ,Connect to Aalog IO
	.Iref2(iref2),					// Reference inputs for ADC ,Connect to Aalog IO
	.Iref3(iref3),					// Reference inputs for ADC ,Connect to Aalog IO
	.VCLP(VCLP),					// Connect to Aalog IO
	.EN(EN),					// connect to Analog IO
	.halt(halt)					//  LA
		
	);
        
//-----------------------------------------------------------------------------------------------
//====================================================================================================
    example_por por1 (
	`ifdef USE_POWER_PINS
	    .vdd3v3(vdda1),
	    .vdd1v8(vccd1),
	    .vss(vssa1),
	`endif
	.porb_h(gpio_analog[3]),	// 3.3V domain output
	.porb_l(io11),			// 1.8V domain output
	.por_l(io12)			// 1.8V domain output
    );

//------------------------------------------------------------------------------------------------
    // Instantiate 2nd POR with the analog power supply on one of the
    // analog pins.  NOTE:  io_analog[4] = mproj_io[18] and is the same
    // pad with io_clamp_high/low[0].

    `ifdef USE_POWER_PINS
	assign isupply = io_analog[4];
    	assign io_clamp_high[0] = isupply;
    	assign io_clamp_low[0] = vssa1;

	// Tie off remaining clamps
    	assign io_clamp_high[2:1] = vssa1;
    	assign io_clamp_low[2:1] = vssa1;
    `endif

    // Monitor the 3.3V output with mprj_io[25] = gpio_analog[7]
    // Monitor the 1.8V outputs with mprj_io[26,27] = io_out[15,16]


endmodule
//=======================================================================================
//===========================SRAM Wrapper Top module =============================

// Design name : SRAM_Wrapper_top
// Date 	: 12-Sept-2022
// Version 	: V1
// Function	: This inlcudes top module containing instantiations of controller ,Buffers, Dummy module of analog array
//================================================================================

module SRAM_Wrapper_top(
VDD,
VSS,
clk,						// Common clock
reset_n,					//wb_rst_i
wbs_we_i,					//wbs_we_i=0 for read ;wbs_we_i=1 for write				      
wishbone_buffer_data_in,      			//wbs_dat_i,  
wishbone_databus_out,				//wbs_dat_o
wishbone_rw_addr,    				//wishbone_addr				
Iref0, Iref1, Iref2,Iref3,			// Reference inputs for ADC				 (GPIO)
VCLP,						// Connect to Aalog IO
EN,						// connect to Analog IO
halt						//  LA	
);


//===================================================================================================
input clk;
input reset_n;
input wbs_we_i ;				//Common Inputs for buffers		

input [31:0] wishbone_buffer_data_in; 

input VCLP;
input EN; 			
input Iref0;
input Iref1;
input Iref2;
input Iref3;
inout VDD,VSS;
input [31:0] wishbone_rw_addr;
output reg [31:0] wishbone_databus_out;	// Output signals for Output buffer


//=============================== Signal Declaration =========================================
wire wishbone_buffer_rd_en ;
wire wishbone_buffer_wr_en ;
wire [63:0] out_bus_large;			// Output signals for Output buffer
wire PRE_SRAM;
wire [15:0] WWL;
wire WE;
wire PRE_VLSA; 
wire PRE_CLSA; 
wire PRE_A;
wire [15:0] RWL; 
wire [15:0] RWLB;
wire SAEN; 
wire data_ready_signal_output; 
wire writing_finished_signal_output; 
wire busy_signal_output;

wire [63:0] IMC_out;
wire [15:0]  SA_OUT;
output reg halt;
wire [15:0] Din;
wire [3:0] address_input;
wire en_dec;
wire imc_en;
wire mem_en;
wire rw;
wire Input_buffer_rd_en;
wire Weight_buffer_rd_en;
wire sram_data_rd_enable;
wire [15:0] IB_out;
wire Output_buffer_wr_en;
reg [31:0] flag ;						// can goto LA
//========================= FLAGS =============================================================
wire wait_IM;
wire IN_buffer_empty ;				// Output for input buffer
wire IN_buffer_full ;
wire [3:0] IN_fifo_cnt;			// Output for input buffer
wire Weight_buffer_empty ;			// Output for weight buffer
wire Weight_buffer_full ;			// Output for weight buffer
wire [3:0] Weight_buffer_fifo_cnt;
wire Output_buffer_empty ;			// Output signals for Output buffer
wire Output_buffer_full;			// Output signals for Output buffer
wire [3:0] Output_buffer_fifo_cnt;
wire SA_buffer_empty;
wire SA_buffer_full;
wire [3:0] SA_buffer_fifo_cnt;
wire [3:0] state_reg_cntrl;
wire lsb_data_read_en;
wire msb_data_read_en;
wire [15:0]sram_read_data;
reg [31:0 ]instruction;
reg Input_buffer_wr_en;
reg Weight_buffer_wr_en;

//=====================================================================================================
//==================================================================================================
reg [7:0]WWLD;
reg [3:0] rd_input_addr;
reg [3:0] rd_weight_addr;
reg [3:0] wr_SA_addr;
reg [3:0] wr_OB_addr;

//=============================================================================================
reg [5:0]AddCounterWt ;
reg [5:0]AddCounterInBuff ;
reg [5:0]AddCounterSA ;
reg [5:0]AddCounterOB ;

//=============================================================================================



assign WWLD = {9{en_dec}} & (1'b1 <<wishbone_rw_addr[18:16]);


assign wishbone_buffer_wr_en = wbs_we_i;
assign wishbone_buffer_rd_en = ~(wbs_we_i);

assign lsb_data_read_en= wishbone_rw_addr[19];
assign msb_data_read_en= wishbone_rw_addr[20];

always @(posedge clk or negedge reset_n ) begin


	if (!reset_n) begin 
	 AddCounterWt <= 0; 
	 AddCounterInBuff <= 0;
	 AddCounterOB<=0;
	 AddCounterSA<=0; 
	end else begin 
		if (IncrementWtAddr) begin 
	 	rd_weight_addr	<=  AddCounterWt; 
	 	AddCounterWt++; 
		end  
		if (AddCounterInBuff) begin 
	 	rd_input_addr	<= AddCounterInBuff ; 
	 	AddCounterInBuff++; 
		end  
		if (IncrementSAbuffAddr) begin 
	 	wr_SA_addr	<=  AddCounterSA; 
	 	AddCounterSA++; 
		end  
		if (IncrementOBbuffAddr) begin 
	 	wr_OB_addr	<= AddCounterOB ; 
	 	AddCounterOB++; 
		end  
	end 
end

//===============================
always @(posedge clk) begin
	flag<= {IN_buffer_empty, IN_buffer_full, IN_fifo_cnt,  Weight_buffer_empty, Weight_buffer_full, Weight_buffer_fifo_cnt, Output_buffer_empty, Output_buffer_full, Output_buffer_fifo_cnt, SA_buffer_empty, SA_buffer_full,SA_buffer_fifo_cnt, wait_IM,  data_ready_signal_output, writing_finished_signal_output,busy_signal_output,state_reg_cntrl};
	
	if(lsb_data_read_en && ~sram_data_rd_enable) begin
		wishbone_databus_out <= out_bus_large[31:0];
	end
	else if (msb_data_read_en && ~sram_data_rd_enable)begin
		wishbone_databus_out <= out_bus_large[63:32];
	end
	else if(sram_data_rd_enable && ~lsb_data_read_en && ~msb_data_read_en) begin
		wishbone_databus_out[15:0] <= sram_read_data;
		wishbone_databus_out[31:16] <=16'b0;
	end
	else begin
		wishbone_databus_out <= flag;
	end
end

//===============================================================================================
always @(posedge clk) begin

	if (reset_n)begin
	
		    case(wishbone_rw_addr[31:24])
			8'h31:				//Instruction register write 
			begin			
			instruction<=wishbone_buffer_data_in;
			end
			
			8'h32:				//Input buffer write enable
			begin
			Input_buffer_wr_en<=wishbone_buffer_wr_en;
			Weight_buffer_wr_en<=0;
			end
			
			8'h33:				//Weight buffer write enable
			begin
			Input_buffer_wr_en<=0;
			Weight_buffer_wr_en<=wishbone_buffer_wr_en;
			end
			
			default:
			begin
			Input_buffer_wr_en<=0;
			Weight_buffer_wr_en<=0;
			end
			
		   endcase
	end
end


//======================  MODULES  INSTANTIATION ====================================================


//======================== Instruction Decoder instantiation =========================================

instruction_decoder DUT_decoder(
.clk(clk), 
.reset(reset_n),
.instr(instruction),
.halt(halt),
.address_input(address_input), 
.en_dec(en_dec),
.imc_en(imc_en),
.mem_en(mem_en),
.rw(rw),
.wait_IM(wait_IM),
.Input_buffer_rd_en(Input_buffer_rd_en),
.Weight_buffer_rd_en(Weight_buffer_rd_en),
.sram_data_rd_enable(sram_data_rd_enable)
);

//=========== Instantiation for Input buffer ==========================
sync_fifo_16x16  DUT_sync_fifo_input_buffer (
.clk(clk)  ,
.rst_n(reset_n)  ,
.data_in(wishbone_buffer_data_in[15:0]) ,
.rd_en(Input_buffer_rd_en)  , 			// will come from instruction decoder
.wr_en(Input_buffer_wr_en)  , 			// will come from wishbone 
.data_out(IB_out),			 	// will go to IB_out of sram controller
.empty(IN_buffer_empty)    ,
.full(IN_buffer_full),
.fifo_cnt(IN_fifo_cnt),
.wr_addr(wishbone_rw_addr[3:0]),
.rd_addr(rd_input_addr)	
);    


//=========== Buffer Instantiation for Weight buffer ========================
sync_fifo_16x16  DUT_sync_fifo_Weight_buffer (
.clk(clk)  ,
.rst_n(reset_n)  ,
.data_in(wishbone_buffer_data_in[15:0]) ,	// wishbone data in
.rd_en(Weight_buffer_rd_en)   , 	       
.wr_en(Weight_buffer_wr_en)   ,           	// will come from wishbone 
.data_out(Din), 				// will go to SRAM data in 
.empty( Weight_buffer_empty)   ,
.full( Weight_buffer_full),
.fifo_cnt(Weight_buffer_fifo_cnt),
.wr_addr(wishbone_rw_addr[3:0]),
.rd_addr(rd_weight_addr)
); 


//=========== Buffer Instantiation for SA_OUT buffer ========================
sync_fifo_16x16  DUT_sync_fifo_SA_OUT (
.clk(clk)  ,
.rst_n(reset_n)  ,
.data_in(SA_OUT) ,				// will come form SRAM memory read output
.rd_en(wishbone_buffer_rd_en)   , 	       
.wr_en(sram_data_rd_enable)   ,           	// will come from instruction decoder
.data_out(sram_read_data), 			// will go to wishbone data bus output
.empty( SA_buffer_empty)   ,
.full( SA_buffer_full),
.fifo_cnt(SA_buffer_fifo_cnt),
.wr_addr(wr_SA_addr),
.rd_addr(wishbone_rw_addr[3:0])
); 

//=========== Buffer Instantiation for Output buffer ===============
sync_fifo_64x16  DUT_sync_fifo_Output_buffer (
.clk(clk)  ,
.rst_n(reset_n)  ,
.data_in(IMC_out) ,				// will come from IMC_out(array output)
.rd_en(wishbone_buffer_rd_en)    , 		// will come from wishbone read en or instruction decoder
.wr_en(Output_buffer_wr_en)    ,   		// from FSM / Instruction decoder
.data_out(out_bus_large), 	      		//output_buffer_data_out      /// ==================  sochna hai  =========
.empty( Output_buffer_empty)    ,
.full( Output_buffer_full),
.fifo_cnt(Output_buffer_fifo_cnt),
.wr_addr(wr_OB_addr),
.rd_addr(wishbone_rw_addr[3:0])
); 

//===========================================================================

//===========SRAM Controller Instantiation  ========================

sram_controller DUT_sram_control(
.clk(clk), 
.reset(reset_n), 
.rw(rw), 
.address_input(address_input), 
.PRE_SRAM(PRE_SRAM),
.WWL(WWL), 
.WE(WE), 
.PRE_VLSA(PRE_VLSA), 
.data_ready_signal_output(data_ready_signal_output), 
.writing_finished_signal_output(writing_finished_signal_output),
.busy_signal_output(busy_signal_output),
.IB_out(IB_out),
.en_dec(en_dec),
.mem_en(mem_en),
.imc_en(imc_en),
.PRE_CLSA(PRE_CLSA),
.PRE_A(PRE_A),
.RWL(RWL),
.RWLB(RWLB),
.SAEN(SAEN), 
.state_reg(state_reg_cntrl),
.halt(halt),
.Output_buffer_wr_en(Output_buffer_wr_en),
.IncrementWtAddr(IncrementWtAddr),
.IncrementInbuffAddr(IncrementInbuffAddr),
.IncrementSAbuffAddr(IncrementSAbuffAddr),
.IncrementOBbuffAddr(IncrementOBbuffAddr)
);

//============================ SRAM Array Analog part instantiation =======================

Integrated_bitcell_with_dummy_cells  DUT (
.WWL(WWL),
.WWLD(WWLD),
.RWL(RWL),
.RWLB(RWLB),
.Din(Din),
.WE(WE), 
.PRE_SRAM(PRE_SRAM),
.PRE_VLSA(PRE_VLSA), 
.PRE_CLSA(PRE_CLSA),
.PRE_A(PRE_A), 
.SAEN(SAEN),
.VCLP(VCLP),
.EN(EN),
.Iref0(Iref0), 
.Iref1(Iref1), 
.Iref2(Iref2),
.Iref3(Iref3),
.VSS(VSS),
.VDD(VDD),
.ADC0_OUT(IMC_out[3:0]),
.ADC1_OUT(IMC_out[7:4]),
.ADC2_OUT(IMC_out[11:8]),
.ADC3_OUT(IMC_out[15:12]),
.ADC4_OUT(IMC_out[19:16]),
.ADC5_OUT(IMC_out[23:20]),
.ADC6_OUT(IMC_out[27:24]),
.ADC7_OUT(IMC_out[31:28]),
.ADC8_OUT(IMC_out[35:32]),
.ADC9_OUT(IMC_out[39:36]),
.ADC10_OUT(IMC_out[43:40]),
.ADC11_OUT(IMC_out[47:44]),
.ADC12_OUT(IMC_out[51:48]),
.ADC13_OUT(IMC_out[55:52]),
.ADC14_OUT(IMC_out[59:56]),
.ADC15_OUT(IMC_out[63:60]),
.SA_OUT(SA_OUT)

);

//=========================================================================================


endmodule




//=========================================================================================
endmodule

`default_nettype wire
