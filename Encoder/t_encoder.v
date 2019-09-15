`timescale 1ns / 1ps
module Encoder_test;
	// Inputs
	reg [7:0] MX;
	reg start;
	reg stop;
	reg clk;

	// Outputs
	wire [7:0] CX;
	wire [1:0] state;
	wire [1:0] next_state;
	wire out;
	wire load;
	wire work;
	wire [7:0] counter;
	wire [2:0] counter_out;
	// Instantiate the Unit Under Test (UUT)
	encoder uut (
		.MX(MX), 
		.start(start),  
		.stop(stop), 
		.clk(clk), 
		.CX(CX),
		.state(state),
		.next_state(next_state),
		.out(out),
		.load(load),
		.work(work),
		.counter(counter),
		.counter_out(counter_out)
	);

		integer f_handle;

	initial begin
		// Initialize Inputs
		f_handle = $fopen("text");
		$monitor(f_handle,CX);
		MX = 0;
		start = 0;
		stop = 0;
		clk = 0;

		#8 stop = 1;
		#3 stop = 0;
		
		#3 
		start = 1;	

		#6
		start = 0;

    MX = 8;
#10 MX = 161;
#10 MX = 85 ;
#10 MX = 195;
#10 MX = 97 ;
#10 MX = 135;
#10 MX = 9  ;
#10 MX = 114;
#10 MX = 31 ;
#10 MX = 56 ;
#10 MX = 246;
#10 MX = 107;
#10 MX = 107;
#10 MX = 65 ;
#10 MX = 126;
#10 MX = 227;
#10 MX = 29 ;
#10 MX = 123;
#10 MX = 78 ;
#10 MX = 214;
#10 MX = 123;
#10 MX = 207;
#10 MX = 79 ;
#10 MX = 230;
#10 MX = 254;
#10 MX = 234;
#10 MX = 136;
#10 MX = 175;
#10 MX = 5  ;
#10 MX = 12 ;
#10 MX = 8  ;
#10 MX = 179;
#10 MX = 21 ;
#10 MX = 35 ;
#10 MX = 91 ;
#10 MX = 28 ;
#10 MX = 57 ;
#10 MX = 174;
#10 MX = 129;
#10 MX = 212;
#10 MX = 241;
#10 MX = 87 ;
#10 MX = 164;
#10 MX = 112;
#10 MX = 251;
#10 MX = 36 ;
#10 MX = 151;
#10 MX = 226;
#10 MX = 174;
#10 MX = 210;
#10 MX = 50 ;
#10 MX = 136;
#10 MX = 86 ;
#10 MX = 32 ;
#10 MX = 91 ;
#10 MX = 116;
#10 MX = 157;
#10 MX = 46 ;
#10 MX = 68 ;
#10 MX = 226;
#10 MX = 181;
#10 MX = 211;
#10 MX = 197;
#10 MX = 118;
#10 MX = 146;
#10 MX = 170;
#10 MX = 146;
#10 MX = 121;
#10 MX = 201;
#10 MX = 39 ;
#10 MX = 69 ;
#10 MX = 204;
#10 MX = 179;
#10 MX = 141;
#10 MX = 209;
#10 MX = 36 ;
#10 MX = 222;
#10 MX = 25 ;
#10 MX = 28 ;
#10 MX = 82 ;
#10 MX = 109;
#10 MX = 86 ;
#10 MX = 161;
#10 MX = 162;
#10 MX = 58 ;
#10 MX = 152;
#10 MX = 164;
#10 MX = 78 ;
#10 MX = 6  ;
#10 MX = 44 ;
#10 MX = 181;
#10 MX = 193;
#10 MX = 162;
#10 MX = 98 ;
#10 MX = 151;
#10 MX = 174;
#10 MX = 199;
#10 MX = 233;
#10 MX = 160;
#10 MX = 98 ;
#10 MX = 20 ;
#10 MX = 181;
#10 MX = 145;
#10 MX = 123;
#10 MX = 179;
#10 MX = 72 ;
#10 MX = 45 ;
#10 MX = 254;
#10 MX = 202;
#10 MX = 174;
#10 MX = 160;
#10 MX = 207;
#10 MX = 71 ;
#10 MX = 154;
#10 MX = 117;
#10 MX = 241;
#10 MX = 167;
#10 MX = 154;
#10 MX = 84 ;
#10 MX = 129;
#10 MX = 92 ;
#10 MX = 40 ;
#10 MX = 75 ;
#10 MX = 205;
#10 MX = 106;
#10 MX = 221;
#10 MX = 174;
#10 MX = 33 ;
#10 MX = 112;
#10 MX = 61 ;
#10 MX = 201;
#10 MX = 27 ;
#10 MX = 61 ;
#10 MX = 200;
#10 MX = 4  ;
#10 MX = 45 ;
#10 MX = 167;
#10 MX = 250;
#10 MX = 66 ;
#10 MX = 159;
#10 MX = 182;
#10 MX = 129;
#10 MX = 113;
#10 MX = 169;
#10 MX = 253;
#10 MX = 164;
#10 MX = 15 ;
#10 MX = 247;
#10 MX = 182;
#10 MX = 169;
#10 MX = 137;
#10 MX = 134;
#10 MX = 193;
#10 MX = 146;
#10 MX = 2  ;
#10 MX = 4  ;
#10 MX = 189;
#10 MX = 15 ;
#10 MX = 146;
#10 MX = 8  ;
#10 MX = 156;
#10 MX = 35 ;
#10 MX = 219;
#10 MX = 2  ;
#10 MX = 200;
#10 MX = 196;
#10 MX = 206;
#10 MX = 162;
#10 MX = 42 ;
#10 MX = 121;
#10 MX = 255;
#10 MX = 182;
#10 MX = 188;
#10 MX = 173;
#10 MX = 236;
#10 MX = 242;
#10 MX = 192;
#10 MX = 55 ;
#10 MX = 19 ;
#10 MX = 235;
#10 MX = 18 ;
#10 MX = 189;
#10 MX = 42 ;
#10 MX = 221;
#10 MX = 138;
#10 MX = 199;
#10 MX = 75 ;
#10 MX = 124;
#10 MX = 139;
#10 MX = 115;
#10 MX = 70 ;
#10 MX = 118;
#10 MX = 178;
#10 MX = 191;
#10 MX = 134;
#10 MX = 86 ;
#10 MX = 150;
#10 MX = 170;
#10 MX = 186;
#10 MX = 170;
#10 MX = 23 ;
#10 MX = 216;
#10 MX = 131;
#10 MX = 118;
#10 MX = 15 ;
#10 MX = 126;
#10 MX = 34 ;
#10 MX = 246;
#10 MX = 46 ;
#10 MX = 123;
#10 MX = 16 ;
#10 MX = 194;
#10 MX = 189;
#10 MX = 169;
#10 MX = 109;
#10 MX = 171;
#10 MX = 202;
#10 MX = 246;
#10 MX = 84 ;
#10 MX = 240;
#10 MX = 203;
#10 MX = 58 ;
#10 MX = 11 ;
#10 MX = 244;
#10 MX = 103;
#10 MX = 13 ;
#10 MX = 198;
#10 MX = 81 ;
#10 MX = 164;
#10 MX = 35 ;
#10 MX = 4  ;
#10 MX = 130;
#10 MX = 218;
#10 MX = 136;
#10 MX = 220;
#10 MX = 91 ;
#10 MX = 224;
#10 MX = 2  ;
#10 MX = 113;
#10 MX = 141;
#10 MX = 116;
#10 MX = 47 ;
#10 MX = 4  ;
#10 MX = 145;
#10 MX = 183;
#10 MX = 186;
#10 MX = 177;
#10 MX = 98 ;
#10 MX = 251;

$fclose(f_handle);
	end
	
		always
		  #5 clk = ~clk;
      
endmodule
