module play_pause(clk,btn,reset,z);
input clk,reset,btn;
output z;

reg [1:0] Q_present,Q_next;

localparam play=1;
localparam pause=0;
localparam toPause=2;
localparam toPlay=3;

always@(btn,Q_present)
	begin
		case(Q_present)
			pause:
			begin
				if(btn==0)
					Q_next=toPlay;
				else
					Q_next=pause;
			end
			play:
			begin
				if(btn==0)
					Q_next=toPause;
				else
					Q_next=play;
			end
			toPause:
			begin
				if(btn==0)
					Q_next=toPause;
				else
					Q_next=pause;
			end
			toPlay:
			begin
				if(btn==0)
					Q_next=toPlay;
				else
					Q_next=play;
			end
		endcase
	end

assign z = (Q_present == play);

always @(posedge clk, negedge reset)
begin
	if(!reset)
		Q_present <= pause;
	else
		Q_present <=Q_next;

end
endmodule