`timescale 1 ns / 100 ps

module log2_testbench ();

reg clk = 1'b1;
always begin
	#1 clk = ~clk;
end

reg  [7:0] data_in ;
wire [2:0] exponent;

log2 log2 (
		.data_in(data_in ),
		.exponent(exponent)
);

initial begin

	#1; data_in = 8'd1  ; #2;
	$display("log2(%d) = %d \n", data_in, exponent);

	#2; data_in = 8'd2  ; #2;
	$display("log2(%d) = %d \n", data_in, exponent);

	#2; data_in = 8'd4  ; #2;
	$display("log2(%d) = %d \n", data_in, exponent);

	#2; data_in = 8'd8  ; #2;
	$display("log2(%d) = %d \n", data_in, exponent);

	#2; data_in = 8'd16 ; #2;
	$display("log2(%d) = %d \n", data_in, exponent);

	#2; data_in = 8'd32 ; #2;
	$display("log2(%d) = %d \n", data_in, exponent);

	#2; data_in = 8'd64 ; #2;
	$display("log2(%d) = %d \n", data_in, exponent);

	#2; data_in = 8'd128; #2;
	$display("log2(%d) = %d \n", data_in, exponent);

	$finish;

end

endmodule
