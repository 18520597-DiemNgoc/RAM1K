module Decoder2to4(Out_De0, Out_De1, Out_De2, Out_De3, I0, I1, En); // I1 MSB, I0 LSB
	input I0, I1, En;
	output Out_De0, Out_De1, Out_De2, Out_De3;
	
	and(Out_De0, ~I0, ~I1, En),
		(Out_De1, I0, ~I1, En),
		(Out_De2, ~I0, I1, En),
		(Out_De3, I0, I1, En);
endmodule
	
