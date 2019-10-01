module saturate_tv ();

reg [15:0] unsigned_err, signed_err;
reg [9:0] signed_D_diff; 

saturate iDUT (.unsigned_err(unsigned_err), .signed_err(signed_err), .signed_D_diff(signed_D_diff)); 

initial begin 

	#5  unsigned_err = 16'h0400; //0000 0100 0000 0000 (should be saturated) just over
	#10 unsigned_err = 16'h0200; //0000 0010 0000 0000 (should not be saturated) just under
	#15 unsigned_err = 16'h0000; //0000 0000 0000 0000 (should not be saturated) smallest num
	#20 unsigned_err = 16'hFFFF; //1111 1111 1111 1111 (should be saturated) largest num

	#5  signed_err = 16'h0400; //0000 0100 0000 0000 (should be saturated) +ve just over
	#10 signed_err = 16'h0200; //0000 0010 0000 0000 (should not be saturated) +ve just under 
	#15 signed_err = 16'h0000; //0000 0000 0000 0000 (should not be saturated) smallest +ve num
	#20 signed_err = 16'h8001; //1000 0000 0000 0001 (should not be saturated) smallest -ve num
	#25 signed_err = 16'h8200; //1000 0010 0000 0000 (should not be saturated) -ve just under
	#30 signed_err = 16'h8400; //1000 0100 0000 0000 (should be saturated) -ve just over
	
	#5  signed_D_diff = 10'h080; //00 1000 0000 (should be saturated) +ve just over
	#10 signed_D_diff = 10'h040; //00 0100 0000 (should not be saturated) +ve just under
	#15 signed_D_diff = 10'h000; //00 0000 0000 (should not be saturated) smallest +ve num
	#20 signed_D_diff = 10'h201; //10 0000 0001 (should not be saturated) smallest -ve num
	#25 signed_D_diff = 10'h240; //10 0100 0000 (should not be saturated) -ve just under
	#30 signed_D_diff = 10'h280; //10 1000 0000 (should be saturated) -ve just over

$stop; 

end 

endmodule 