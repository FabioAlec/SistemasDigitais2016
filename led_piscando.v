module teste_led(input CLOCK_50, 
				output [3:0] LEDG
);
	
	reg [25:0]counter;
//Declarando registrador de 26 bits
	reg pisca0 = 1;
//Declarando variavel para piscar;

assign LEDG[0] = pisca0;
assign LEDG[1] = pisca0;
assign LEDG[2] = pisca0;

	always @(posedge CLOCK_50) begin
		if (counter == 50000000)begin
			pisca0 <= ~pisca0;// Muda o estado do led quando contador chega a 50 MHZ
			counter <=0; // Zera o contador
		end
		else begin
			counter <= counter +1;// Incrementa contador
		end
	end	

	

endmodule
