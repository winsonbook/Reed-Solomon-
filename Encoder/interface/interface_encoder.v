module interface_encoder(
input clock,
output reg [7:0] out5
); 
reg [7:0] MX0	= 8'd8;
reg [7:0] MX1	= 8'd161;
reg [7:0] MX2	= 8'd85;
reg [7:0] MX3	= 8'd195;
reg [7:0] MX4	= 8'd97;
reg [7:0] MX5	= 8'd135;
reg [7:0] MX6	= 8'd9;
reg [7:0] MX7	= 8'd114;
reg [7:0] MX8	= 8'd31;
reg [7:0] MX9	= 8'd56;
reg [7:0] MX10	= 8'd246;
reg [7:0] MX11	= 8'd107;
reg [7:0] MX12	= 8'd107;
reg [7:0] MX13	= 8'd65;
reg [7:0] MX14	= 8'd126;
reg [7:0] MX15	= 8'd227;
reg [7:0] MX16	= 8'd29;
reg [7:0] MX17	= 8'd123;
reg [7:0] MX18	= 8'd78;
reg [7:0] MX19	= 8'd214;
reg [7:0] MX20	= 8'd123;
reg [7:0] MX21	= 8'd207;
reg [7:0] MX22	= 8'd79;
reg [7:0] MX23	= 8'd230;
reg [7:0] MX24	= 8'd254;
reg [7:0] MX25	= 8'd234;
reg [7:0] MX26	= 8'd136;
reg [7:0] MX27	= 8'd175;
reg [7:0] MX28	= 8'd5;
reg [7:0] MX29	= 8'd12;
reg [7:0] MX30	= 8'd8;
reg [7:0] MX31	= 8'd179;
reg [7:0] MX32	= 8'd21;
reg [7:0] MX33	= 8'd35;
reg [7:0] MX34	= 8'd91;
reg [7:0] MX35	= 8'd28;
reg [7:0] MX36	= 8'd57;
reg [7:0] MX37	= 8'd174;
reg [7:0] MX38	= 8'd129;
reg [7:0] MX39	= 8'd212;
reg [7:0] MX40	= 8'd241;
reg [7:0] MX41	= 8'd87;
reg [7:0] MX42	= 8'd164;
reg [7:0] MX43	= 8'd112;
reg [7:0] MX44	= 8'd251;
reg [7:0] MX45	= 8'd36;
reg [7:0] MX46	= 8'd151;
reg [7:0] MX47	= 8'd226;
reg [7:0] MX48	= 8'd174;
reg [7:0] MX49	= 8'd210;
reg [7:0] MX50	= 8'd50;
reg [7:0] MX51	= 8'd136;
reg [7:0] MX52	= 8'd86;
reg [7:0] MX53	= 8'd32;
reg [7:0] MX54	= 8'd91;
reg [7:0] MX55	= 8'd116;
reg [7:0] MX56	= 8'd157;
reg [7:0] MX57	= 8'd46;
reg [7:0] MX58	= 8'd68;
reg [7:0] MX59	= 8'd226;
reg [7:0] MX60	= 8'd181;
reg [7:0] MX61	= 8'd211;
reg [7:0] MX62	= 8'd197;
reg [7:0] MX63	= 8'd118;
reg [7:0] MX64	= 8'd146;
reg [7:0] MX65	= 8'd170;
reg [7:0] MX66	= 8'd146;
reg [7:0] MX67	= 8'd121;
reg [7:0] MX68	= 8'd201;
reg [7:0] MX69	= 8'd39;
reg [7:0] MX70	= 8'd69;
reg [7:0] MX71	= 8'd204;
reg [7:0] MX72	= 8'd179;
reg [7:0] MX73	= 8'd141;
reg [7:0] MX74	= 8'd209;
reg [7:0] MX75	= 8'd36;
reg [7:0] MX76	= 8'd222;
reg [7:0] MX77	= 8'd25;
reg [7:0] MX78	= 8'd28;
reg [7:0] MX79	= 8'd82;
reg [7:0] MX80	= 8'd109;
reg [7:0] MX81	= 8'd86;
reg [7:0] MX82	= 8'd161;
reg [7:0] MX83	= 8'd162;
reg [7:0] MX84	= 8'd58;
reg [7:0] MX85	= 8'd152;
reg [7:0] MX86	= 8'd164;
reg [7:0] MX87	= 8'd78;
reg [7:0] MX88	= 8'd6;
reg [7:0] MX89	= 8'd44;
reg [7:0] MX90	= 8'd181;
reg [7:0] MX91	= 8'd193;
reg [7:0] MX92	= 8'd162;
reg [7:0] MX93	= 8'd98;
reg [7:0] MX94	= 8'd151;
reg [7:0] MX95	= 8'd174;
reg [7:0] MX96	= 8'd199;
reg [7:0] MX97	= 8'd233;
reg [7:0] MX98	= 8'd160;
reg [7:0] MX99	= 8'd98;
reg [7:0] MX100	= 8'd20;
reg [7:0] MX101	= 8'd181;
reg [7:0] MX102	= 8'd145;
reg [7:0] MX103	= 8'd123;
reg [7:0] MX104	= 8'd179;
reg [7:0] MX105	= 8'd72;
reg [7:0] MX106	= 8'd45;
reg [7:0] MX107	= 8'd254;
reg [7:0] MX108	= 8'd202;
reg [7:0] MX109	= 8'd174;
reg [7:0] MX110	= 8'd160;
reg [7:0] MX111	= 8'd207;
reg [7:0] MX112	= 8'd71;
reg [7:0] MX113	= 8'd154;
reg [7:0] MX114	= 8'd117;
reg [7:0] MX115	= 8'd241;
reg [7:0] MX116	= 8'd167;
reg [7:0] MX117	= 8'd154;
reg [7:0] MX118	= 8'd84;
reg [7:0] MX119	= 8'd129;
reg [7:0] MX120	= 8'd92;
reg [7:0] MX121	= 8'd40;
reg [7:0] MX122	= 8'd75;
reg [7:0] MX123	= 8'd205;
reg [7:0] MX124	= 8'd106;
reg [7:0] MX125	= 8'd221;
reg [7:0] MX126	= 8'd174;
reg [7:0] MX127	= 8'd33;
reg [7:0] MX128	= 8'd112;
reg [7:0] MX129	= 8'd61;
reg [7:0] MX130	= 8'd201;
reg [7:0] MX131	= 8'd27;
reg [7:0] MX132	= 8'd61;
reg [7:0] MX133	= 8'd200;
reg [7:0] MX134	= 8'd4;
reg [7:0] MX135	= 8'd45;
reg [7:0] MX136	= 8'd167;
reg [7:0] MX137	= 8'd250;
reg [7:0] MX138	= 8'd66;
reg [7:0] MX139	= 8'd159;
reg [7:0] MX140	= 8'd182;
reg [7:0] MX141	= 8'd129;
reg [7:0] MX142	= 8'd113;
reg [7:0] MX143	= 8'd169;
reg [7:0] MX144	= 8'd253;
reg [7:0] MX145	= 8'd164;
reg [7:0] MX146	= 8'd15;
reg [7:0] MX147	= 8'd247;
reg [7:0] MX148	= 8'd182;
reg [7:0] MX149	= 8'd169;
reg [7:0] MX150	= 8'd137;
reg [7:0] MX151	= 8'd134;
reg [7:0] MX152	= 8'd193;
reg [7:0] MX153	= 8'd146;
reg [7:0] MX154	= 8'd2;
reg [7:0] MX155	= 8'd4;
reg [7:0] MX156	= 8'd189;
reg [7:0] MX157	= 8'd15;
reg [7:0] MX158	= 8'd146;
reg [7:0] MX159	= 8'd8;
reg [7:0] MX160	= 8'd156;
reg [7:0] MX161	= 8'd35;
reg [7:0] MX162	= 8'd219;
reg [7:0] MX163	= 8'd2;
reg [7:0] MX164	= 8'd200;
reg [7:0] MX165	= 8'd196;
reg [7:0] MX166	= 8'd206;
reg [7:0] MX167	= 8'd162;
reg [7:0] MX168	= 8'd42;
reg [7:0] MX169	= 8'd121;
reg [7:0] MX170	= 8'd255;
reg [7:0] MX171	= 8'd182;
reg [7:0] MX172	= 8'd188;
reg [7:0] MX173	= 8'd173;
reg [7:0] MX174	= 8'd236;
reg [7:0] MX175	= 8'd242;
reg [7:0] MX176	= 8'd192;
reg [7:0] MX177	= 8'd55;
reg [7:0] MX178	= 8'd19;
reg [7:0] MX179	= 8'd235;
reg [7:0] MX180	= 8'd18;
reg [7:0] MX181	= 8'd189;
reg [7:0] MX182	= 8'd42;
reg [7:0] MX183	= 8'd221;
reg [7:0] MX184	= 8'd138;
reg [7:0] MX185	= 8'd199;
reg [7:0] MX186	= 8'd75;
reg [7:0] MX187	= 8'd124;
reg [7:0] MX188	= 8'd139;
reg [7:0] MX189	= 8'd115;
reg [7:0] MX190	= 8'd70;
reg [7:0] MX191	= 8'd118;
reg [7:0] MX192	= 8'd178;
reg [7:0] MX193	= 8'd191;
reg [7:0] MX194	= 8'd134;
reg [7:0] MX195	= 8'd86;
reg [7:0] MX196	= 8'd150;
reg [7:0] MX197	= 8'd170;
reg [7:0] MX198	= 8'd186;
reg [7:0] MX199	= 8'd170;
reg [7:0] MX200	= 8'd23;
reg [7:0] MX201	= 8'd216;
reg [7:0] MX202	= 8'd131;
reg [7:0] MX203	= 8'd118;
reg [7:0] MX204	= 8'd15;
reg [7:0] MX205	= 8'd126;
reg [7:0] MX206	= 8'd34;
reg [7:0] MX207	= 8'd246;
reg [7:0] MX208	= 8'd46;
reg [7:0] MX209	= 8'd123;
reg [7:0] MX210	= 8'd16;
reg [7:0] MX211	= 8'd194;
reg [7:0] MX212	= 8'd189;
reg [7:0] MX213	= 8'd169;
reg [7:0] MX214	= 8'd109;
reg [7:0] MX215	= 8'd171;
reg [7:0] MX216	= 8'd202;
reg [7:0] MX217	= 8'd246;
reg [7:0] MX218	= 8'd84;
reg [7:0] MX219	= 8'd240;
reg [7:0] MX220	= 8'd203;
reg [7:0] MX221	= 8'd58;
reg [7:0] MX222	= 8'd11;
reg [7:0] MX223	= 8'd244;
reg [7:0] MX224	= 8'd103;
reg [7:0] MX225	= 8'd13;
reg [7:0] MX226	= 8'd198;
reg [7:0] MX227	= 8'd81;
reg [7:0] MX228	= 8'd164;
reg [7:0] MX229	= 8'd35;
reg [7:0] MX230	= 8'd4;
reg [7:0] MX231	= 8'd130;
reg [7:0] MX232	= 8'd218;
reg [7:0] MX233	= 8'd136;
reg [7:0] MX234	= 8'd220;
reg [7:0] MX235	= 8'd91;
reg [7:0] MX236	= 8'd224;
reg [7:0] MX237	= 8'd2;
reg [7:0] MX238	= 8'd113;
reg [7:0] MX239	= 8'd141;
reg [7:0] MX240	= 8'd116;
reg [7:0] MX241	= 8'd47;
reg [7:0] MX242	= 8'd4;
reg [7:0] MX243	= 8'd145;
reg [7:0] MX244	= 8'd183;
reg [7:0] MX245	= 8'd186;
reg [7:0] MX246	= 8'd177;
reg [7:0] MX247	= 8'd98;
reg [7:0] MX248	= 8'd251;

