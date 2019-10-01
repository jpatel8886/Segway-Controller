module saturate(unsigned_err, signed_err, signed_D_diff, unsigned_err_sat, signed_err_sat, signed_D_diff_sat);

///////////////////////////////////////////////////////////////////////////////////////////////////////

input [15:0] unsigned_err, signed_err; 
input [9:0] signed_D_diff;

output [9:0] unsigned_err_sat, signed_err_sat;  
output [6:0] signed_D_diff_sat;

///////////////////////////////////////////////////////////////////////////////////////////////////////

assign unsigned_err_sat[9:0] = (~&unsigned_err[15:9] ? 12'h3FF : unsigned_err[9:0]);

///////////////////////////////////////////////////////////////////////////////////////////////////////

// 10 0000 0000 
// 11 1111 1111

assign signed_err_sat[9:0] = signed_err[15] ? 
			     (~&signed_err[14:9] ? 12'h200 : signed_err[9:0]) :   /* if negative */
			     (~&signed_err[14:9] ? 12'h3FF : signed_err[9:0]) ;   /* if positive */

///////////////////////////////////////////////////////////////////////////////////////////////////////

// 10 0000 
// 11 1111 

assign signed_D_diff_sat[6:0] = signed_D_diff[9] ? 
			     (~&signed_D_diff[8:6] ? 12'h20 : signed_D_diff[6:0]) :   /* if negative */
			     (~&signed_D_diff[8:6] ? 12'h3F : signed_D_diff[6:0]) ;   /* if positive */

///////////////////////////////////////////////////////////////////////////////////////////////////////

endmodule 