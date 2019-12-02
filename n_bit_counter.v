module n_bit_counter(clk,reset,z);
parameter n=3;
input clk,reset;
output reg [n-1:0] z;

always@(posedge clk,negedge reset);
begin
	if(!reset)
		z=0;
	else
		z=z+1;
end
endmodule;