reg [7:0] data = 8'b0000_0000;
reg [7:0] data_buff = 8'b0000_0000;
reg [2:0] start = 3'b100;

wire [7:0] CX;
wire ready;
wire stop = 1'b0;

always@(negedge clock)
    start <= {1'b0,start[2:1]};

always@(posedge clock)
begin
    data <= data_buff;
    data_buff <= MX0;
    MX0	<= MX1;
	MX1	<= MX2;
	MX2	<= MX3;
	MX3	<= MX4;
	MX4	<= MX5;
	MX5	<= MX6;
	MX6	<= MX7;
	MX7	<= MX8;
	MX8	<= MX9;
	MX9	<= MX10;
	MX10	<= MX11;
	MX11	<= MX12;
	MX12	<= MX13;
	MX13	<= MX14;
	MX14	<= MX15;
	MX15	<= MX16;
	MX16	<= MX17;
	MX17	<= MX18;
	MX18	<= MX19;
	MX19	<= MX20;
	MX20	<= MX21;
	MX21	<= MX22;
	MX22	<= MX23;
	MX23	<= MX24;
	MX24	<= MX25;
	MX25	<= MX26;
	MX26	<= MX27;
	MX27	<= MX28;
	MX28	<= MX29;
	MX29	<= MX30;
	MX30	<= MX31;
	MX31	<= MX32;
	MX32	<= MX33;
	MX33	<= MX34;
	MX34	<= MX35;
	MX35	<= MX36;
	MX36	<= MX37;
	MX37	<= MX38;
	MX38	<= MX39;
	MX39	<= MX40;
	MX40	<= MX41;
	MX41	<= MX42;
	MX42	<= MX43;
	MX43	<= MX44;
	MX44	<= MX45;
	MX45	<= MX46;
	MX46	<= MX47;
	MX47	<= MX48;
	MX48	<= MX49;
	MX49	<= MX50;
	MX50	<= MX51;
	MX51	<= MX52;
	MX52	<= MX53;
	MX53	<= MX54;
	MX54	<= MX55;
	MX55	<= MX56;
	MX56	<= MX57;
	MX57	<= MX58;
	MX58	<= MX59;
	MX59	<= MX60;
	MX60	<= MX61;
	MX61	<= MX62;
	MX62	<= MX63;
	MX63	<= MX64;
	MX64	<= MX65;
	MX65	<= MX66;
	MX66	<= MX67;
	MX67	<= MX68;
	MX68	<= MX69;
	MX69	<= MX70;
	MX70	<= MX71;
	MX71	<= MX72;
	MX72	<= MX73;
	MX73	<= MX74;
	MX74	<= MX75;
	MX75	<= MX76;
	MX76	<= MX77;
	MX77	<= MX78;
	MX78	<= MX79;
	MX79	<= MX80;
	MX80	<= MX81;
	MX81	<= MX82;
	MX82	<= MX83;
	MX83	<= MX84;
	MX84	<= MX85;
	MX85	<= MX86;
	MX86	<= MX87;
	MX87	<= MX88;
	MX88	<= MX89;
	MX89	<= MX90;
	MX90	<= MX91;
	MX91	<= MX92;
	MX92	<= MX93;
	MX93	<= MX94;
	MX94	<= MX95;
	MX95	<= MX96;
	MX96	<= MX97;
	MX97	<= MX98;
	MX98	<= MX99;
	MX99	<= MX100;
	MX100	<= MX101;
	MX101	<= MX102;
	MX102	<= MX103;
	MX103	<= MX104;
	MX104	<= MX105;
	MX105	<= MX106;
	MX106	<= MX107;
	MX107	<= MX108;
	MX108	<= MX109;
	MX109	<= MX110;
	MX110	<= MX111;
	MX111	<= MX112;
	MX112	<= MX113;
	MX113	<= MX114;
	MX114	<= MX115;
	MX115	<= MX116;
	MX116	<= MX117;
	MX117	<= MX118;
	MX118	<= MX119;
	MX119	<= MX120;
	MX120	<= MX121;
	MX121	<= MX122;
	MX122	<= MX123;
	MX123	<= MX124;
	MX124	<= MX125;
	MX125	<= MX126;
	MX126	<= MX127;
	MX127	<= MX128;
	MX128	<= MX129;
	MX129	<= MX130;
	MX130	<= MX131;
	MX131	<= MX132;
	MX132	<= MX133;
	MX133	<= MX134;
	MX134	<= MX135;
	MX135	<= MX136;
	MX136	<= MX137;
	MX137	<= MX138;
	MX138	<= MX139;
	MX139	<= MX140;
	MX140	<= MX141;
	MX141	<= MX142;
	MX142	<= MX143;
	MX143	<= MX144;
	MX144	<= MX145;
	MX145	<= MX146;
	MX146	<= MX147;
	MX147	<= MX148;
	MX148	<= MX149;
	MX149	<= MX150;
	MX150	<= MX151;
	MX151	<= MX152;
	MX152	<= MX153;
	MX153	<= MX154;
	MX154	<= MX155;
	MX155	<= MX156;
	MX156	<= MX157;
	MX157	<= MX158;
	MX158	<= MX159;
	MX159	<= MX160;
	MX160	<= MX161;
	MX161	<= MX162;
	MX162	<= MX163;
	MX163	<= MX164;
	MX164	<= MX165;
	MX165	<= MX166;
	MX166	<= MX167;
	MX167	<= MX168;
	MX168	<= MX169;
	MX169	<= MX170;
	MX170	<= MX171;
	MX171	<= MX172;
	MX172	<= MX173;
	MX173	<= MX174;
	MX174	<= MX175;
	MX175	<= MX176;
	MX176	<= MX177;
	MX177	<= MX178;
	MX178	<= MX179;
	MX179	<= MX180;
	MX180	<= MX181;
	MX181	<= MX182;
	MX182	<= MX183;
	MX183	<= MX184;
	MX184	<= MX185;
	MX185	<= MX186;
	MX186	<= MX187;
	MX187	<= MX188;
	MX188	<= MX189;
	MX189	<= MX190;
	MX190	<= MX191;
	MX191	<= MX192;
	MX192	<= MX193;
	MX193	<= MX194;
	MX194	<= MX195;
	MX195	<= MX196;
	MX196	<= MX197;
	MX197	<= MX198;
	MX198	<= MX199;
	MX199	<= MX200;
	MX200	<= MX201;
	MX201	<= MX202;
	MX202	<= MX203;
	MX203	<= MX204;
	MX204	<= MX205;
	MX205	<= MX206;
	MX206	<= MX207;
	MX207	<= MX208;
	MX208	<= MX209;
	MX209	<= MX210;
	MX210	<= MX211;
	MX211	<= MX212;
	MX212	<= MX213;
	MX213	<= MX214;
	MX214	<= MX215;
	MX215	<= MX216;
	MX216	<= MX217;
	MX217	<= MX218;
	MX218	<= MX219;
	MX219	<= MX220;
	MX220	<= MX221;
	MX221	<= MX222;
	MX222	<= MX223;
	MX223	<= MX224;
	MX224	<= MX225;
	MX225	<= MX226;
	MX226	<= MX227;
	MX227	<= MX228;
	MX228	<= MX229;
	MX229	<= MX230;
	MX230	<= MX231;
	MX231	<= MX232;
	MX232	<= MX233;
	MX233	<= MX234;
	MX234	<= MX235;
	MX235	<= MX236;
	MX236	<= MX237;
	MX237	<= MX238;
	MX238	<= MX239;
	MX239	<= MX240;
	MX240	<= MX241;
	MX241	<= MX242;
	MX242	<= MX243;
	MX243	<= MX244;
	MX244	<= MX245;
	MX245	<= MX246;
	MX246	<= MX247;
	MX247	<= MX248;
	MX248   <= 8'b0000_0000;    
end

reg [7:0] out0 = 8'b0000_0000;
reg [7:0] out1 = 8'b0000_0000;
reg [7:0] out2 = 8'b0000_0000;
reg [7:0] out3 = 8'b0000_0000;
reg [7:0] out4 = 8'b0000_0000;
//reg [7:0] out5 = 8'b0000_0000;
always@(posedge clock)
begin
    if(ready)
    begin
        out0 <= CX;
        out1 <= out0;
        out2 <= out1;
        out3 <= out2;
        out4 <= out3;
        out5 <= out4;
    end
end

encoder e2 (.MX(data),.start(start[0]),.stop(stop),.clock(clock),.CX(CX),.ready(ready));
endmodule

module encoder(
    input [7:0] MX,
    input start,
    input stop,
    input clock,
    output reg [7:0] CX,
    output ready
    );
parameter S_idle = 2'b00 , 
				S_in = 2'b01,
				S_out = 2'b10;
				
reg [1:0] state = S_idle;     
reg [1:0] next_state = S_idle;	

reg [7:0] X0,X1,X2,X3,X4,X5;
wire [7:0] X5MX,X0_h,X1_h,X2_h,X3_h,X4_h,X5_h;

always@(posedge clock)
	begin
		if(stop) state = S_idle;
		else     state = next_state;
	end

reg load = 1'b0;
reg work = 1'b0;
reg out = 1'b0;
reg [7:0] counter = 8'b00000000;    
reg [2:0] counter_out = 3'b000; 

always@(posedge clock)
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
					if(counter>=248) 
						next_state = S_out;
				end
			S_out:
				begin
					out = 1;
					if(counter_out>4)
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

assign ready = out;

always@(load,work,out)
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
		else if(work)
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
		 else if(out)
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
