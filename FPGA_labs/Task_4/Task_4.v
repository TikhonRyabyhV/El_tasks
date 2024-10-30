module Task_4 (
	input  wire       clock       ,
	input  wire       reset       ,

	input  wire [8:0] switches    ,

	input  wire       write       ,
	input  wire       transmit    ,

	output reg  [7:0] diods_red   ,
	output reg  [7:0] diods_green ,

	output wire [6:0] seg_ones    ,
	output wire [6:0] seg_tens    ,
	output wire [6:0] seg_hundreds
);

wire write_press   ;
wire transmit_press;
wire shift_press   ;

syn_button write_button    (
				.clock   (clock      ),
				.reset   (reset      ),
				.button  (write      ),
				.pressing(write_press)

);

syn_button transmit_button (
				.clock   (clock         ),
				.reset   (reset         ),
				.button  (transmit      ),
				.pressing(transmit_press)

);


wire [3:0] ones;
wire [3:0] tens;
wire [3:0] hundreds;


hex_to_seg hex_to_seg_ones     (
					.hex  (    ones),
					.s_seg(seg_ones)
);

hex_to_seg hex_to_seg_tens     (  
					.hex  (    tens),
					.s_seg(seg_tens)
);

hex_to_seg hex_to_seg_hundreds (
					.hex  (    hundreds),
					.s_seg(seg_hundreds)
);

double_dabble bin_to_bcd (
				.bin(diods_red             ),
				.bcd({hundreds, tens, ones})
);



always @(posedge clock) begin
	if(~ reset)
		diods_red <= 8'b0;
	else begin
		diods_red <= write_press    ? switches[7:0] :
			     transmit_press ? (diods_red >> 1) | {switches[8], 6'b0} : diods_red;	   
	end
end

always @(posedge clock) begin
	if(~ reset)
		diods_green <= 8'b0;
	else begin
		diods_green <= transmit_press ? (diods_green >> 1) | {diods_red[0], 6'b0} : diods_green;	   
	end
end

endmodule


