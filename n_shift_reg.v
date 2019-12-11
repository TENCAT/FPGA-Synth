module n_shift_reg(CLK,d,en,reset,Q);
parameter n=8;
input [n-1:0] d;
input CLK,reset,en;
output reg [n-1:0] Q;

always@(posedge CLK,negedge reset)
if(!reset)
	Q<=d;
else if(en)
	begin
		Q<=(Q>>1);
		Q[n-1]<=Q[0];
	end
endmodule