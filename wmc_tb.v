`include "wmc.v"
module wmctb;
	reg clk,rst,start,stop;
	wire [1:0]ws,rs,ss;
	wire [3:0]delay_counter;

	wmc wmctb(.clk(clk),.rst(rst),.start(start),.stop(stop),.ws(ws),.rs(rs),.ss(ss),.delay_counter(delay_counter));

	always #5 clk=~clk;

	initial begin
		clk=0; rst=1; start=0; stop=0;
		#10;
		rst=0;
		#10;
		start=1;
		#10;
		start=0;
		#250;
		stop=1;
		#10;
		stop=0;
		#10;
		start=1;
		#10;
		start=0;
		#250;
		$finish();
	end
endmodule
