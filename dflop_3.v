module n_reg(D,Clk,resetn,Q);
parameter n=3; //define inputs and outputs
input [n-1:0]D;
input Clk,resetn;
output reg [n-1:0]Q;

always @(negedge resetn, posedge Clk) //on positive clock or when reset goes low
if(!resetn)
//if reset goes low
Q<=0;//register back to zero
else
Q<=D;//otherwise it is set to input
endmodule