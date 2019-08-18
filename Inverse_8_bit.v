
module Inverse_8_bit(
    input [7:0] x,
    output [7:0] y
    );
wire [7:0] x2,x3,x4,x7,x8,x15,x30,x60,x120,x127,x254;	 
	 
multiply MM1(.A(x),.B(x),.X(x2));
multiply MM2(.A(x),.B(x2),.X(x3));
multiply MM3(.A(x2),.B(x2),.X(x4));
multiply MM4(.A(x3),.B(x4),.X(x7));
multiply MM5(.A(x4),.B(x4),.X(x8));
multiply MM6(.A(x7),.B(x8),.X(x15));
multiply MM7(.A(x15),.B(x15),.X(x30));
multiply MM8(.A(x30),.B(x30),.X(x60));
multiply MM9(.A(x60),.B(x60),.X(x120));
multiply MM10(.A(x7),.B(x120),.X(x127));
multiply MM11(.A(x127),.B(x127),.X(x254));


assign y = x254;
endmodule
