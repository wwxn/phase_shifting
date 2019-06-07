// Copyright (C) 1991-2011 Altera Corporation
// Your use of Altera Corporation's design tools, logic functions 
// and other software and tools, and its AMPP partner logic 
// functions, and any output files from any of the foregoing 
// (including device programming or simulation files), and any 
// associated documentation or information are expressly subject 
// to the terms and conditions of the Altera Program License 
// Subscription Agreement, Altera MegaCore Function License 
// Agreement, or other applicable license agreement, including, 
// without limitation, that your use is for the sole purpose of 
// programming logic devices manufactured by Altera and sold by 
// Altera or its authorized distributors.  Please refer to the 
// applicable agreement for further details.

// PROGRAM		"Quartus II"
// VERSION		"Version 11.0 Build 157 04/27/2011 SJ Full Version"
// CREATED		"Thu Jun 06 21:25:04 2019"

module phase_shift(
	clk,
	rst_n,
	set_flag,
	point,
	data_out,
	q
);


input wire	clk;
input wire	rst_n;
input wire	set_flag;
input wire	[7:0] point;
output wire	[11:0] data_out;
output wire	[11:0] q;

wire	SYNTHESIZED_WIRE_0;
wire	SYNTHESIZED_WIRE_1;
wire	SYNTHESIZED_WIRE_2;
wire	[11:0] SYNTHESIZED_WIRE_3;
wire	SYNTHESIZED_WIRE_4;
wire	SYNTHESIZED_WIRE_5;
wire	[7:0] SYNTHESIZED_WIRE_6;
wire	[11:0] SYNTHESIZED_WIRE_7;
wire	[8:0] SYNTHESIZED_WIRE_8;

assign	q = SYNTHESIZED_WIRE_3;




fifo	b2v_inst(
	.wrreq(SYNTHESIZED_WIRE_0),
	.rdreq(SYNTHESIZED_WIRE_1),
	.clock(clk),
	.sclr(SYNTHESIZED_WIRE_2),
	.data(SYNTHESIZED_WIRE_3),
	
	
	.q(SYNTHESIZED_WIRE_7),
	.usedw(SYNTHESIZED_WIRE_8));

assign	SYNTHESIZED_WIRE_2 = SYNTHESIZED_WIRE_4 | SYNTHESIZED_WIRE_5;


rom	b2v_inst3(
	.clock(clk),
	.address(SYNTHESIZED_WIRE_6),
	.q(SYNTHESIZED_WIRE_3));


phase_shift_control	b2v_inst4(
	.clk(clk),
	.rst_n(rst_n),
	.set_flag(set_flag),
	.data_in(SYNTHESIZED_WIRE_7),
	.point(point),
	.usedw(SYNTHESIZED_WIRE_8),
	.clear_fifo(SYNTHESIZED_WIRE_4),
	.wrreq(SYNTHESIZED_WIRE_0),
	.rdreq(SYNTHESIZED_WIRE_1),
	.data_out(data_out));
	defparam	b2v_inst4.CLEAR = 3'b011;
	defparam	b2v_inst4.OUTPUT = 3'b001;
	defparam	b2v_inst4.WAIT = 3'b000;


rom_read	b2v_inst5(
	.clk(clk),
	.rst_n(rst_n),
	.address(SYNTHESIZED_WIRE_6));

assign	SYNTHESIZED_WIRE_5 =  ~rst_n;


endmodule
