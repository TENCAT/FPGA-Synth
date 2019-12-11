module n_bit_counter(clk,en,reset,z);
parameter n=3;
input clk,reset,en;
output reg [n-1:0] z;

always@(posedge clk,negedge reset)
begin
	if(!reset)
		z=0;
	else if (en)
		z=z+1;
end
endmodule