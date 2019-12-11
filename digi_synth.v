module digi_synth(KEY,SW,GPIO_1,CLOCK_50,LEDG,LEDR,HEX0);
input CLOCK_50;
input [3:0] KEY;
input [17:0] SW;
output [1:0] GPIO_1;
output [7:0] LEDG,LEDR;
output [6:0] HEX0;

wire [2:0] note,s,z,y,selectOut;
wire [2:0] a,b,c,d,e,f,g,h;
wire clkOut,x;
	
n_clk_divider div(CLOCK_50,clkOut);
	defparam div.n=16;
	
play_pause(CLOCK_50,KEY[0],KEY[1],x);
n_bit_counter count(~KEY[2],1,KEY[1],s[2:0]);

n_bit_counter selectorSwitch(clkOut,x,KEY[1],selectOut[2:0]);

n_shift_reg lightShift(clkOut,8'b10000000,x,KEY[1],LEDR[7:0]);

n_reg firstNote(s[2:0],KEY[3],SW[7],KEY[1], a[2:0]);
n_reg secondNote(s[2:0],KEY[3],SW[6],KEY[1],b[2:0]);
n_reg thirdNote(s[2:0],KEY[3],SW[5],KEY[1],c[2:0]);
n_reg fourthNote(s[2:0],KEY[3],SW[4],KEY[1],d[2:0]);
n_reg fifthNote(s[2:0],KEY[3],SW[3],KEY[1],e[2:0]);
n_reg sixthNote(s[2:0],KEY[3],SW[2],KEY[1],f[2:0]);
n_reg sevenNote(s[2:0],KEY[3],SW[1],KEY[1],g[2:0]);
n_reg eightNote(s[2:0],KEY[3],SW[0],KEY[1],h[2:0]);
	
three_to_8_multi selector(a[2:0],b[2:0],c[2:0],d[2:0],e[2:0],f[2:0],g[2:0],h[2:0],selectOut[2:0],y[2:0]);
square_wave_gen wave(CLOCK_50,y[2:0],x,GPIO_1[0]);
note2SevenSeg lights(s[2:0],HEX0[6:0]);
endmodule