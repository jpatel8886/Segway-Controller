module arith_tb(); 

reg [7:0] stim_a, stim_b; 

wire [7:0] mon_sum;   // monitor sum
wire mon_ovf;  // monitor count and overflow

reg sub; // sub high = subtract, otherwise add

arith iDUT(.A(stim_a), .B(stim_b), .SUB(sub), .SUM(mon_sum), .OV(mon_ovf)); 

initial begin 

	sub = 0; 	// add

	stim_a = 8'hB4; //1011 0100
	stim_b = 8'h4B; //0100 1011 
	#5; 		//wait 5 time unit
	
	stim_a = 8'h00;  //0000 0000
	stim_b = 8'h71;  //0111 0001
	#5; 		


	stim_a = 8'h7F;
	stim_b = 8'h7F;   
	#5; 		
	
	// result should be 0, with an overflow
	
	sub = 1;	// subtract
	
	stim_a = 8'hCC;
	stim_b = 8'h22;  
	#5; 
	
	stim_a = 8'h88; 
	stim_b = 8'h88;  
	#5; 
	
	stim_a = 8'h55;  
	stim_b = 8'h55; 
	#5; 

	stim_a = 8'h80;
	stim_b = 8'h07;  
	#5; 
	

$stop;

end 

endmodule 