module priority_encoder
#(
	parameter DATA_LEN  = 8               ,
	parameter DEPTH_LEN = $clog2(DATA_LEN)
)
(
	input  wire [DATA_LEN  - 1:0] data_in    ,

	output wire [DEPTH_LEN - 1:0] first_1_pos
);

wire [DEPTH_LEN - 1:0] pos_of_1 [DATA_LEN - 1:0];

assign pos_of_1 [0] = 0;

genvar i;

generate
	for( i = 1; i < DATA_LEN; i = i + 1) begin: pos_of_1_gen
		assign pos_of_1 [i] = ( i                & {DEPTH_LEN {  data_in[i]} } ) | 
				      ( pos_of_1 [i - 1] & {DEPTH_LEN { ~data_in[i]} } );
	end
endgenerate

assign first_1_pos = pos_of_1 [DATA_LEN - 1];


endmodule
