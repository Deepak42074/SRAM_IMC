`timescale 1ns / 1ps
module sram_controller(clk, reset, rw, address_input, PRE_SRAM,WWL, WE, PRE_VLSA, data_ready_signal_output, writing_finished_signal_output, busy_signal_output,IB_out,en_dec,imc_en,PRE_CLSA,PRE_A,RWL,RWLB,SAEN, mem_en,halt,state_reg,Output_buffer_wr_en,IncrementWtAddr,IncrementInbuffAddr,IncrementSAbuffAddr,IncrementOBbuffAddr);

//=================  INPUTS  ==========================================
 input wire clk ;                                     //  Clock signal
 input wire reset;                                    //  start operation signal
 input wire rw;                                       //  With this signal, we select reading or writing operation
 						       //  rw=1 :for read;  rw=0: for write operation
 input wire [3:0] address_input;                      //  Address bus input for decoding logic
 input wire imc_en;				       // imc_en=0 : idle state; imc_en=1 for IMC mode
 input wire mem_en;				       // mem_en=1 : for memory mode; imc_en=0 idle state
 input wire en_dec;				       //Enable for decoder
 input wire [15:0] IB_out;			       //Input buffer output which is input to WL driver
 


//================  OUTPUTS  =========================================== 
 
 output reg [15:0] WWL;        			 //  Address bus decoder output to Wordlines
 output reg WE;                    			 //  Write enable for write driver   (generated when rw=1)
 output reg PRE_VLSA;                    	    	 //   Sense Amp enable for memory read (generated when rw=0)
 output reg PRE_SRAM; 				         // Precharge for memory read and write
 output reg PRE_CLSA; 				         // Precharge for current latch SA(CLSA)
 output reg PRE_A; 			   		 // RBL bitlinePrecharge for IMC for eahc column
 //output reg EN; 			   		 //  Enable for bitline column.
 output reg [15:0] RWL; 			    	 // Input for SRAM IMC operation
 output reg [15:0] RWLB; 			    	 // Input for SRAM IMC operation
 output reg SAEN;				    	 // sense enable for CLSA
// output reg [7:0] WWLD;
 //======================   FLAGS   ====================================
 output reg data_ready_signal_output;            	//   Ready signal
 output reg writing_finished_signal_output;       	//   Writing finished signal
 output reg busy_signal_output;                   	//   Busy signal
 output reg [3:0] state_reg;
 output reg halt;
 output reg Output_buffer_wr_en;
 output reg IncrementWtAddr;
 output reg IncrementInbuffAddr;
 output reg IncrementSAbuffAddr;
 output reg IncrementOBbuffAddr;
 
 //====================== FSM states declaration =======================
 
 
 parameter
 rd0     =   4'b0000,
 rd1     =   4'b0001,
 rd2     =   4'b0010,
 rd3     =   4'b0011,
 rd4	 =   4'b0100,
 wr0     =   4'b0101,
 wr1     =   4'b0110,
 wr2     =   4'b0111,
 wr3     =   4'b1000,
 wr4     =   4'b1001,
 idle    =   4'b1010,
 
 //imc mode parameters
 imc1    =   4'b1011,
 imc2	 =   4'b1100,
 imc3    =   4'b1101,
 imc4    =   4'b1110,
 imc5    =   4'b1111;
 

 //===================== signal declaration ========================================
 integer count=0;

 //reg [15:0] register_for_reading_data;
 //reg [15:0] register_for_writing_data;
 wire [15:0] WWL1;

 
 //==================== Decoder Instantiation =======================================
 
decoder dec1(.select(address_input[3:0]), .enable(en_dec), .out(WWL1));


//===================================================================================
integer i;
always @(posedge clk or negedge reset) begin  
 
     		if (!reset) begin 
		      PRE_SRAM <=1'b1;
		      PRE_VLSA <=1'b1;
		      WE<=1'b0;
		      //WWLD<=8'b00000000;
		      state_reg <= idle;
		      data_ready_signal_output<=1'b0;
		      writing_finished_signal_output<=1'b0;
		      busy_signal_output<=1'b0;
		      IncrementWtAddr<=0;
		      IncrementInbuffAddr<=0;
		      IncrementSAbuffAddr<=0;
		      IncrementOBbuffAddr<=0;
		      
     		 end
	  
	
		 else begin   
		     case(state_reg)
		       idle: 
			 begin   
			   if(!reset)
			     state_reg <= idle;              		 // initial idle state
			   else begin
			     if(rw && !imc_en)
			        state_reg <= rd0;     			// First read state
			     else if(~rw && !imc_en) 
			        state_reg <= wr0;		 	// First write state
			     else if(imc_en) begin
			    	state_reg<=imc1;
			    	PRE_A<=1'b1;
		   		PRE_CLSA<=1'b1;
		   		Output_buffer_wr_en<=1'b0;
		   		end
			     else
			     	state_reg<=idle;
			   end
			 end
//================================== READ OPERATION =====================================
		       rd0:						// state0
			 begin
			   halt<=1'b1;
			   busy_signal_output<=1'b1;
			   PRE_SRAM<=1'b0;
			   PRE_VLSA<=1'b0;        
			   WE<=1'b0;
			   state_reg <= rd1;
			   IncrementSAbuffAddr<=0;
			 
			 end   
		       rd1:						//state1
			 begin
			   PRE_SRAM<= 1'b1;
			   WWL[15:0]<=WWL1[15:0]; 			// decoder output to word line   
			  state_reg <= rd2; 
			 end
		       rd2:						//state2
			 begin
			   PRE_VLSA<=1'b1; 
			   data_ready_signal_output<=1'b1;
			   state_reg <= rd3; 
			 end
		       rd3:						//state3
			 begin
			  
			   WWL[15:0]<=16'b0;
			   WE<=1'b0;
			   busy_signal_output<=1'b0;
			   data_ready_signal_output<=1'b0;
			   state_reg <= rd4; 
			   IncrementSAbuffAddr<=1;
			 end
		       rd4 :						//state4
		        begin
			   PRE_VLSA<=1'b0;
			   state_reg <= idle;
			   halt<=1'b0;
			   IncrementSAbuffAddr<=0;
			
			 end
		//==============================WRITE MODE======================================         
		       wr0:						//state5
			 begin
			   halt<=1'b1;
			   PRE_VLSA<=1'b1;
			   PRE_SRAM<=1'b0;
			   busy_signal_output<=1'b1;
			   state_reg <= wr1;
			   IncrementWtAddr <=0; 
			 end
		       wr1:						//state6
			 begin
			  WE<=1'b1; 
			  PRE_SRAM<=1'b1; 
			  state_reg <= wr2;
			 end
		       wr2:						//state7
			 begin
			   WWL[15:0]<=WWL1[15:0]; 			 //decoder output to word line 
			   state_reg <= wr3;
			 end
		       wr3:						//state8
			 begin
			 WE<=1'b0; 
			 writing_finished_signal_output<=1'b1;
			 state_reg <= wr4;
			 IncrementWtAddr <=1; 
			 end
		       wr4:						//state9
			 begin
			   busy_signal_output<=1'b0;
			   WWL[15:0]<=16'b0;
			   writing_finished_signal_output<=1'b0;
			   state_reg <= idle;
			   halt<=1'b0;
			   IncrementWtAddr <=0; 
			 end
 
//======================== MEMORY MODE ENDS =====================================

//========================= IMC MODE STARTS =====================================					
		   imc1:		   
		   	begin
		   	IncrementInbuffAddr<=0;
		   	IncrementOBbuffAddr<=0;
		   	SAEN<=1'b0;
		   	halt<=1;
		   	for (i=0; i<=15; i=i + 1) begin
			   	if(IB_out[i])begin
			   		RWL[i]<=IB_out[i];
			   		RWLB[i]<={~IB_out[i]};
			   	end
			   	else begin
			   		RWL[i]<={~IB_out[i]};
			   		RWLB[i]<=IB_out[i];
			   	end
			 end
			 
			count<= count+1;
			PRE_A<=1'b0;
			PRE_CLSA<=1'b0;
			if(count<3)begin
				state_reg<=imc1;
			end
			else begin
				state_reg<=imc2;
				count<=0;
			end
		   end
		   imc2:
			   begin
				   PRE_CLSA<=1'b1;
				   state_reg<=imc3;
			   end
		   imc3:
			   begin
			   	SAEN<=1'b1;
			  	state_reg<= imc4;
			  	IncrementWtAddr <=1;
			  	IncrementOBbuffAddr<=1;
			  	 
			   end
		   imc4:
			   begin
			   	PRE_A<=1'b1;
				Output_buffer_wr_en<=1'b1;
			   	//output is assigned to output buffer 
			   	state_reg<=idle;
			   	RWL<=16'b0;
				RWLB<=16'b0;
				IncrementInbuffAddr<=0;
				IncrementOBbuffAddr<=0;
				halt<=0;
			   end
	      endcase
	   end
   end
endmodule   
