`timescale 1ns/1ns
module phase_shift_tb();

reg	clk;
reg	rst_n;
reg	set_flag;
reg	[7:0] point;
wire	[11:0] data_out;
wire	[11:0] q;


phase_shift phase_shift_inst1(
	clk,
	rst_n,
	set_flag,
	point,
	data_out,
	q
);

initial begin
	point<=8'd64;
	clk<=1'b1;
	rst_n<=1'b1;
	#10;
	rst_n<=1'b0;
	#10;
	rst_n<=1'b1;
	#100000;
	set_flag<=1'b1;
	point<=8'd128;
	#10;
	set_flag<=1'b0;
end

always #3 clk<=~clk;

endmodule