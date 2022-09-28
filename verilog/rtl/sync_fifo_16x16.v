//Realization of synchronous FIFO by counter method
module	sync_fifo_16x16
#(	parameter   DATA_WIDTH = 'd16  ,		//FIFO bit width
        parameter   DATA_DEPTH = 'd16 			//FIFO depth
)

(	input	clk,		       		//System clock
	input	rst_n,       	       		//Low level active reset signal
	input	wr_en,      		    		 //Write enable signal, high level active
	output	full,      	             		//Full flag, high level indicates that the current FIFO has been read empty 		   
	input	[15:0] data_in,          		 //Data written 												
	input	rd_en	,       		      	//Read enable signal, high level active
	output	empty	,	   	 		   //Empty flag, high level indicates that the current FIFO is full
	output	reg	[15:0] data_out,	   	 //Output data
	output	reg	[3 : 0] fifo_cnt,		//$clog2 is the base 2 logarithm	
	input [3 : 0]	wr_addr,				//Write address
	input [3 : 0]	rd_addr
);

//reg define
reg [15 : 0] fifo_buffer[15 : 0];	                //Implementation of RAM with two-dimensional array	
//Read operation, update read address
always @ (posedge clk) begin
	
	if (!empty && rd_en)begin							//The read enable is valid and not empty
		data_out <= fifo_buffer[rd_addr];
	end
end
//Write operation, update write address
always @ (posedge clk ) begin
	
	if (!full && wr_en)begin							//Write enable is valid and not full
		fifo_buffer[wr_addr]<=data_in;
	end;
end
//Update counter
always @ (posedge clk or negedge rst_n) begin
	if (!rst_n)
		fifo_cnt <= 0;
	else begin
		case({wr_en,rd_en})							//Splicing read-write enable signal for judgment
			2'b00:fifo_cnt <= fifo_cnt;					//No reading, no writing
			2'b01:	                               			//Just read
				if(fifo_cnt != 0)				   	//fifo is not read empty
					fifo_cnt <= fifo_cnt - 1'b1;   		//Number of fifo - 1
			2'b10:                                 			//Just write
				if(fifo_cnt != DATA_DEPTH)         			//fifo is not full
					fifo_cnt <= fifo_cnt + 1'b1;   		//Number of fifo + 1
			2'b11:fifo_cnt <= fifo_cnt;	           			//Simultaneous reading and writing
			default:;                              	
		endcase
	end
end
//Update the indication signal according to the counter status
//According to different thresholds, you can also design half empty, half full, almost empty and almost full
assign full  = (fifo_cnt == DATA_DEPTH) ? 1'b1 : 1'b0;		//Null signal
assign empty = (fifo_cnt == 0)? 1'b1 : 1'b0;				//Full signal

endmodule
