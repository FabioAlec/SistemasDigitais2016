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

	if(b1 > 0 && b2 > 0 && b3 > 0)begin
		assign out = 1;
	end
	else begin
		assign out = 0;
	end
endmodule

module criar;

integer arq_file;
integer escr_file;
integer value;

reg signed [11:0] px;
reg signed [11:0] py;
reg signed [11:0] ax;
reg signed [11:0] ay;
reg signed [11:0] bx;
reg signed [11:0] by;
reg signed [11:0] cx;
reg signed [11:0] cy;
wire saida;
reg state = 0;
isintriangule T(px, py, ax, ay, bx, by, cx, cy, saida);

initial begin
  arq_file = $fopen("entradas.txt", "r");
  escr_file = $fopen("saidas_verilog.txt", "w");
  if (arq_file == 0) begin
    $display("Arquivo não foi aberto");
    $finish;
  end else begin
    $display("Arquivo foi aberto!");
  end
  if (escr_file == 0) begin
    $display("Arquivo escr não foi aberto");
    $finish;
  end else begin
    $display("Arquivo 2 foi aberto!");
  end
end

always #2 begin
  if (!$feof(arq_file)) begin
	  if (state != 0)begin

	    $fdisplay(escr_file, "%d%d %d %d %d %d %d %d = %d",
	      px, py, ax, ay, bx, by, cx, cy, saida);

	    value = $fscanf(arq_file, "%d %d %d %d %d %d %d %d\n",
	      px, py, ax, ay, bx, by, cx, cy);
	  end else begin
		value = $fscanf(arq_file, "%d %d %d %d %d %d %d %d\n",
	      px, py, ax, ay, bx, by, cx, cy);
		state = 1;
  	end
  end
  else begin
    $finish;
  end
end

endmodule
