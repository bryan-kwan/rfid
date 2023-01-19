
module top_level (
	bridge_memory_address,
	bridge_memory_byte_enable,
	bridge_memory_read,
	bridge_memory_write,
	bridge_memory_write_data,
	bridge_memory_acknowledge,
	bridge_memory_read_data,
	clk_clk,
	ledr_external_connection_export,
	memory_addr,
	memory_ba,
	memory_cas_n,
	memory_cke,
	memory_cs_n,
	memory_dq,
	memory_dqm,
	memory_ras_n,
	memory_we_n,
	sw_external_connection_export,
	vga_conduit_CLK,
	vga_conduit_HS,
	vga_conduit_VS,
	vga_conduit_BLANK,
	vga_conduit_SYNC,
	vga_conduit_R,
	vga_conduit_G,
	vga_conduit_B,
	altpll_1_c0_clk);	

	input	[26:0]	bridge_memory_address;
	input	[1:0]	bridge_memory_byte_enable;
	input		bridge_memory_read;
	input		bridge_memory_write;
	input	[15:0]	bridge_memory_write_data;
	output		bridge_memory_acknowledge;
	output	[15:0]	bridge_memory_read_data;
	input		clk_clk;
	output	[7:0]	ledr_external_connection_export;
	output	[12:0]	memory_addr;
	output	[1:0]	memory_ba;
	output		memory_cas_n;
	output		memory_cke;
	output		memory_cs_n;
	inout	[15:0]	memory_dq;
	output	[1:0]	memory_dqm;
	output		memory_ras_n;
	output		memory_we_n;
	input	[7:0]	sw_external_connection_export;
	output		vga_conduit_CLK;
	output		vga_conduit_HS;
	output		vga_conduit_VS;
	output		vga_conduit_BLANK;
	output		vga_conduit_SYNC;
	output	[3:0]	vga_conduit_R;
	output	[3:0]	vga_conduit_G;
	output	[3:0]	vga_conduit_B;
	output		altpll_1_c0_clk;
endmodule
