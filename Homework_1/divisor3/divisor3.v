module divisor3 
#(
	parameter DATA_LEN  = 4'd8,
	parameter DEPTH_LEN = 3'd4,
	parameter STEPS     = 3'd3
)
(
	input  wire [DATA_LEN - 1: 0] data        ,

	output wire                   divisibility
);

wire [DATA_LEN  - 1: 0] data_wire  [STEPS - 1: 0];
wire [DEPTH_LEN - 1: 0] depth_wire [STEPS - 1: 0];

diff_even_odd diff_even_odd_0 (
				.data     (data         ),
				.cur_depth(DATA_LEN     ),
				.diff     (data_wire [0]),
				.new_depth(depth_wire[0])
);

genvar i;

generate
	for( i = 1; i < STEPS; i = i + 1 ) begin: iter_mod_gen
		diff_even_odd #(
		.DATA_LEN (DATA_LEN  / (2 * i     )) ,
       		.DEPTH_LEN(DEPTH_LEN -      i      ) ,
       		.HALF_LEN (DATA_LEN /  (2 * (i + 1)))
		) 

		diff_even_odd_i (
						.data     (data_wire [i - 1][DATA_LEN  / (2 * i) - 1: 0]),
						.cur_depth(depth_wire[i - 1][DEPTH_LEN -      i  - 1: 0]),
						.diff     (data_wire [i    ][DATA_LEN  / (2 * i) - 1: 0]),
						.new_depth(depth_wire[i    ][DEPTH_LEN -      i  - 1: 0])
		);
	end
endgenerate

assign divisibility = data_wire[STEPS - 1];

endmodule
