module Decoder8to256(Out8_Dec, In8_Dec, EN);
	input [7:0] In8_Dec;
	input EN;
	output [255:0] Out8_Dec;
	wire [15:0] E;
	// 8x256 decoder using 16 (4x16) decoders
	Decoder4to16 Dec[15:0](.Out4_Dec(Out8_Dec), .In4_Dec(In8_Dec[3:0]), .EN(E[15:0]));
	Decoder4to16 Dec16(.Out4_Dec(E[15:0]), .In4_Dec(In8_Dec[7:4]), .EN(EN));
	
endmodule

