module three_to_8_multi(a,b,c,d,e,f,g,h,s,y);
input [2:0] a,b,c,d,e,f,g,h;
input [2:0] s;
output reg [2:0] y;

always@*
	if(s==3'b000)
		y[2:0] = a[2:0];
	else if(s==3'b001)
		y[2:0] = b[2:0];
	else if(s==3'b010)
		y[2:0] = c[2:0];
	else if(s==3'b011)
		y[2:0] = d[2:0];
	else if(s==3'b100)
		y[2:0] = e[2:0];
	else if(s==3'b101)
		y[2:0] = f[2:0];
	else if(s==3'b110)
		y[2:0] = g[2:0];
	else
		y[2:0] = h[2:0];
endmodule