`timescale 1 ns / 100 ps

module dd_testbench();

reg clk = 1'b1;
always begin
	#1 clk = ~clk;
end

reg  [ 7:0] bin;
wire [11:0] bcd;

double_dabble double_dabble (
				.bin(bin),
				.bcd(bcd)
);

initial begin

	$dumpfile("dump.vcd"); $dumpvars();
	
	#1; bin = 8'd000  ; #2;
	$display("BIN: %d, BCD: %d %d %d \n", bin, bcd[11:8], bcd[7:4], bcd[3:0]);

	#1; bin = 8'd045  ; #2;
	$display("BIN: %d, BCD: %d %d %d \n", bin, bcd[11:8], bcd[7:4], bcd[3:0]);

	#1; bin = 8'd167  ; #2;
	$display("BIN: %d, BCD: %d %d %d \n", bin, bcd[11:8], bcd[7:4], bcd[3:0]);

	#1; bin = 8'd255  ; #2;
	$display("BIN: %d, BCD: %d %d %d \n", bin, bcd[11:8], bcd[7:4], bcd[3:0]);

	#1; bin = 8'd065  ; #2;
	$display("BIN: %d, BCD: %d %d %d \n", bin, bcd[11:8], bcd[7:4], bcd[3:0]);
	$finish;

end

endmodule
