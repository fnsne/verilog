module ALU( opcode, clk, reset, accum, data, alu_out, zero );
	input opcode, clk, reset, accum, data;
	output alu_out, zero;

	wire [2:0] opcode;
	wire [7:0] accum, data;
	reg [7:0] alu_out;
	reg zero;
	
	always @( posedge clk or posedge reset )
		begin
			if( reset )
				begin
					alu_out = 8'b00000000;
				end
			else
				begin
					case( opcode )
						3'b000 : alu_out = accum;
						3'b001 : alu_out = accum + data;
						3'b010 : alu_out = accum - data;
						3'b011 : alu_out = accum & data;
						3'b100 : alu_out = accum ^ data;
						3'b101 : 
							begin
								if( accum[7] )
									begin
										alu_out = ( accum - 1 ) ^8'b11111111;
									end
								else
									alu_out = accum;
							end
						3'b110 : alu_out = accum * 8'b00000101 + accum / 8'b00001000;
						3'b111 : 
							begin
								if(accum > 128 )
									alu_out = (data ^ 8'b11111111) + 1;
								else
									alu_out = data ^ 8'b11111111;
							end 
				endcase
				end
		end
	always@( alu_out )
		begin
			if( !alu_out )
					zero = 1;
			else
					zero = 0;
		end
endmodule

