
module encoder(
    input [7:0] MX,
    input start,
    input stop,
    input clk,
     output reg [7:0] CX,
	 output reg [1:0] state,
	 output reg [1:0] next_state,
	 output reg out,
	 output reg load,
	 output reg work,
	 output reg [7:0] counter,
	 output reg [2:0] counter_out
    );
parameter S_idle = 2'b00 , 
				S_in = 2'b01,
				S_out = 2'b10;	

reg [7:0] X0,X1,X2,X3,X4,X5;
wire [7:0] X5MX,X0_h,X1_h,X2_h,X3_h,X4_h,X5_h;


always@(negedge(clk))
	begin
		if(stop) state = S_idle;
		else     state = next_state;
	end

always@(state,start,counter,counter_out)
	begin
		load = 0;
		work = 0;
		out  = 0;
		case(state)
			S_idle: 
				begin
					load = 1; 
					if(start) 
						next_state = S_in;
				end
			S_in:	
				begin
					work = 1;
					if(counter>=249) 
						next_state = S_out;
				end
			S_out:
				begin
					out = 1;
					if(counter_out>5)
						next_state = S_idle;
				end
			default: next_state = S_idle;
		endcase
	end

assign  X5MX = X5 ^ MX;
wire [7:0] g0 = 117;
wire [7:0] g1 = 49;
wire [7:0] g2 = 58;
wire [7:0] g3 = 158;
wire [7:0] g4 = 4;
wire [7:0] g5 = 126;
multiply M0 (.A(X5MX),.B(g0),.X(X0_h));
multiply M1 (.A(X5MX),.B(g1),.X(X1_h));
multiply M2 (.A(X5MX),.B(g2),.X(X2_h));
multiply M3 (.A(X5MX),.B(g3),.X(X3_h));
multiply M4 (.A(X5MX),.B(g4),.X(X4_h));
multiply M5 (.A(X5MX),.B(g5),.X(X5_h));

always@(posedge(clk))
	begin
		if(load)
			begin
				counter <= 8'b00000000;
				counter_out <= 3'b000;
				X0 <= 8'b00000000;
				X1 <= 8'b00000000;
				X2 <= 8'b00000000;
				X3 <= 8'b00000000;
				X4 <= 8'b00000000;
				X5 <= 8'b00000000;
				CX <= 8'b00000000;
			end
		if(work)
			begin
				X5 <= X4^X5_h;
				X4 <= X3^X4_h;
				X3 <= X2^X3_h;
				X2 <= X1^X2_h;
				X1 <= X0^X1_h;
				X0 <= X0_h;
				CX <= MX;
				counter <= counter + 1;
			end
		 if(out)
			begin
				CX <= X5;
				X5 <= X4;
				X4 <= X3;
				X3 <= X2;
				X2 <= X1;
				X1 <= X0;
				X0 <= 8'b00000000;
				counter_out <= counter_out+1;
			end
	end
endmodule
