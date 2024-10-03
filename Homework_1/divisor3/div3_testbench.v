`timescale 1 ns / 100 ps

module div3_testbench
#(
        parameter DATA_LEN  = 4'd8,
        parameter DEPTH_LEN = 3'd4,
        parameter STEPS     = 3'd3
)
();

reg clk = 1'b1;
always begin
	#1 clk = ~clk;
end

reg  [7:0] data;
wire       divisibility;

divisor3 divisor3 (
		.data        (data        ),
		.divisibility(divisibility)
);

initial begin

	$dumpfile("dump.vcd"); $dumpvars();
	
	#1; data = 8'd0  ; #2;
	$display("%d / 3 ? -  %d \n", data, divisibility);

	#2; data = 8'd1  ; #2;
	$display("%d / 3 ? -  %d \n", data, divisibility);

	#2; data = 8'd2  ; #2;
	$display("%d / 3 ? -  %d \n", data, divisibility);

	#2; data = 8'd3  ; #2;
	$display("%d / 3 ? -  %d \n", data, divisibility);

	#2; data = 8'd5  ; #2;
	$display("%d / 3 ? -  %d \n", data, divisibility);

	#2; data = 8'd12 ; #2;
	$display("%d / 3 ? -  %d \n", data, divisibility);

	#2; data = 8'd15  ; #2;
	$display("%d / 3 ? -  %d \n", data, divisibility);

	#2; data = 8'd17 ; #2;
	$display("%d / 3 ? -  %d \n", data, divisibility);


	$finish;

end

endmodule

