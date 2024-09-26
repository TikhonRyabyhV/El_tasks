module freq_div6 (
	input  wire clk    ,
	input  wire reset  ,

	output reg new_freq
);

reg [1:0] counter;

always @(posedge clk) begin
	if(reset | (counter == 2'b10)) begin
		counter <= 1'b0;
	end

	else begin
		counter <= counter + 1'b1;
	end
end

always @(posedge clk) begin
	if(reset) begin
		new_freq <= 1'b1;
	end

	else begin
		if(counter == 2'b10)
			new_freq <= ~ new_freq;
	end
end

endmodule
