module n_reg(D,Clk,en,resetn,Q);
parameter n=3; //define inputs and outputs
input [n-1:0] D;
input Clk,resetn,en;
output reg [n-1:0] Q;

always @(posedge Clk,negedge resetn) //on positive clock or when reset goes low
if(!resetn) //if reset goes low
	Q<=0;//register back to zero
else if(en)
	Q<=D;//otherwise it is set to input
endmodule