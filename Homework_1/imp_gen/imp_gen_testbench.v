`timescale 1 ns / 100 ps

module imp_gen_testbench ();

reg clk = 1'b1;
always begin
	#1 clk = ~clk;
end

reg   reset  ;
wire  impulse;

imp_gen imp_gen (
		.clk    (clk    ),
		.reset  (reset  ),
		.impulse(impulse)
);

initial begin
	$dumpfile("dump.vcd"); $dumpvars();

	reset = 1'b1; #1 ; 
	reset = 1'b0; #18;

	$finish;

end

endmodule
