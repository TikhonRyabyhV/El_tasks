`timescale 1 ns / 100 ps

module freq_div_2n_testbench ();

reg clk = 1'b1;
always begin
	#1 clk = ~clk;
end

reg  reset;

freq_div_2n freq_div_2n (
			.clk  (clk  ),
			.reset(reset)
);

initial begin

	$dumpfile("dump.vcd"); $dumpvars();

	reset = 1'b1; #2 ; 
	reset = 1'b0; #12;

	$finish;
end

endmodule
