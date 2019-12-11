module square_wave_gen(clk,note,en,speak_out);
input clk,en;
input [2:0] note;
output reg speak_out;
reg speak;

reg [19:0]  maxcnt;
reg [19:0] clk_count;
always @(note)
	begin
		case(note)
		0:maxcnt=0;			//don't play anything
		1:maxcnt=113636;  //A-note ~440.0 hz
		2:maxcnt=101235;	//B_note ~493.9 hz
		3:maxcnt=191131;	//C-note ~261.6 hz
		4:maxcnt=170241;	//D-note ~293.7 hz
		5:maxcnt=151699;	//E-note ~329.6 hz
		6:maxcnt=143184;	//f-note ~349.2 hz
		7:maxcnt=127551;	//g-note ~392.0 hz
		endcase
	end

always@(posedge clk)
begin
	if(clk_count>=maxcnt)	
	begin
		speak <= !speak;		//create 50% duty cycle
		clk_count=0;
	end
	else
		clk_count=clk_count+1;
	if(en)
		speak_out=speak;
	else
		speak_out=0;
		
end

endmodule		