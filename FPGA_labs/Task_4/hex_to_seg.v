module hex_to_seg (
	input  wire [3:0] hex,
	
	output wire [6:0] s_seg
);

wire [127:0] seg_mask   ;
wire [127:0] offset_mask;

assign seg_mask = {~ 8'b0_0111111,
		   ~ 8'b0_0000110,
		   ~ 8'b0_1011011,
		   ~ 8'b0_1001111,	
		   ~ 8'b0_1100110,	
		   ~ 8'b0_1101101,	
		   ~ 8'b0_1111101,	
		   ~ 8'b0_0000111,	
		   ~ 8'b0_1111111,	
		   ~ 8'b0_1101111,	
		   ~ 8'b0_1110111,	
		   ~ 8'b0_1111100,	
		   ~ 8'b0_0111001,	
		   ~ 8'b0_1011110,	
		   ~ 8'b0_1111001,
		   ~ 8'b0_1110001};

assign offset_mask = (seg_mask << hex) << 3;
assign s_seg       =  offset_mask[126:120];

endmodule


