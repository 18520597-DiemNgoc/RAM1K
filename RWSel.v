module RWSel(Wr, R, CS, RWS, clk);
	input RWS, CS, clk;
	output Wr, R;
	
	and(Wr, RWS, CS, clk),
		(R, ~RWS, CS);
endmodule

