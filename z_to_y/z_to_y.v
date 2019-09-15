
`timescale 1ns / 1ps

module z_to_y(
    input [7:0] S1,
    input [7:0] S2,
    input [7:0] S3,
    input [7:0] S4,
    input [7:0] S5,
    input [7:0] S6,
    input [7:0] z1,
    input [7:0] z2,
    input [7:0] z3,
    input signal,
//    input clk,
//    output ready,
    output [7:0] y1,
    output [7:0] y2,
    output [7:0] y3
    );

wire [7:0] z1z1,z2z2,z1z1z2,z1z2z2,delta;
multiply multiply1 (.X(z1z1),.A(z1),.B(z1));
multiply multiply2 (.X(z2z2),.A(z2),.B(z2));
multiply multiply3 (.X(z1z1z2),.A(z1z1),.B(z2));
multiply multiply4 (.X(z1z2z2),.A(z1),.B(z2z2));
assign delta = z1z2z2^z1z1z2;

wire [7:0] S1z2z2,S2z2,delta1;
multiply multiply5(.X(S1z2z2),.A(S1),.B(z2z2));
multiply multiply6(.X(S2z2),.A(S2),.B(z2));
assign delta1 = S1z2z2^S2z2;

wire [7:0] S1z1z1,S2z1,delta2;
multiply multiply7(.X(S1z1z1),.A(S1),.B(z1z1));
multiply multiply8(.X(S2z1),.A(S2),.B(z1));
assign delta2 = S1z1z1^S2z1;

wire [7:0] i_delta,out1,out2;
Inverse_8_bit Inverse1 (.x(delta),.y(i_delta));
multiply multiply9(.X(out1),.A(delta1),.B(i_delta));
multiply multiply10(.X(out2),.A(delta2),.B(i_delta));

wire [7:0] del,del1,del2,del3,i_del,out3,out4,out5,z1z1z1,z2z2z2,z3z3,z3z3z3;
multiply multiply11(.X(z1z1z1),.A(z1z1),.B(z1));
multiply multiply12(.X(z2z2z2),.A(z2z2),.B(z2));
multiply multiply13(.X(z3z3),.A(z3),.B(z3));
multiply multiply14(.X(z3z3z3),.A(z3z3),.B(z3));
Determinant determnant1 (.d1(z1),.d2(z2),.d3(z3),.d4(z1z1),.d5(z2z2),.d6(z3z3),.d7(z1z1z1),.d8(z2z2z2),.d9(z3z3z3),.out(del));
Determinant determnant2 (.d1(S1),.d2(z2),.d3(z3),.d4(S2),.d5(z2z2),.d6(z3z3),.d7(S3),.d8(z2z2z2),.d9(z3z3z3),.out(del1));
Determinant determnant3 (.d1(z1),.d2(S1),.d3(z3),.d4(z1z1),.d5(S2),.d6(z3z3),.d7(z1z1z1),.d8(S3),.d9(z3z3z3),.out(del2));
Determinant determnant4 (.d1(z1),.d2(z2),.d3(S1),.d4(z1z1),.d5(z2z2),.d6(S2),.d7(z1z1z1),.d8(z2z2z2),.d9(S3),.out(del3));
Inverse_8_bit Inverse2 (.x(del),.y(i_del));
multiply multiply15 (.X(out3),.A(del1),.B(i_del));
multiply multiply16 (.X(out4),.A(del2),.B(i_del));
multiply multiply17 (.X(out5),.A(del3),.B(i_del));

wire sig1 = ((~z1[0])&(~z1[1])&(~z1[2])&(~z1[3])&(~z1[4])&(~z1[5]));
wire sig2 = ((~z2[0])&(~z2[1])&(~z2[2])&(~z2[3])&(~z2[4])&(~z2[5]));
wire sig3 = ((~z3[0])&(~z3[1])&(~z3[2])&(~z3[3])&(~z3[4])&(~z3[5]));
assign y1 = sig1?8'b00000000:(sig2?S1:(sig3?out1:out3));
assign y2 = sig1?8'b00000000:(sig2?8'b00000000:(sig3?out2:out4));
assign y3 = sig1?8'b00000000:(sig2?8'b00000000:(sig3?8'b00000000:out5));


//always@(posedge(clk))
//begin
//	if(signal)
//		begin 
//			if(z1==8'b000000000)
//			begin
//				y1 = 8'b00000000;
//				y2 = 8'b00000000;
//				y3 = 8'b00000000;
//				ready = 1'b1;
//			end
			
//			else if(z2==8'b00000000)
//			begin
//				y1 = S1;
//				y2 = 8'b00000000;
//				y3 = 8'b00000000;
//				ready = 1'b1;
//			end
			
//			else if(z3==8'b000000000)
//			begin
//				y1 = out1;
//				y2 = out2;
//				y3 = 8'b00000000;
//				ready = 1'b1;
//			end
			
//			else
//			begin
//				y1 = out3;
//				y2 = out4;
//				y3 = out5;
//				ready = 1'b1;
//			end
//		end
//		else
//			ready = 1'b0;
//end
endmodule
