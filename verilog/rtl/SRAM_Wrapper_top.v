// Design name : SRAM_top

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
