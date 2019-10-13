`timescale 1ns / 1ps

module interface_berlekamp(
input clock,
output [7:0] s3
    );
    wire [7:0] w1,w2,w3,w4,w5,w6;
    assign w1 = 8'd215;
    assign w2 = 8'd2;
    assign w3 = 8'd148;
    assign w4 = 8'd39;
    assign w5 = 8'd1;
    assign w6 = 8'd54;

    reg [2:0] sig = 3'b100;
    
	always@(negedge clock)
        sig <= {1'b0,sig[2:1]};
    
    wire [7:0] s0,s1,s2;
    berlekamp_messey b1 (.S1(w1),.S2(w2),.S3(w3),.S4(w4),.S5(w5),.S6(w6),.clock(clock),.signal(sig[0]),.w0(s0),.w1(s1),.w2(s2),.w3(s3));    

endmodule

module berlekamp_messey(
    input signal,
    input clock,
    input [7:0] S1,
    input [7:0] S2,
    input [7:0] S3,
    input [7:0] S4,
    input [7:0] S5,
    input [7:0] S6,
    output reg [7:0] w1,
    output reg [7:0] w2,
    output reg [7:0] w3,
    output reg [7:0] w0,
    output reg ready
    );
  parameter [2:0] S_idle = 3'b000,
                  S_0    = 3'b001,
                  S_1    = 3'b010,
                  S_2    = 3'b011,
                  S_3    = 3'b100,
                  S_4    = 3'b101,
                  S_5    = 3'b110,
                  S_6    = 3'b111;
  reg [2:0] state = 3'b000;
  reg [2:0] buffer_state = 3'b000;//For debugging
  reg [2:0] next_state = 3'b000;
  
  
  always@(posedge(clock))
  begin 
      buffer_state <= next_state;
      state <= buffer_state;    
//        state = next_state;
  end 
  
  reg load,T_0,T_1,T_2,T_3,T_4,T_5,T_6;

  always@(state,signal)
  begin 
  load = 1'b0;
  T_0 = 1'b0;
  T_1 = 1'b0;
  T_2 = 1'b0;
  T_3 = 1'b0;
  T_4 = 1'b0;
  T_5 = 1'b0;
  T_6 = 1'b0;
  
    case(state)
    S_idle:
        begin
            load = 1'b1;
            if(signal)
               next_state = S_0; 
        end
    S_0:
        begin 
            T_0 = 1'b1;
            next_state = S_1;
        end
    S_1:
        begin 
            T_1 = 1'b1;
            next_state = S_2;
        end
     S_2:
        begin 
            T_2 = 1'b1;
            next_state = S_3;
        end   
     S_3:
        begin 
            T_3 = 1'b1;
            next_state = S_4;
        end
     S_4:
        begin 
            T_4 = 1'b1;
            next_state = S_5;
        end
     S_5:
        begin 
            T_5 = 1'b1;
            next_state = S_6;
        end
     S_6:
        begin 
            T_6 = 1'b1;
            next_state = S_idle;
        end
     default: next_state = S_idle;
    endcase
  end 
  
    reg [7:0] d[0:5];
    reg [8*4-1:0] sigma[1:6];
    reg [2:0] h[1:6];
    wire [7:0] i_d[0:4];
    
    Inverse_8_bit I1 (.y(i_d[0]),.x(d[0]));
    Inverse_8_bit I2 (.y(i_d[1]),.x(d[1]));
    Inverse_8_bit I3 (.y(i_d[2]),.x(d[2]));
    Inverse_8_bit I4 (.y(i_d[3]),.x(d[3]));
    Inverse_8_bit I5 (.y(i_d[4]),.x(d[4]));  
    wire d0_zero,d1_zero,d2_zero,d3_zero,d4_zero,d5_zero;
    assign d0_zero = ((~d[0][0])&&(~d[0][1])&&(~d[0][2])&&(~d[0][3])&&(~d[0][4])&&(~d[0][5])&&(~d[0][6])&&(~d[0][7]));
    assign d1_zero = ((~d[1][0])&&(~d[1][1])&&(~d[1][2])&&(~d[1][3])&&(~d[1][4])&&(~d[1][5])&&(~d[1][6])&&(~d[1][7]));
    assign d2_zero = ((~d[2][0])&&(~d[2][1])&&(~d[2][2])&&(~d[2][3])&&(~d[2][4])&&(~d[2][5])&&(~d[2][6])&&(~d[2][7]));
    assign d3_zero = ((~d[3][0])&&(~d[3][1])&&(~d[3][2])&&(~d[3][3])&&(~d[3][4])&&(~d[3][5])&&(~d[3][6])&&(~d[3][7]));
    assign d4_zero = ((~d[4][0])&&(~d[4][1])&&(~d[4][2])&&(~d[4][3])&&(~d[4][4])&&(~d[4][5])&&(~d[4][6])&&(~d[4][7]));
    assign d5_zero = ((~d[5][0])&&(~d[5][1])&&(~d[5][2])&&(~d[5][3])&&(~d[5][4])&&(~d[5][5])&&(~d[5][6])&&(~d[5][7]));
  
    wire [2:0] Muh1,Muh2,Muh3,Muh4;                 //Mu-h calculation 
    assign Muh1 = d1_zero?3'b000:(3'd1-h[1]);       
    assign Muh2 = d2_zero?3'b000:(3'd2-h[2]);
    assign Muh3 = d3_zero?3'b000:(3'd3-h[3]);
    assign Muh4 = d4_zero?3'b000:(3'd4-h[4]);    
    wire Muh1_zero,Muh2_zero,Muh3_zero,Muh4_zero;
    assign Muh1_zero = ((~Muh1[0])&&(~Muh1[1])&&(~Muh1[2]));
    assign Muh2_zero = ((~Muh2[0])&&(~Muh2[1])&&(~Muh2[2]));
    assign Muh3_zero = ((~Muh3[0])&&(~Muh3[1])&&(~Muh3[2]));
    assign Muh4_zero = ((~Muh4[0])&&(~Muh4[1])&&(~Muh4[2]));
    
    wire [2:0] temp1,temp2,largest;
    assign temp1 = (Muh1>Muh2)?Muh1:Muh2;
    assign temp2 = (temp1>Muh3)?temp1:Muh3;
    assign largest = (temp2>Muh4)?temp2:Muh4;
    wire M1l,M2l,M3l,M4l;               //Largest number for Mu = 5 case
    assign M1l = ((Muh1[0]~^largest[0])&&(Muh1[1]~^largest[1])&&(Muh1[2]~^largest[2]))?1:0;  //Assigning 1 to  largest Muh and 0 to rem.
    assign M2l = ((Muh2[0]~^largest[0])&&(Muh2[1]~^largest[1])&&(Muh2[2]~^largest[2]))?1:0;
    assign M3l = ((Muh3[0]~^largest[0])&&(Muh3[1]~^largest[1])&&(Muh3[2]~^largest[2]))?1:0;
    assign M4l = ((Muh4[0]~^largest[0])&&(Muh4[1]~^largest[1])&&(Muh4[2]~^largest[2]))?1:0;
    wire M1l2,M2l2,M3l2;           //Largest number for Mu = 4 case
    assign M1l2 = ((Muh1[0]~^temp2[0])&&(Muh1[1]~^temp2[1])&&(Muh1[2]~^temp2[2]))?1:0;   //Assigning 1 to  largest Muh and 0 to rem.
    assign M2l2 = ((Muh2[0]~^temp2[0])&&(Muh2[1]~^temp2[1])&&(Muh2[2]~^temp2[2]))?1:0;
    assign M3l2 = ((Muh3[0]~^temp2[0])&&(Muh3[1]~^temp2[1])&&(Muh3[2]~^temp2[2]))?1:0;    
    wire M1l3,M2l3;           //Largest number for Mu = 3 case
    assign M1l3 = ((Muh1[0]~^temp1[0])&&(Muh1[1]~^temp1[1])&&(Muh1[2]~^temp1[2]))?1:0;   //Assigning 1 to  largest Muh and 0 to rem.
    assign M2l3 = ((Muh2[0]~^temp1[0])&&(Muh2[1]~^temp1[1])&&(Muh2[2]~^temp1[2]))?1:0;
  
  
    wire [7:0] sigma_11_S1;         //For Mu = 0 case
    multiply M1 (.X(sigma_11_S1),.A(S1),.B(sigma[1][15:8]));
  
    wire [7:0] d1i_d0;                              //For Mu = 1 case
    multiply M2 (.X(d1i_d0),.A(d[1]),.B(i_d[0]));
    wire [7:0] T1_d1i_d0s4,T1_d1i_d0s3,T1_d1i_d0s2;
    multiply M3 (.X(T1_d1i_d0s4),.A(d1i_d0),.B(8'b00000000));
    multiply M4 (.X(T1_d1i_d0s3),.A(d1i_d0),.B(8'b00000000));
    multiply M5 (.X(T1_d1i_d0s2),.A(d1i_d0),.B(8'b00000001));
    wire [4*8-1:0] T1_temp;
    assign T1_temp = {T1_d1i_d0s4,T1_d1i_d0s3,T1_d1i_d0s2,8'b00000000};
    wire [7:0] T1_s21S2,T1_s22S1;
    multiply M6 (.X(T1_s21S2),.A(sigma[2][15:8]),.B(S2));
    multiply M7 (.X(T1_s22S1),.A(sigma[2][23:16]),.B(S1));
    wire [7:0] T1_h1;
    assign T1_h1 = (S3^T1_s21S2);
    
    wire [7:0] d2i_d0,d2i_d1;                       //For Muh = 2 case
    multiply M8 (.X(d2i_d0),.A(d[2]),.B(i_d[0]));
    multiply M9 (.X(d2i_d1),.A(d[2]),.B(i_d[1]));
    wire [7:0] d2i_d1sigma12,d2i_d1sigma11,d2i_d1sigma10;
    multiply M11 (.X(d2i_d1sigma12),.A(d2i_d1),.B(sigma[1][23:16]));
    multiply M12 (.X(d2i_d1sigma11),.A(d2i_d1),.B(sigma[1][15:8]));
    multiply M13 (.X(d2i_d1sigma10),.A(d2i_d1),.B(sigma[1][7:0]));
    wire [7:0] T_2sigma3,T_2sigma2,T_2sigma1;
    assign T_2sigma3 = (sigma[2][31:24])^(d2i_d1sigma12);    
    assign T_2sigma2 = (sigma[2][23:16])^(d2i_d1sigma11);    
    assign T_2sigma1 = (sigma[2][15:8])^(d2i_d1sigma10);
    wire [7:0] sigma31S3,sigma32S2,sigma33S1;
    multiply M14 (.X(sigma31S3),.A(sigma[3][15:8]),.B(S3));
    multiply M15 (.X(sigma32S2),.A(sigma[3][23:16]),.B(S2));
    multiply M16 (.X(sigma33S1),.A(sigma[3][31:24]),.B(S1));
    wire [7:0] T2_h1;
    assign T2_h1 = (S4^sigma31S3);
  
    wire [7:0] d3i_d0,d3i_d1,d3i_d2;                       //For Muh = 3 case
    multiply M17 (.X(d3i_d0),.A(d[3]),.B(i_d[0]));
    multiply M18 (.X(d3i_d1),.A(d[3]),.B(i_d[1]));
    multiply M19 (.X(d3i_d2),.A(d[3]),.B(i_d[2]));
    wire [7:0] d3i_d1sigma11,d3i_d1sigma10,d3i_d2sigma22,d3i_d2sigma21,d3i_d2sigma20;
    multiply M21 (.X(d3i_d1sigma11),.A(d3i_d1),.B(sigma[1][15:8]));
    multiply M22 (.X(d3i_d1sigma10),.A(d3i_d1),.B(sigma[1][7:0]));
    multiply M23 (.X(d3i_d2sigma22),.A(d3i_d2),.B(sigma[2][23:16]));
    multiply M24 (.X(d3i_d2sigma21),.A(d3i_d2),.B(sigma[2][15:8]));
    multiply M25 (.X(d3i_d2sigma20),.A(d3i_d2),.B(sigma[2][7:0]));
    wire [7:0] sigma41S4,sigma42S3,sigma43S2;
    multiply M26 (.X(sigma41S4),.A(sigma[4][15:8]),.B(S4));
    multiply M27 (.X(sigma42S3),.A(sigma[4][23:16]),.B(S3));
    multiply M28 (.X(sigma43S2),.A(sigma[4][31:24]),.B(S2));
    
    wire [7:0] d4i_d1,d4i_d2,d4i_d3;                       //For Muh = 4 case
    multiply M29 (.X(d4i_d1),.A(d[4]),.B(i_d[1]));
    multiply M30 (.X(d4i_d2),.A(d[4]),.B(i_d[2]));
    multiply M31 (.X(d4i_d3),.A(d[4]),.B(i_d[3]));
    wire [7:0] d4i_d1sigma10,d4i_d2sigma21,d4i_d2sigma20,d4i_d3sigma32,d4i_d3sigma31,d4i_d3sigma30;
    multiply M32 (.X(d4i_d1sigma10),.A(d4i_d1),.B(sigma[1][7:0]));
    multiply M33 (.X(d4i_d2sigma21),.A(d4i_d2),.B(sigma[2][15:8]));
    multiply M34 (.X(d4i_d2sigma20),.A(d4i_d2),.B(sigma[2][7:0]));
    multiply M35 (.X(d4i_d3sigma32),.A(d4i_d3),.B(sigma[3][23:16]));
    multiply M36 (.X(d4i_d3sigma31),.A(d4i_d3),.B(sigma[3][15:8]));
    multiply M37 (.X(d4i_d3sigma30),.A(d4i_d3),.B(sigma[3][7:0]));
    wire [7:0] sigma51S5,sigma52S4,sigma53S3;
    multiply M38 (.X(sigma51S5),.A(sigma[5][15:8]),.B(S5));
    multiply M39 (.X(sigma52S4),.A(sigma[5][23:16]),.B(S4));
    multiply M40 (.X(sigma53S3),.A(sigma[5][31:24]),.B(S3));
    
    wire [7:0] d5i_d2,d5i_d3,d5i_d4;                       //For Muh = 5 case
    multiply M41 (.X(d5i_d2),.A(d[5]),.B(i_d[2]));
    multiply M42 (.X(d5i_d3),.A(d[5]),.B(i_d[3]));
    multiply M43 (.X(d5i_d4),.A(d[5]),.B(i_d[4]));
    wire [7:0] d5i_d2sigma20,d5i_d3sigma31,d5i_d3sigma30,d5i_d4sigma42,d5i_d4sigma41,d5i_d4sigma40;
    multiply M44 (.X(d5i_d2sigma20),.A(d5i_d2),.B(sigma[2][7:0]));
    multiply M45 (.X(d5i_d3sigma31),.A(d5i_d3),.B(sigma[3][15:8]));
    multiply M46 (.X(d5i_d3sigma30),.A(d5i_d3),.B(sigma[3][7:0]));
    multiply M47 (.X(d5i_d4sigma42),.A(d5i_d4),.B(sigma[4][23:16]));
    multiply M48 (.X(d5i_d4sigma41),.A(d5i_d4),.B(sigma[4][15:8]));
    multiply M49 (.X(d5i_d4sigma40),.A(d5i_d4),.B(sigma[4][7:0]));
  
  reg [2:0] row;
//  always@(load,T_0,T_1,T_2,T_3,T_4,T_5,T_6)
    always@(posedge(clock))
  begin
    if(load)
     begin
       ready = 1'b0;
       sigma[1] = 0;
       sigma[2] = 0;
       sigma[3] = 0;
       sigma[4] = 0;
       sigma[5] = 0;
       sigma[6] = 0;       
       d[0] = S1;
       h[1] = 0;
       h[2] = 0;
       h[3] = 0;
       h[4] = 0;
       h[5] = 0;
       h[6] = 0;
     end
     
    else if(T_0)
     begin
        if(d0_zero)
        begin
            sigma[1] = 1;
            h[1] = 0;
        end
        
        else
        begin
            sigma[1][8*1-1:0] = 1;
            sigma[1][8*2-1:8*1] = d[0];
            h[1] = 1;
        end
        
        if((~h[1][0])&&(~h[1][1])&&(~h[1][2]))        //here h[1] is only 0 or 1
            d[1] = S2;
        else
            d[1] = S2^sigma_11_S1;
                      
     end
     
    else if(T_1)
     begin
        if(d1_zero)
        begin
            sigma[2] = sigma[1];
            h[2] = h[1];
        end

        else
        begin         
            if(d0_zero)     //Ro = -1th row
            begin
                sigma[2] = {sigma[1][31:24],d[1]^sigma[1][23:16],sigma[1][15:0]};
                h[2] = 3'd2;
            end
            
            else
            begin
                sigma[2] = (sigma[1]^T1_temp);
                h[2] = 3'd1;
            end
        end  
        
        case(h[2])
        3'd0:
            begin
                d[2] = S3;
            end
            
        3'd1:
            begin
                d[2] = T1_h1;
            end
        3'd2:
            begin
                d[2] = ((S3^T1_s21S2)^T1_s22S1);
            end    
        endcase  
        
     end
     
    else if(T_2)
     begin
        if(d2_zero)
        begin
            sigma[3] = sigma[2];
            h[3] = h[2];
        end
        
        else if((d1_zero)&&(d0_zero))     //Ro = -1th row
        begin
            sigma[3] = {(d[2]^(sigma[2][31:24])),sigma[2][23:0]};
            h[3] = 3'd3;
        end
        
        else if(Muh1_zero)          //This block is to account for the fact that, I am assigning Muh == 0 if it's d is zero
        begin                       //So that it will no lenger be largest number
            if(~d0_zero)            //But a case can arise if all Muh be zero.This block is for this case
            begin
                sigma[3] = {sigma[2][31:24],(sigma[2][23:16])^(d2i_d0),sigma[2][15:0]};
                h[3] = 3'd2;
            end
            
            else
            begin
                sigma[3] = {(T_2sigma3),(T_2sigma2),(T_2sigma1),sigma[2][7:0]};
                h[3] = (h[2]>(h[1]+1))?h[2]:(h[1]+1);
            end
        end
        
        else
        begin
            sigma[3] = {((sigma[2][31:24])^(d2i_d1sigma12)),((sigma[2][23:16])^(d2i_d1sigma11)),((sigma[2][15:8])^(d2i_d1sigma10)),sigma[2][7:0]};
            h[3] = (h[2]>(h[1]+1))?h[2]:(h[1]+1);
        end                       
        
        case(h[3])
        3'd0:
            begin
                d[3] = S4;
            end
        3'd1:
            begin
                d[3] = T2_h1;
            end
        3'd2:
            begin
                d[3] = ((S4^sigma31S3)^sigma32S2);
            end
        3'd3:
            begin
                d[3] = (((S4^sigma31S3)^sigma32S2)^sigma33S1);
            end
        endcase                    
     end
     
    else if(T_3)
     begin   
        row = 3'd6;          
        if(d3_zero)
        begin
            sigma[4] = sigma[3];
            h[4] = h[3];
        end
        
        else if((d2_zero)&&(d1_zero)&&(d0_zero))     //Ro = -1th row
        begin
            row = 3'd7;
        end
        
        else if(Muh1_zero&&Muh2_zero)
        begin
            if(~d0_zero)
                row = 3'd0;
            else if(~d1_zero)
                row = 3'd1;
            else if(~d2_zero)
                row = 3'd2;
        end
                
        else
            begin
                if(M1l3)
                    row = 1;
                else if(M2l3)
                    row = 2;
            end
               
        case(row)
        3'd7:
            begin
                sigma[4] = sigma[3];
                h[4] = 3'd4;
            end
        3'd0:
            begin
                sigma[4] = {((sigma[3][31:24])^d3i_d0),sigma[3][23:0]};
                h[4] = 3'd3;
            end
        3'd1:
            begin
                sigma[4] = {((sigma[3][31:24])^(d3i_d1sigma11)),((sigma[3][23:16])^(d3i_d1sigma10)),sigma[3][15:0]};
                h[4] = (h[3]>(h[1]+2))?h[3]:(h[1]+2);
            end
        3'd2:
            begin
                sigma[4] = {((sigma[3][31:24])^(d3i_d2sigma22)),((sigma[3][23:16])^(d3i_d2sigma21)),((sigma[3][15:8])^(d3i_d2sigma20)),sigma[3][7:0]};
                h[4] = (h[3]>(h[2]+1))?h[3]:(h[2]+1);
            end
        endcase
        
        case(h[4])
        3'd0:
            begin
                d[4] = S5;
            end
        3'd1:
            begin
                d[4] = (S5^sigma41S4);
            end
        3'd2:
            begin
                d[4] = ((S5^sigma41S4)^sigma42S3);
            end
        3'd3:
            begin
                d[4] = (((S5^sigma41S4)^sigma42S3)^sigma43S2);
            end
        3'd4:
            begin
                d[4] = (((S5^sigma41S4)^sigma42S3)^sigma43S2);
            end
        endcase 
     end
     
    else if(T_4)
     begin
        row = 3'd6;
        if(d4_zero)
        begin
            sigma[5] = sigma[4];
            h[5] = h[4];
        end
         
        else if((d3_zero)&&(d2_zero)&&(d1_zero)&&(d0_zero))     //Ro = -1th row
        begin
            row = 3'd7;
        end
       
        else if(Muh1_zero&&Muh2_zero&&Muh3_zero)
        begin
            if(~d0_zero)
                row = 3'd0;
            else if(~d1_zero)
                row = 3'd1;
            else if(~d2_zero)
                row = 3'd2;
            else if(~d3_zero)
                row = 3'd3;
        end
        
        else
        begin
            if(M1l2)
                row = 3'd1;
            else if(M2l2)
                row = 3'd2;
            else if(M3l2)
                row = 3'd3;
        end
        
        case(row)
        3'd7:
            begin
                sigma[5] = sigma[4];
                h[5] = 3'd5;
            end
        3'd0:
            begin
                sigma[5] = sigma[4];
                h[4] = 3'd4;
            end
        3'd1:
            begin
                sigma[5] = {((sigma[4][31:24])^(d4i_d1sigma10)),sigma[4][23:0]};
                h[5] = (h[4]>(h[1]+3))?h[4]:(h[1]+3);
            end
        3'd2:
            begin
                sigma[5] = {((sigma[4][31:24])^(d4i_d2sigma21)),((sigma[4][23:16])^(d4i_d2sigma20)),sigma[4][15:0]};
                h[5] = (h[4]>(h[2]+2))?h[4]:(h[2]+2);
            end
        3'd3:
            begin
                sigma[5] = {((sigma[4][31:24])^(d4i_d3sigma32)),((sigma[4][23:16])^(d4i_d3sigma31)),((sigma[4][15:8])^(d4i_d3sigma30)),sigma[4][7:0]};
                h[5] = (h[4]>(h[3]+1))?h[4]:(h[3]+1);
            end
        endcase
        
        case(h[5])
        3'd0:
            begin
                d[5] = S6;
            end
        3'd1:
            begin
                d[5] = (S6^sigma51S5);
            end
        3'd2:
            begin
                d[5] = ((S6^sigma51S5)^sigma52S4);
            end
        3'd3:
            begin
                d[5] = (((S6^sigma51S5)^sigma52S4)^sigma53S3);
            end
        3'd4:
            begin
                d[5] = (((S6^sigma51S5)^sigma52S4)^sigma53S3);
            end
        endcase 
       
     end
     
    else if(T_5)
     begin
        row = 3'd6;
        if(d5_zero)
        begin
            sigma[6] = sigma[5];
            h[6] = h[5];
        end
        
        else if((d4_zero)&&(d3_zero)&&(d2_zero)&&(d1_zero)&&(d0_zero))     //Ro = -1th row
        begin
            row = 3'd7;    
        end
        
        else if(Muh1_zero&&Muh2_zero&&Muh3_zero&&Muh4_zero)
        begin
            if(~d0_zero)
                row = 3'd0;
            else if(~d1_zero)
                row = 3'd1;
            else if(~d2_zero)
                row = 3'd2;
            else if(~d3_zero)
                row = 3'd3;
            else if(~d4_zero)
                row = 3'd4;
        end
        
        else
        begin
            if(M1l)
                row = 3'd1;
            else if(M2l)
                row = 3'd2;
            else if(M3l)
                row = 3'd3;
            else if(M4l)
                row = 3'd4;
        end
     
     case(row)
        3'd7:
            begin
                sigma[6] = sigma[5];
            end
        3'd0:
            begin
                sigma[6] = sigma[5];
            end
        3'd1:
            begin
                sigma[6] = sigma[5];
            end
        3'd2:
            begin
                sigma[6] = {((sigma[5][31:24])^(d5i_d2sigma20)),sigma[5][23:0]};
            end
        3'd3:
            begin
                sigma[6] = {((sigma[5][31:24])^(d5i_d3sigma31)),((sigma[5][23:16])^(d5i_d3sigma30)),sigma[5][15:0]};
            end
        3'd4:
            begin
                sigma[6] = {((sigma[5][31:24])^(d5i_d4sigma42)),((sigma[5][23:16])^(d5i_d4sigma41)),((sigma[5][15:8])^(d5i_d4sigma40)),sigma[5][7:0]};
            end
        endcase
    end
     
    else if(T_6)
     begin
        ready = 1'b1;
        w0 = sigma[6][7:0];
        w1 = sigma[6][15:8];
        w2 = sigma[6][23:16];
        w3 = sigma[6][31:24];
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
