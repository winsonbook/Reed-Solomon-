
module Test_berleykamp_messey;

	// Inputs
	reg clk;
	reg signal;
	reg [7:0] w1;
	reg [7:0] w2;
	reg [7:0] w3;
	reg [7:0] w4;
	reg [7:0] w5;
	reg [7:0] w6;

	// Outputs
	wire ready;
	wire [7:0] s0;
	wire [7:0] s1;
	wire [7:0] s2;
	wire [7:0] s3;
//    wire [7:0] dlt;
//    wire [7:0] dlt1;
//    wire [7:0] dlt2;
//    wire [7:0] dlt3;
    
	// Instantiate the Unit Under Test (UUT)
	berleykamp_messey uut (
		.clock(clk), 
		.signal(signal), 
		.S1(w1), 
		.S2(w2), 
		.S3(w3), 
		.S4(w4), 
		.S5(w5), 
		.S6(w6), 
		.ready(ready), 
		.s0(s0), 
		.s1(s1), 
		.s2(s2), 
		.s3(s3)
//		.dlt(dlt),
//		.dlt1(dlt1),
//		.dlt2(dlt2),
//		.dlt3(dlt)
	);

	initial begin
		// Initialize Inputs
		clk = 1;
		signal = 0;
        #10;
		clk = ~clk;
		#10;
		clk = ~clk;
		
		signal = 1;
		w1 = 215;
		w2 = 2;
		w3 = 148;
		w4 = 39;
		w5 = 1;
		w6 = 54;
		
		#10;
		clk = ~clk;
		#10;
		clk = ~clk;
		signal = 0;	
		
		repeat(30)
		begin
		#10;
		clk = ~clk;
		end
		signal = 1;
		w1 = 48;
		w2 = 105;
		w3 = 235;
		w4 = 248;
		w5 = 183;
		w6 = 239;
		
		#10
		clk = ~clk;
		#10
		clk = ~clk;

		signal = 0;
		repeat(30)
		begin
		#10
		clk=~clk;
		end

		signal = 1;
		w1 = 5;
		w2 = 3;
		w3 = 15;
		w4 = 23;
		w5 = 39;
		w6 = 71;
		
		#10
		clk = ~clk;
		#10
		clk = ~clk;
		signal = 0;
		
		repeat(30)
		begin
		#10
		clk=~clk;
		end
		
		signal = 1;
		w1 = 124;
		w2 = 14;
		w3 = 3;
		w6 = 15;
		
		#10
		clk = ~clk;
		#10
		clk = ~clk;
		signal = 0;
		
		repeat(30)
		begin
		#10
		clk=~clk;
		end
		
		signal = 1;
		w1 = 200;
		w3 = 1;
		w4 = 15;
		w5 = 132;

		#10
		clk = ~clk;
		#10
		clk = ~clk;
		signal = 0;
		
		repeat(30)
		begin
		#10;
		clk = ~clk;
		end
		
		signal = 1;
		w1 = 215;
		w2 = 2;
		w3 = 148;
		w4 = 39;
		w5 = 1;
		w6 = 54;

		#10
		clk = ~clk;
		#10
		clk = ~clk;
		signal = 0;
		
		repeat(30)
		begin
		#10;
		clk = ~clk;
		end
        
		// Add stimulus here

	end
      
endmodule


