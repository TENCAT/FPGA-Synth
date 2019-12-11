module dflop_3(clk,d,en,reset,q);
input [2:0] d;
input en,reset,clk;
output reg [2:0] q;

always@(posedge clk,posedge reset)
	if(reset)
		q<=000;
	else if(en)
		q<=d;
endmodule