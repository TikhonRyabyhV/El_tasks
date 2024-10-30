module hex_to_diod (
	input  wire [2:0] hex,

	output wire [6:0] diod
);

wire [6:0] mask;

assign mask = 7'b111_1111;

assign diod = mask >> (7 - hex);

endmodule
