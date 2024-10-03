module diff_even_odd 
#(
        parameter DATA_LEN  = 4'd8,
        parameter DEPTH_LEN = 3'd4,
	parameter HALF_LEN  = 3'd4
)
(
	input  wire [DATA_LEN  - 1: 0] data     ,
	input  wire [DEPTH_LEN - 1: 0] cur_depth,

	output wire [DATA_LEN  - 1: 0] diff     ,
	output wire [DEPTH_LEN - 1: 0] new_depth
);

wire [DATA_LEN - 1: 0] odd_sum  [DATA_LEN - 1: 0];
wire [DATA_LEN - 1: 0] even_sum [DATA_LEN - 1: 0];

wire [DATA_LEN - 1: 0] odd_mask ;
wire [DATA_LEN - 1: 0] even_mask;

assign odd_mask  = {HALF_LEN{2'b10}};
assign even_mask = {HALF_LEN{2'b01}};

assign odd_sum  [0] = 1'b0   ;
assign even_sum [0] = data[0];

genvar i;

generate
	for( i = 1; i < DATA_LEN; i = i + 1) begin: odd_even_sum_gen
	       assign odd_sum  [i] = odd_sum [i - 1] + (data[i] & odd_mask [i]);
	       assign even_sum [i] = even_sum[i - 1] + (data[i] & even_mask[i]);      
	end

endgenerate

assign diff = (odd_sum[cur_depth - 1] > even_sum[cur_depth - 1]) ?
	       odd_sum[cur_depth - 1] - even_sum[cur_depth - 1] : even_sum[cur_depth - 1] - odd_sum[cur_depth - 1];

assign new_depth = cur_depth >> 1;

endmodule
