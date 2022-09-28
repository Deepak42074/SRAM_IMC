`timescale 1ns / 1ps
module instruction_decoder(
clk, 
reset,
instr,
halt,
address_input, 
en_dec,
imc_en,
mem_en,
rw,
wait_IM,
Input_buffer_rd_en,
Weight_buffer_rd_en,
sram_data_rd_enable
);

//=================  INPUTS  ==========================================
 input  clk;                                    //  Clock signal
 input  reset;
 input  [31:0] instr;		     		 //Input buffer output which is input to WL driver
 input  halt;
//================  OUTPUTS  ===========================================  
 output reg [3:0] address_input;
 output reg imc_en;
 output reg mem_en;
 output reg en_dec;
 output reg rw; 
 //======================   FLAGS   ====================================
 output reg wait_IM;
 output reg Input_buffer_rd_en;
 output reg Weight_buffer_rd_en;
 output reg sram_data_rd_enable;
 //========================  Regs  =====================================
 
 reg [2:0] states;
 reg [2:0] temp_states;
 
 //====================== FSM states declaration =======================
 
 //===================================================================================
integer i;
always @(posedge clk) begin 
if(halt) begin
temp_states<=instr[31:29];
wait_IM<=1; end
else begin
wait_IM<=0; end
end
		
always @(posedge clk or posedge reset) begin 
	if (reset) begin
		//wait_IM<=1'b0;
		states<=3'b111;
	end 
	else begin 
		states<= temp_states;
		//wait_IM<=1'b1;
		case(states)
		3'b000: begin
			rw<=1'b0;						//Memory write for rw=0
			mem_en<=1'b1;
			imc_en<=1'b0;
			en_dec<=1'b1;
			address_input[3:0] <= instr[3:0];			// will go to controller for decoding wordlines
			Weight_buffer_rd_en<=1'b1;				//Din is input to SRAM write driver
			sram_data_rd_enable<=1'b0;
			Input_buffer_rd_en<=1'b0;
			end
		3'b001: 							//Reading from SRAM array
			begin	
			address_input[3:0] <= instr[3:0];			// will go to controller for decoding wordlines
			rw<=1'b1;
			mem_en<=1'b1;
			imc_en<=1'b0;
			en_dec<=1'b1;
			sram_data_rd_enable<=1'b1;	
			Weight_buffer_rd_en<=1'b0;
			Input_buffer_rd_en<=1'b0;		
			end
		3'b010:
			begin
			address_input[3:0] <= 4'b0000;				// will go to controller for decoding wordlines
			rw<=1'b1;
			mem_en<=1'b0;
			imc_en<=1'b1;
			en_dec<=1'b0;
			Input_buffer_rd_en<=1'b1;
			sram_data_rd_enable<=1'b0;
			Weight_buffer_rd_en<=1'b0;
			end
		3'b111:
			begin
			address_input[3:0] <= 4'b0000;				// will go to controller for decoding wordlines
			rw<=1'b1;
			mem_en<=1'b0;
			imc_en<=1'b0;
			en_dec<=1'b0;
			Input_buffer_rd_en<=1'b0;
			sram_data_rd_enable<=1'b0;
			Weight_buffer_rd_en<=1'b0;
			end
		3'b011:
			begin
			address_input[3:0] <= 4'b0000;				// will go to controller for decoding wordlines
			rw<=1'b1;			
			mem_en<=1'b0;
			imc_en<=1'b0;
			en_dec<=1'b0;
			Input_buffer_rd_en<=1'b0;
			sram_data_rd_enable<=1'b0;
			Weight_buffer_rd_en<=1'b0;
			end
		3'b100:
			begin
			address_input[3:0] <= 4'b0000;				// will go to controller for decoding wordlines
			rw<=1'b1;
			mem_en<=1'b0;
			imc_en<=1'b0;
			en_dec<=1'b0;
			Input_buffer_rd_en<=1'b0;
			sram_data_rd_enable<=1'b0;
			Weight_buffer_rd_en<=1'b0;
			end

		endcase    
   	end
 end
endmodule   
