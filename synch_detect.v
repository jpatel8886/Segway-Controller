module synch_detect(asynch_sig_in, clk, fall_edge); 

input asynch_sig_in, clk; 

output fall_edge;

wire fIn1, fIn2, fOut, nOut; 

dff flop1(asynch_sig_in, clk, fIn1); 
dff flop2(fIn1, clk, fIn2); 
dff flop3(fIn2, clk, fOut);
 
not gate1(nOut, fIn);
and gate2(fall_edge, nOut, fOut); 


endmodule