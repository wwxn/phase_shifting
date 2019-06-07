module rom_read
(
	input clk,
	input rst_n,
	output [7:0] address
);

reg [7:0] address_reg;
assign address=address_reg;

always@(posedge clk)
if(!rst_n)
	address_reg<=8'd0;
else
	address_reg<=address_reg+1'b1;


endmodule 