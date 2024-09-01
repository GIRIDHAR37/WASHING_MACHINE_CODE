module wmc(input clk,rst,start,stop,
      	   output reg [1:0]ws,rs,ss,
		   output reg [3:0]delay_counter
			);
		reg [2:0]ps,ns;
		parameter IDLE = 3'b000;
		parameter START = 3'b001;
		parameter WASH = 3'b010;
		parameter RINSE = 3'b011;
		parameter SPIN = 3'b100;
		parameter COMPLETE = 3'b101;
		parameter STOPED = 3'b110;
		parameter WASH_DURATION = 4'd10;
		parameter RINSE_DURATION= 4'd5;
		parameter SPIN_DURATION = 4'd7;

		always @(posedge clk or posedge rst)
			begin
				if(rst) begin
					ps <= IDLE;
					delay_counter <= 4'b0000;
				end
			    else begin
					ps <= ns;
					if(ps!=ns)
						delay_counter <= 4'b0000;
					else 
						delay_counter <= delay_counter+1;
				end
			end

			always @(clk,rst,start,stop) begin
				ws=2'b00;rs=2'b00;ss=2'b00;
				ns = ps;
				case(ps)
					IDLE : begin
						if(start) 
							ns=START;
					end
					START : begin
						if(delay_counter == 4'd2)
							ns=WASH;
					end
					WASH : begin
						ws=2'b01;
						if(stop) 
							ns=STOPED;
						else if(delay_counter == WASH_DURATION)
							ns=RINSE;
					end
					RINSE : begin
						rs=2'b01;
						if(stop) 
							ns=STOPED;
						else if(delay_counter == RINSE_DURATION)
							ns=SPIN;
					end
					SPIN : begin
						ss=2'b01;
						if(stop) 
							ns=STOPED;
						else if(delay_counter == SPIN_DURATION)
							ns=COMPLETE;
					end
					COMPLETE : begin
						ws=2'b10;rs=2'b10;ss=2'b10;						
						if(stop) 
							ns=STOPED;
						else 
							ns=IDLE;
					end
					STOPED : begin
						if(start) 
							ns=START;
						else if(rst) 
							ns=IDLE;
					end
					default : ns = IDLE;
				endcase
			end
	        always @(ns) begin
				ps<=ns;
			end
endmodule
