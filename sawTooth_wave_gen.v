module sawTooth_wave_gen(clk,clkOut);
input clk;
output[7:0] clkOut;
n_bit_counter counter(clk,0,clkOut);
defparam counter.n=8; //make an 8 bit counter

endmodule