module Decoder3to8(Out3_Dec, In3_Dec, EN);
	input EN;
	input [2:0] In3_Dec;
	output [7:0] Out3_Dec;
	wire dec0, dec1;
	
	and(dec0, ~In3_Dec[2], EN),
		(dec1, In3_Dec[2], EN);
		
	Decoder2to4 Dec0(.Out_De0(Out3_Dec[0]), .Out_De1(Out3_Dec[1]), .Out_De2(Out3_Dec[2]), .Out_De3(Out3_Dec[3]), .I0(In3_Dec[0]), .I1(In3_Dec[1]), .En(dec0));
	Decoder2to4 Dec1(.Out_De0(Out3_Dec[4]), .Out_De1(Out3_Dec[5]), .Out_De2(Out3_Dec[6]), .Out_De3(Out3_Dec[7]), .I0(In3_Dec[0]), .I1(In3_Dec[1]), .En(dec1));
endmodule

