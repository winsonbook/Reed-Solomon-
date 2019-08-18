
module multiply(
    input [7:0] A,
    input [7:0] B,
    output[7:0] X
    );
wire [14:0] z;
assign z[0] = (A[0]&B[0]);
assign z[1] = (A[1]&B[0])^(A[0]&B[1]);
assign z[2] = (A[2]&B[0])^(A[1]&B[1])^(A[0]&B[2]);
assign z[3] = (A[3]&B[0])^(A[2]&B[1])^(A[1]&B[2])^(A[0]&B[3]);
assign z[4] = (A[4]&B[0])^(A[3]&B[1])^(A[2]&B[2])^(A[1]&B[3])^(A[0]&B[4]);
assign z[5] = (A[5]&B[0])^(A[4]&B[1])^(A[3]&B[2])^(A[2]&B[3])^(A[1]&B[4])^(A[0]&B[5]);
assign z[6] = (A[6]&B[0])^(A[5]&B[1])^(A[4]&B[2])^(A[3]&B[3])^(A[2]&B[4])^(A[1]&B[5])^(A[0]&B[6]);
assign z[7] = (A[7]&B[0])^(A[6]&B[1])^(A[5]&B[2])^(A[4]&B[3])^(A[3]&B[4])^(A[2]&B[5])^(A[1]&B[6])^(A[0]&B[7]);
assign z[8] = (A[7]&B[1])^(A[6]&B[2])^(A[5]&B[3])^(A[4]&B[4])^(A[3]&B[5])^(A[2]&B[6])^(A[1]&B[7]);
assign z[9] = (A[7]&B[2])^(A[6]&B[3])^(A[5]&B[4])^(A[4]&B[5])^(A[3]&B[6])^(A[2]&B[7]);
assign z[10]= (A[7]&B[3])^(A[6]&B[4])^(A[5]&B[5])^(A[4]&B[6])^(A[3]&B[7]);
assign z[11]= (A[7]&B[4])^(A[6]&B[5])^(A[5]&B[6])^(A[4]&B[7]);
assign z[12]= (A[7]&B[5])^(A[6]&B[6])^(A[5]&B[7]);
assign z[13]= (A[7]&B[6])^(A[6]&B[7]);
assign z[14]= (A[7]&B[7]);

wire [8:0] poly = 9'b100011101;

wire [8:0] D1 = {z[14],z[13],z[12],z[11],z[10],z[9],z[8],z[7],z[6]};
wire [8:0] and1 = {D1[8]&poly[8],D1[8]&poly[7],D1[8]&poly[6],D1[8]&poly[5],D1[8]&poly[4],D1[8]&poly[3],D1[8]&poly[2],D1[8]&poly[1],D1[8]&poly[0]};
wire [8:0] MUX1 = D1^and1;

wire [8:0] D2 = {MUX1[7],MUX1[6],MUX1[5],MUX1[4],MUX1[3],MUX1[2],MUX1[1],MUX1[0],z[5]};
wire [8:0] and2 = {D2[8]&poly[8],D2[8]&poly[7],D2[8]&poly[6],D2[8]&poly[5],D2[8]&poly[4],D2[8]&poly[3],D2[8]&poly[2],D2[8]&poly[1],D2[8]&poly[0]};
wire [8:0] MUX2 = D2^and2;

wire [8:0] D3 = {MUX2[7],MUX2[6],MUX2[5],MUX2[4],MUX2[3],MUX2[2],MUX2[1],MUX2[0],z[4]};
wire [8:0] and3 = {D3[8]&poly[8],D3[8]&poly[7],D3[8]&poly[6],D3[8]&poly[5],D3[8]&poly[4],D3[8]&poly[3],D3[8]&poly[2],D3[8]&poly[1],D3[8]&poly[0]};
wire [8:0] MUX3 = D3^and3;

wire [8:0] D4 = {MUX3[7],MUX3[6],MUX3[5],MUX3[4],MUX3[3],MUX3[2],MUX3[1],MUX3[0],z[3]};
wire [8:0] and4 = {D4[8]&poly[8],D4[8]&poly[7],D4[8]&poly[6],D4[8]&poly[5],D4[8]&poly[4],D4[8]&poly[3],D4[8]&poly[2],D4[8]&poly[1],D4[8]&poly[0]};
wire [8:0] MUX4 = D4^and4;

wire [8:0] D5 = {MUX4[7],MUX4[6],MUX4[5],MUX4[4],MUX4[3],MUX4[2],MUX4[1],MUX4[0],z[2]};
wire [8:0] and5 = {D5[8]&poly[8],D5[8]&poly[7],D5[8]&poly[6],D5[8]&poly[5],D5[8]&poly[4],D5[8]&poly[3],D5[8]&poly[2],D5[8]&poly[1],D5[8]&poly[0]};
wire [8:0] MUX5 = D5^and5;

wire [8:0] D6 = {MUX5[7],MUX5[6],MUX5[5],MUX5[4],MUX5[3],MUX5[2],MUX5[1],MUX5[0],z[1]};
wire [8:0] and6 = {D6[8]&poly[8],D6[8]&poly[7],D6[8]&poly[6],D6[8]&poly[5],D6[8]&poly[4],D6[8]&poly[3],D6[8]&poly[2],D6[8]&poly[1],D6[8]&poly[0]};
wire [8:0] MUX6 = D6^and6;

wire [8:0] D7 = {MUX6[7],MUX6[6],MUX6[5],MUX6[4],MUX6[3],MUX6[2],MUX6[1],MUX6[0],z[0]};
wire [8:0] and7 = {D7[8]&poly[8],D7[8]&poly[7],D7[8]&poly[6],D7[8]&poly[5],D7[8]&poly[4],D7[8]&poly[3],D7[8]&poly[2],D7[8]&poly[1],D7[8]&poly[0]};
wire [8:0] MUX7 = D7^and7;

assign X = MUX7[7:0];
endmodule
