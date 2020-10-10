module WORD(OUT_Word, IN_Word, WriteEn, Row);
	input Row, WriteEn;
	input [7:0] IN_Word;
	output [7:0] OUT_Word;
	
	MC memoryCel[7:0](.Out_MC(OUT_Word[7:0]), .In_MC(IN_Word[7:0]), .RowSel(Row), .WrEn(WriteEn));
endmodule

