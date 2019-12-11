module digi_synth(KEY,SW,GPIO_0_D,CLOCK_50,LED);
input CLOCK_50;
input [1:0] KEY;
input [3:0] SW;
output [1:0] GPIO_0_D;
output [3:0] LED;

reg [2:0] a=000;
reg [2:0] b=001;
reg [2:0] c=010;
reg [2:0] d=011;
reg [2:0] e=100;
reg [2:0] f=101;
reg [2:0] g=110;
reg [2:0] h=111;
wire [2:0] note,s,z,y;
wire clkOut,x;
	
	n_clk_divider div(CLOCK_50,clkOut);
	defparam div.n=16;
	
	play_pause(CLOCK_50,KEY[0],KEY[1],x);
	n_bit_counter count(clkOut,x,KEY[1],s[2:0]);
	
	three_to_8_multi multi (a,b,c,d,e,f,g,h,s[2:0],y[2:0]);
	square_wave_gen wave(CLOCK_50,y[2:0],x,GPIO_0_D[1]);
	
	assign LED[2:0]=y[2:0];
endmodule