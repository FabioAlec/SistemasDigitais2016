module Area(
	input [11:0] ax,
	input [11:0] ay,
	input [11:0] bx,
	input [11:0] by,
	input [11:0] cx,
	input [11:0] cy,
	output [82:0] out
);
	wire signed [11:0] m1;
	wire signed [11:0] m2;
	wire signed [11:0] m3;
	wire signed [11:0] m4;
	wire signed [11:0] m5;
	wire signed [11:0] m6;

	wire signed [23:0] s1;
	wire signed [23:0] s2;
	wire signed [23:0] s3;
	
	wire signed [82:0] sumf;

	assign m1 = ax * by;
	assign m2 = ay * bx;
	assign m3 = ay * cx;
	assign m4 = ax * cy;
	assign m5 = bx * cy;
	assign m6 = by * cx;

	assign s1 = m2 - m1;
	assign s2 = m4 - m3;
	assign s3 = m6 - m5;

	assign sumf = s1 + s2 + s3;
	
	assign out = sumf;

endmodule

module isintriangule(
	input [11:0] px,
	input [11:0] py,
	input [11:0] ax,
	input [11:0] ay,
	input [11:0] bx,
	input [11:0] by,
	input [11:0] cx,
	input [11:0] cy,
	output out
);
	wire [82:0] b1;
	wire [82:0] b2;
	wire [82:0] b3;
	
	Area A1(px, py, bx, by, cx, by, b1);
	Area A2(ax, ay, px, py, cx, cy, b2);
	Area A3(ax, ay, bx, by, px, py, b3);


	assign out = (b1 > 1'b0) && (b2 > 1'b0) && (b3 > 1'b0);

endmodule

module principal;

	integer input_file;
	integer output_file;

	reg [90:0] value;

	reg [11:0] ax; reg [11:0] ay;
	reg [11:0] bx; reg [11:0] by;
	reg [11:0] cx; reg [11:0] cy;
	reg [11:0] px; reg [11:0] py;

	isintriangule A(px, py, ax, ay, bx, by, cx, cy, out);

	integer x; 
	integer y;

	initial begin
		input_file  = $fopen("Result.txt", "r");
		output_file = $fopen("Result_verilog.txt", "w");

		if(input_file == 0) begin
			$display("Cannot open input_file. Does it exists?");
			$finish;
		end
	end

	always #2 begin
		if(!$feof(input_file)) begin			
			value = $fscanf(input_file, "A(%d, %d),  B(%d, %d), C(%d, %d),  P(%d, %d)\n", ax, ay, bx, by, cx, cy, px, py);
			#1			
			$fwrite(output_file, "A(%0d, %0d),  B(%0d, %0d), C(%0d, %0d),  P(%0d, %0d) = %0d\n", ax, ay, bx, by, cx, cy, px, py, out);
		end
		else begin
			$finish;
		end
	end

endmodule
