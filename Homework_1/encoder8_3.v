module encoder8_3 (
	input  wire [7:0] data_in    ,

	output wire [2:0] first_1_pos
);

wire [2:0] pos_of_1 [7:0];

assign pos_of_1 [0] = ( 3'b0 & {3 {data_in[0]} } );

genvar i;

generate
	for( i = 1; i < 8; i = i + 1) begin: pos_of_1_gen
		assign pos_of_1 [i[2:0]] = ( i[2:0]                & {3 {data_in[i[2:0]]       } } ) | 
					   ( pos_of_1 [i[2:0] - 1] & {3 {data_in[i[2:0]] ^ 1'b1} } );
	end
endgenerate

assign first_1_pos = pos_of_1 [7];


endmodule
