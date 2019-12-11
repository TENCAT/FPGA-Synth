module three_to_8_multi(a,b,c,d,e,f,g,h,s,y);
input [2:0] a,b,c,d,e,f,g,h;
input [2:0] s;
output reg [2:0] y;

always@*
	if(s==0)
		y[2:0] = a;
	else if(s==1)
		y[2:0] = b;
	else if(s==2)
		y[2:0] = c;
	else if(s==3)
		y[2:0] = d;
	else if(s==4)
		y[2:0] = e;
	else if(s==5)
		y[2:0] = f;
	else if(s==6)
		y[2:0] = g;
	else
		y[2:0] = h;
endmodule