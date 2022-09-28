module decoder (input [3:0] select, input enable, output wire [15:0] out);

assign out = {17{enable}} & (1'b1 <<select);
endmodule
