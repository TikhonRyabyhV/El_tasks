module diff_even_odd 
#(
        parameter DATA_LEN  = 4'd8,
	parameter HALF_LEN  = 3'd4
)
(
	input  wire [DATA_LEN  - 1: 0] data,

	output wire [DATA_LEN  - 1: 0] diff     
);

wire [HALF_LEN - 1: 0] odd_sum  [HALF_LEN - 1: 0];
wire [HALF_LEN - 1: 0] even_sum [HALF_LEN - 1: 0];


assign odd_sum  [0] = data[1] ;
assign even_sum [0] = data[0];

genvar i;

generate
	for( i = 2; i < DATA_LEN - 1; i = i + 2) begin: odd_even_sum_gen
	       assign odd_sum  [i / 2] = odd_sum [i / 2 - 1] + data[i + 1];
	       assign even_sum [i / 2] = even_sum[i / 2 - 1] + data[i    ];      
	end

endgenerate

assign diff = (odd_sum[HALF_LEN - 1] > even_sum[HALF_LEN - 1]) ?
	       odd_sum[HALF_LEN - 1] - even_sum[HALF_LEN - 1] : even_sum[HALF_LEN - 1] - odd_sum[HALF_LEN - 1];


endmodule
