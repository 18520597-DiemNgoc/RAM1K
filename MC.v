module MC(Out_MC, In_MC, RowSel, WrEn);
	input In_MC, RowSel, WrEn;
	output Out_MC;
	wire Q;
	
	D_latch memoryCell(.Q_latch(Q), .Qn_latch(), .Din_latch(In_MC), .clk_d(RowSel & WrEn));
	bufif1 f1(Out_MC, Q, RowSel);
endmodule

