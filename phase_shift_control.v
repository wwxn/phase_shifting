module phase_shift_control
(
	input clk,
	input rst_n,
	input [11:0] data_in,
	input [8:0] usedw,
	input [7:0] point,
	input set_flag,
	output clear_fifo,
	output wrreq,
	output rdreq,
	output [11:0] data_out
);


parameter WAIT=3'b000;
parameter OUTPUT=3'b001;
parameter CLEAR=3'b011;

reg [2:0] state;
reg [2:0] state_next;

assign wrreq=1'b1;
assign rdreq=(state_next==OUTPUT)?1'b1:1'b0;
assign data_out=(state_next==OUTPUT)?data_in:data_out;
assign clear_fifo=(state_next==CLEAR)?1'b1:1'b0;


always@(posedge clk)
if(!rst_n)
	state<=WAIT;
else
	state<=state_next;
	

always@*
begin
	state_next<=3'bx;
	case (state)
	WAIT:
		if(usedw>=point)
			state_next<=OUTPUT;
		else
			state_next<=WAIT;
	OUTPUT:
		if(set_flag)
			state_next<=CLEAR;
		else
			state_next<=OUTPUT;
	CLEAR:
		state_next<=WAIT;
	endcase
end


endmodule 

