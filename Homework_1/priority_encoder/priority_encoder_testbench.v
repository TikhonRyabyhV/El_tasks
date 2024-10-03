`timescale 1 ns / 100 ps

module priority_encoder_testbench
#(
	parameter DATA_LEN  = 8               ,
	parameter DEPTH_LEN = $clog2(DATA_LEN)
)
();

reg clk = 1'b1;
always begin
	#1 clk = ~clk;
end

reg  [7:0] data_in ;
wire [2:0] first_1_pos;

priority_encoder priority_encoder (
					.data_in    (data_in    ),
					.first_1_pos(first_1_pos)
);

initial begin

	#1; data_in = 8'd0  ; #2;
	$display("first 1 of %b is %d \n", data_in, first_1_pos );

	#1; data_in = 8'd1  ; #2;
	$display("first 1 of %b is %d \n", data_in, first_1_pos );

	#1; data_in = 8'd2  ; #2;
	$display("first 1 of %b is %d \n", data_in, first_1_pos );

	#1; data_in = 8'd5  ; #2;
	$display("first 1 of %b is %d \n", data_in, first_1_pos );

	#1; data_in = 8'd9  ; #2;
	$display("first 1 of %b is %d \n", data_in, first_1_pos );

	#1; data_in = 8'd12 ; #2;
	$display("first 1 of %b is %d \n", data_in, first_1_pos );

	#1; data_in = 8'd125; #2;
	$display("first 1 of %b is %d \n", data_in, first_1_pos );

	#1; data_in = 8'd100; #2;
	$display("first 1 of %b is %d \n", data_in, first_1_pos );

	$finish;

end

endmodule

