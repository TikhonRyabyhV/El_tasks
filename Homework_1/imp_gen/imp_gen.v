module imp_gen 
#(
	parameter IMP_PERIOD = 5                 ,
	parameter COUNT_LEN  = $clog2(IMP_PERIOD)
)
(
	input  wire clk    ,
	input  wire reset  ,

	output wire impulse
);

reg [COUNT_LEN - 1:0] counter;

always @(posedge clk) begin
	if(reset)
		counter <= 0;

	else begin

		if(counter == IMP_PERIOD - 1)
			counter <= 0;

		else
			counter <= counter + 1'b1;
	end
end

assign impulse = (counter == IMP_PERIOD - 1) ? 1'b1 : 1'b0;

endmodule
