module red_nose
													//25 MHz clk, divided by 56818 = 440 Hz
(input clk,										//Divide 56818 by 2 to perserve 50% duty cycle output
output sound);
				 
logic [8:0] counter_note;
logic [7:0] counter_octave;

logic [8:0] frequency;

logic [30:0] tone;
always_ff@(posedge clk)
	tone <= tone + 1;

logic [7:0] fullnote;					 //6 bits encodes a note, therefore we can get 64 notes
												//There are 12 notes per octave, so 64 notes gives us over 5 octaves
												//With a 25MHz clock, each note lasts 167ms
logic [2:0] octave;



//assign fullnote = tone[27:22]; //tone acts as a 28 bit counter, 
										//we are extracting the 6 most significant bits to give us the 6 notes we want to play

divide_by12 divby12(.numer(fullnote[5:0]), .quotient(octave), .remain(note)); //Dividing the fullnote by 12 gives us 5 octaves

lpm_rom #(.LPM_WIDTH(8), .LPM_WIDTHAD(8), .LPM_FILE("music_rom.mif")) music_rom(.address(tone[29:22]), .inclock(clk), .outclock(clk), .q(fullnote));


always_ff@(posedge clk)
begin
	if(counter_note == 0) 						//Same as regular counter, but counting down instead!
		counter_note <= frequency;		
	else
		counter_note <= counter_note - 1;
end

always @(posedge clk)
	if(counter_note == 0)
	begin
	 if(counter_octave == 0)
			counter_octave <= (octave == 0 ? 255 : octave == 1 ? 127 : octave == 2 ? 63 : octave == 3 ? 31 : octave == 4 ? 15 : 7);
	 else
	  counter_octave <= counter_octave - 1;
end


always @(posedge clk) 
	if(counter_note==0 && counter_octave==0 && tone[30]==0 && fullnote!=0) 
		sound <= ~sound;
		
endmodule

//First, use a 24 bit counter called "tone" to produce a slow square wave. The MSB [23] toggles with a frequency of 1.5 Hz
//We use tone[23] to switch another counter between two frequencies