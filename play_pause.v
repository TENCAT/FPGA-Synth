module play_pause(clk,reset,z);
input clk,reset;
output z;

reg Q_present,Q_next;

localparam play=0;
localparam pause=1;

always@(z,Q_present)
	begin
	case(z,Q_present)
		play:
		begin
			if(z)
				Q_next=pause;
			else
				Q_next=play;
		end
		pause:
		begin
			if(z)
				Q_next=play;
			else
				Q_next=pause;
		end

always @(posedge clk, negedge reset)
begin
	if(!reset)
		Q_present <= pause;
	else
		Q_present <=Q_next;

end
endmodule