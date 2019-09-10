`timescale 1ns / 1ps
module main(
input clk
    );
    wire [7:0] w1,w2,w3,w4,w5,w6;
    assign w1 = 8'd215;
    assign w2 = 8'd2;
    assign w3 = 8'd148;
    assign w4 = 8'd39;
    assign w5 = 8'd1;
    assign w6 = 8'd54;

    reg [2:0] sig = 3'b100;
    
    always@(posedge clk)
        sig <= {1'b0,sig[2:1]};
    
    wire [7:0] s0,s1,s2,s3;
    S_to_Sigma sigma1 (.w1(w1),.w2(w2),.w3(w3),.w4(w4),.w5(w5),.w6(w6),.clk(clk),.signal(sig[0]),.s0(s0),.s1(s1),.s2(s2),.s3(s3));    

endmodule

module S_to_Sigma(
    input clk,
    input signal,
    input [7:0] w1,
    input [7:0] w2,
    input [7:0] w3,
    input [7:0] w4,
    input [7:0] w5,
    input [7:0] w6,
    output reg ready,
    output [7:0] s0,
    output reg [7:0] s1,
    output reg [7:0] s2,
    output reg [7:0] s3
//    output [7:0] dlt,
//    output [7:0] dlt1,
//    output [7:0] dlt2,
//    output [7:0] dlt3
    );

reg [7:0] S1,S2,S3,S4,S5,S6;
always@(negedge(clk))
begin
	if(signal)
	begin
		S1<=w1;
		S2<=w2;
		S3<=w3;
		S4<=w4;
		S5<=w5;
		S6<=w6;
	end
end

parameter S_idle = 3'b000,
				S_T0 = 3'b001,
				S_T1 = 3'b010,
				S_T2 = 3'b011,
				S_T3 = 3'b100;

	reg [2:0] state = 3'b000,next_state = 3'b000;
	reg load,T0,T1,T2,T3;
	reg [1:0] OS_T0,OS_T1,OS_T2,OS_T3;

	assign s0 = 8'b00000001;

always@(posedge clk)
	state <= next_state;

always@(state,signal,OS_T0,OS_T1,OS_T2,OS_T3)
	begin
		load = 0;
		T0 = 0;
		T1 = 0;
		T2 = 0;
		T3 = 0;
		case(state)
			S_idle:  
				begin 
					load = 1; 
					if(signal) 
						next_state = S_T0;
				end
			S_T0: 
				begin  
					T0 = 1;
					if(OS_T0 == 2'b01) next_state = S_T1;
					if(OS_T0 == 2'b10) next_state = S_idle;
				end	
			S_T1:	   
				begin 
					T1 = 1;
					if(OS_T1 == 2'b01) next_state = S_T2;
					if(OS_T1 == 2'b10) next_state = S_idle;
				end
			S_T2:	   
				begin 
					T2 = 1;
					if(OS_T2 == 2'b01) next_state = S_T3;
					if(OS_T2 == 2'b10) next_state = S_idle;					
				end	
			S_T3:
				begin
					T3 = 1;
					next_state = S_idle;
				end
			default: next_state = S_idle;
		endcase
	end
wire [7:0] out1,out2,out12,out22,out13,out23;
equation e1 (.S1(S1),.S2(S2),.S3(S3),.S4(S4),.out1(out1),.out2(out2));
equation e2 (.S1(S3),.S2(S4),.S3(S5),.S4(S6),.out1(out12),.out2(out22));
equation e3 (.S1(S2),.S2(S3),.S3(S4),.S4(S5),.out1(out13),.out2(out23));

wire [7:0] dlt,dlt1,dlt2,dlt3;
wire [7:0] out3,out4,out5,i_dlt;
Determinant d1 (.d1(S1),.d2(S2),.d3(S3),.d4(S2),.d5(S3),.d6(S4),.d7(S3),.d8(S4),.d9(S5),.out(dlt));
Determinant d2 (.d1(S4),.d2(S2),.d3(S3),.d4(S5),.d5(S3),.d6(S4),.d7(S6),.d8(S4),.d9(S5),.out(dlt1));
Determinant d3 (.d1(S1),.d2(S4),.d3(S3),.d4(S2),.d5(S5),.d6(S4),.d7(S3),.d8(S6),.d9(S5),.out(dlt2));
Determinant d4 (.d1(S1),.d2(S2),.d3(S4),.d4(S2),.d5(S3),.d6(S5),.d7(S3),.d8(S4),.d9(S6),.out(dlt3));

Inverse_8_bit I2 (.x(dlt),.y(i_dlt));
multiply M9 (.X(out3),.A(i_dlt),.B(dlt1));
multiply M10 (.X(out4),.A(i_dlt),.B(dlt2));
multiply M11 (.X(out5),.A(i_dlt),.B(dlt3));

wire [7:0] i_S1,i_S2,i_S3,i_S4,i_S5,S2S1,S3S2,S4S3,S5S4,S6S5;
Inverse_8_bit I3 (.y(i_S1),.x(S1));
Inverse_8_bit I4 (.y(i_S2),.x(S2));
Inverse_8_bit I5 (.y(i_S3),.x(S3));
Inverse_8_bit I6 (.y(i_S4),.x(S4));
Inverse_8_bit I7 (.y(i_S5),.x(S5));
multiply M12 (.X(S2S1),.A(S2),.B(i_S1));
multiply M13 (.X(S3S2),.A(S3),.B(i_S2));
multiply M14 (.X(S4S3),.A(S4),.B(i_S3));
multiply M15 (.X(S5S4),.A(S5),.B(i_S4));
multiply M16 (.X(S6S5),.A(S6),.B(i_S5));

always@(posedge clk)
	begin
		if(load)	
			begin
				OS_T0 = 2'b00;
				OS_T1 = 2'b00;
				OS_T2 = 2'b00;
				OS_T3 = 2'b00;
				ready = 0;
			end	
		
		else if(T0)
			begin
				if((S1 == 8'b00000000)&(S2 == 8'b00000000)&(S3 == 8'b00000000)&(S4 == 8'b00000000)&(S5 == 8'b00000000)&(S6 == 8'b00000000))
					begin
						s1 = 8'b00000000;
						s2 = 8'b00000000;
						s3 = 8'b00000000;
						ready = 1;
						OS_T0 = 2'b10;
					end
				else
					OS_T0 = 2'b01;
			end
		
		else if(T1)
			begin
				if((S2S1 == S3S2)&(S3S2 == S4S3)&(S4S3 == S5S4)&(S5S4 == S6S5))
					begin
						s1 = S2S1;
						s2 = 8'b00000000;
						s3 = 8'b00000000;
						ready = 1;
						OS_T1 = 2'b10;
					end
				else
					OS_T1 = 2'b01;
			end
		
		else if(T2)
			begin
				if((out1==out12)&&(out1==out13)&&(out2==out22)&&(out2==out23))
					begin
						s1 = out1;
						s2 = out2;
						s3 = 8'b00000000;
						ready = 1;
						OS_T2 = 2'b10;
					end
				else
					OS_T2 = 2'b01;
			end
			
	   else if(T3)
			begin
				if(dlt == 8'b00000000)
					begin 
						OS_T3 = 2'b01;
						s1 = 8'bxxxxxxxx;
						s2 = 8'bxxxxxxxx;
						s3 = 8'bxxxxxxxx;
					end
				else
					s1 = out3;
					s2 = out4;
					s3 = out5;
					ready = 1;
					OS_T3 = 2'b10;
			end	
	end
	
endmodule

module equation(
input [7:0] S1,
input [7:0] S2,
input [7:0] S3,
input [7:0] S4,
output [7:0] out1,
output [7:0] out2
);
wire [7:0] delta,delta1,delta2,m1,m2,m3,m4,m5,m6,i_delta;
multiply M1 (.X(m1),.A(S1),.B(S3));
multiply M2 (.X(m2),.A(S2),.B(S2));
assign delta = m1^m2;

multiply M3 (.X(m3),.A(S1),.B(S4));
multiply M4 (.X(m4),.A(S2),.B(S3));
assign delta1 = m3^m4;

multiply M5 (.X(m5),.A(S2),.B(S4));
multiply M6 (.X(m6),.A(S3),.B(S3));
assign delta2 = m5^m6;

Inverse_8_bit I1 (.x(delta),.y(i_delta));
multiply M7 (.X(out1),.A(i_delta),.B(delta1));
multiply M8 (.X(out2),.A(i_delta),.B(delta2));
endmodule