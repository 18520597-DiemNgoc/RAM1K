module Decoder4to16(Out4_Dec, In4_Dec, EN);
	input [3:0] In4_Dec;
	input EN;
	output [15:0] Out4_Dec;
	wire dec0, dec1;
	
	and(dec0, ~In4_Dec[3], EN),
		(dec1, In4_Dec[3], EN);
	Decoder3to8 Dec0(.Out3_Dec(Out4_Dec[7:0]), .In3_Dec(In4_Dec[2:0]), .EN(dec0));
	Decoder3to8 Dec1(.Out3_Dec(Out4_Dec[15:8]), .In3_Dec(In4_Dec[2:0]), .EN(dec1));
endmodule

