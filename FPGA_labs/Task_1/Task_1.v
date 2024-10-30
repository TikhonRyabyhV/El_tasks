module Task_1 (
	input  wire       clock,
	input  wire       reset,

	input  wire       incr,
	input  wire       decr,

	output wire [6:0] s_seg
);

reg  [ 3:0] counter;

hex_to_seg hex_to_seg (
			.hex  (counter),
			.s_seg(s_seg  )
);

syn_button increase_button (
				.clock   (clock    ),
				.reset   (reset    ),
				.button  (incr     ),
				.pressing(inc_press)

);

syn_button decrease_button (
				.clock   (clock    ),
				.reset   (reset    ),
				.button  (decr     ),
				.pressing(dec_press)

);

always @(posedge clock) begin
	if(~ reset)
		counter <= 4'b0;
	else begin
		counter <= inc_press ? counter + 1'b1 : dec_press ? counter - 1'b1 : counter;	   
	end
end

endmodule
