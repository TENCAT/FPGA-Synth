module 3_to_8_multiplexer(x,s,y);
input [23:0] x;
input [2:0] s;
output [2:0] y;

always@(s)
	if(s==0)
		y[2:0] = x[2:0];
	else if(s==1)
		y[2:0] = x[5:3];
	else if(s==2)
		y[2:0] = x[8:6];
	else if(s==3)
		y[2:0] = x[11:9];
	else if(s==4)
		y[2:0] = x[14:12];
	else if(s==5)
		y[2:0] = x[17:15];
	else if(s==6)
		y[2:0] = x[20:18];
	else
		y[2:0] = x[23:21];
endmodule