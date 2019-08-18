function [s1,s2,s3] = syndrome_to_sigma_8bit(S1,S2,S3,S4,S5,S6)

S1_gf = gf(S1,8);
S2_gf = gf(S2,8);
S3_gf = gf(S3,8);
S4_gf = gf(S4,8);
delta = [[S1_gf,S2_gf];[S2_gf,S3_gf]];
delta_1 = [[S1_gf,S3_gf];[S2_gf,S4_gf]];
delta_2 = [[S3_gf,S2_gf];[S4_gf,S3_gf]];

S5_gf = gf(S5,8);
S6_gf = gf(S6,8);
dlt =   [[S1_gf,S2_gf,S3_gf];[S2_gf,S3_gf,S4_gf];[S3_gf,S4_gf,S5_gf]];
dlt_1 = [[S1_gf,S2_gf,S4_gf];[S2_gf,S3_gf,S5_gf];[S3_gf,S4_gf,S6_gf]];
dlt_2 = [[S1_gf,S4_gf,S3_gf];[S2_gf,S5_gf,S4_gf];[S3_gf,S6_gf,S5_gf]];
dlt_3 = [[S4_gf,S2_gf,S3_gf];[S5_gf,S3_gf,S4_gf];[S6_gf,S4_gf,S5_gf]];

if ((S1==0) && (S2==0) && (S3==0) && (S4==0) && (S5==0) && (S6==0))
    s1 = gf(0,8);
    s2 = gf(0,8);
    s3 = gf(0,8);
elseif ((S2/S1==S3/S2)&&(S3/S2==S4/S3)&&(S4/S3==S5/S4)&&(S5/S4==S6/S5))
    s1 = gf(S2/S1,8);
    s2 = gf(0,8);
    s3 = gf(0,8);
elseif (delta ~= 0)
    s1 = det(delta_1)/det(delta);
    s2 = det(delta_2)/det(delta);
    s3 = gf(0,8);
elseif (dlt ~=0)
    s1 = det(dlt_1)/det(dlt);
    s2 = det(dlt_2)/det(dlt);
    s3 = det(dlt_3)/det(dlt);
end

end