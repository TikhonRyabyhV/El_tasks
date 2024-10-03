module imp_gen (
	input  wire clk    ,
	input  wire reset  ,

	output reg  impulse
);

reg [2:0] counter;

always @(posedge clk) begin
	if(reset | (counter == 3'b101)) begin
		counter <= 1'b0;
	end

	else begin
		counter <= counter + 1'b1;
	end
end

always @(posedge clk) begin
	if(reset) begin
		impulse <= 1'b1;
	end

	else begin
		if((counter == 3'b000) | (counter == 3'b101)) begin
			impulse <= ~ impulse;
		end
	end
end

endmodule
