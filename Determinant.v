module Determinant(
    input [7:0] d1,
    input [7:0] d2,
    input [7:0] d3,
    input [7:0] d4,
    input [7:0] d5,
    input [7:0] d6,
    input [7:0] d7,
    input [7:0] d8,
    input [7:0] d9,
    output [7:0] out
    );
wire [7:0] ml1,ml2,ml3,ml4,ml5,ml6,ml7,ml8,ml9,cof1,cof2,cof3,temp;
multiply m1 (.X(ml1),.A(d5),.B(d9));
multiply m2 (.X(ml2),.A(d6),.B(d8));
multiply m3 (.X(ml3),.A(d4),.B(d9));
multiply m4 (.X(ml4),.A(d6),.B(d7));
multiply m5 (.X(ml5),.A(d4),.B(d8));
multiply m6 (.X(ml6),.A(d5),.B(d7));
assign cof1 = ml1^ml2;
assign cof2 = ml3^ml4;
assign cof3 = ml5^ml6;
multiply m7 (.X(ml7),.A(d1),.B(cof1));
multiply m8 (.X(ml8),.A(d2),.B(cof2));
multiply m9 (.X(ml9),.A(d3),.B(cof3));
assign temp = ml7^ml8;
assign out = temp^ml9;

endmodule