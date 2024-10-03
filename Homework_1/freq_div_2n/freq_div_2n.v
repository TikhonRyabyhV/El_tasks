module freq_div_2n
#(
	parameter DIV     = 6                  ,
	parameter MAX_NUM = DIV / 2 - 1        ,
	parameter REG_LEN = $clog2(MAX_NUM) + 1
)
(
	input  wire clk    ,
	input  wire reset  ,

	output reg new_freq
);

reg [REG_LEN - 1:0] counter;

always @(posedge clk) begin
	if(reset)
		counter <= 0;

	else begin

		if(counter == MAX_NUM)
			counter <= 0;

		else
			counter <= counter + 1'b1;
	end
end

always @(posedge clk) begin
	if(reset)
		new_freq <= 1'b1;

	else
		if(counter == MAX_NUM)
			new_freq <= ~ new_freq;
end

endmodule
