module note2SevenSeg(note,sevenseg);
input [2:0] note;
output reg [6:0] sevenseg;

always@(note)
begin 
	case(note)
		0:sevenseg=7'b0111111;	//show nothing is playing
		1:sevenseg=7'b0001000;  //A-note ~440.0 hz
		2:sevenseg=7'b0000011;	//B_note ~493.9 hz
		3:sevenseg=7'b1000110;	//C-note ~261.6 hz
		4:sevenseg=7'b0100001;	//D-note ~293.7 hz
		5:sevenseg=7'b0000110;	//E-note ~329.6 hz
		6:sevenseg=7'b0001110;	//f-note ~349.2 hz
		7:sevenseg=7'b1000010;	//g-note ~392.0 hz
	endcase
end
endmodule