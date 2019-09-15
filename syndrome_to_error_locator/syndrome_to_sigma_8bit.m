function [s1,s2,s3] = syndrome_to_sigma_8bit(S1,S2,S3,S4,S5,S6)
%s1 = 215,s2 = 2,s3 = 148, s4 = 39, s5 = 1,s6 = 54  251,2,148,39,1,54     3 error
%48,105,235,248,183,239                                2 error
%5,3,15,23,39,71                                       2 error
%
S1_gf = gf(S1,8);
S2_gf = gf(S2,8);
S3_gf = gf(S3,8);
S4_gf = gf(S4,8);
S5_gf = gf(S5,8);
S6_gf = gf(S6,8);

delta = [[S1_gf,S2_gf];[S2_gf,S3_gf]];
delta_1 = [[S1_gf,S3_gf];[S2_gf,S4_gf]];
delta_2 = [[S3_gf,S2_gf];[S4_gf,S3_gf]];

delta2 = [[S3_gf,S4_gf];[S4_gf,S5_gf]];
delta_12 = [[S3_gf,S5_gf];[S4_gf,S6_gf]];
delta_22 = [[S5_gf,S4_gf];[S6_gf,S5_gf]];

delta3 = [[S2_gf,S3_gf];[S3_gf,S4_gf]];
delta_13 = [[S2_gf,S4_gf];[S3_gf,S5_gf]];
delta_23 = [[S4_gf,S3_gf];[S5_gf,S4_gf]];

S5_gf = gf(S5,8);
S6_gf = gf(S6,8);
dlt =   [[S1_gf,S2_gf,S3_gf];[S2_gf,S3_gf,S4_gf];[S3_gf,S4_gf,S5_gf]];
dlt_1 = [[S1_gf,S2_gf,S4_gf];[S2_gf,S3_gf,S5_gf];[S3_gf,S4_gf,S6_gf]];
dlt_2 = [[S1_gf,S4_gf,S3_gf];[S2_gf,S5_gf,S4_gf];[S3_gf,S6_gf,S5_gf]];
dlt_3 = [[S4_gf,S2_gf,S3_gf];[S5_gf,S3_gf,S4_gf];[S6_gf,S4_gf,S5_gf]];
% disp(det(dlt));
% disp(det(delta));
% disp(det(delta2));
% disp(det(delta3));
    s12 = det(delta_12)/det(delta2);
    s22 = det(delta_22)/det(delta2);
    s13 = det(delta_13)/det(delta3);
    s23 = det(delta_23)/det(delta3);
    c1 = det(delta_1)/det(delta);
    c2 = det(delta_2)/det(delta);
    
if ((S1==0) && (S2==0) && (S3==0) && (S4==0) && (S5==0) && (S6==0))
    s1 = gf(0,8);
    s2 = gf(0,8);
    s3 = gf(0,8);
elseif ((S2/S1==S3/S2)&&(S3/S2==S4/S3)&&(S4/S3==S5/S4)&&(S5/S4==S6/S5))
    s1 = gf(S2/S1,8);
    s2 = gf(0,8);
    s3 = gf(0,8);
elseif ((s12==c1)&&(s22==c2)&&(s13==c1)&&(s23==c2))
    s1 = c1;
    s2 = c2;
    s3 = gf(0,8);
% 
%     disp(s12);
%     disp(s22);
%     disp(s13);
%     disp(s23);
elseif (dlt ~=0)
%     disp(det(delta));
    s3 = det(dlt_1)/det(dlt);
    s2 = det(dlt_2)/det(dlt);
    s1 = det(dlt_3)/det(dlt);
    disp(det(dlt));
    disp(det(dlt_1));
    disp(det(dlt_2));
    disp(det(dlt_3));
end

end
