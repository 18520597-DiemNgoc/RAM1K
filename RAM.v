module RAM(INOUT, IN_DEC, EN, RWS, CS, clk);
	input [9:0] IN_DEC; // Address of Decoder
	input EN, RWS, CS, clk; // EN is select sign of decoder
	inout [7:0] INOUT;
	wire [1023:0] OUT_DEC; // output of decoder 10 to 1024
	wire t1,t2; // t1 is write enable, t2 is read enable
	wire [3:0] E; // output of decoder 2 to 4
	wire [7:0] Out_Word;
	
	//Decoder 10 to 1024
	Decoder2to4 Dec_Control(.Out_De0(E[0]), .Out_De1(E[1]), .Out_De2(E[2]), .Out_De3(E[3]), .I0(IN_DEC[8]), .I1(IN_DEC[9]), .En(EN));
	Decoder8to256 Dec [3:0] (.Out8_Dec(OUT_DEC), .In8_Dec(IN_DEC[7:0]), .EN(E));
	
	// read and write select, {RWS = 0 read = 1}; {RWS = 1 write = 1}
	RWSel RWSEL(.Wr(t1), .R(t2), .CS(CS), .RWS(RWS), .clk(clk));
	
	// connect all word to create a ram
	WORD W[1023:0](.OUT_Word(Out_Word), .IN_Word(INOUT), .WriteEn(t1), .Row(OUT_DEC));
	bufif1 result[7:0](INOUT, Out_Word, t2);
	
endmodule
	
