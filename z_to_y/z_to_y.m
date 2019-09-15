
function [y1,y2,y3] = z_to_y(S1,S2,S3,z1,z2,z3)
S1_gf = gf(S1,8);
S2_gf = gf(S2,8);
S3_gf = gf(S3,8);
z1_gf = gf(z1,8);
z2_gf = gf(z2,8);
z3_gf = gf(z3,8);
z1_gf2 = z1_gf*z1_gf;
z1_gf3 = z1_gf2*z1_gf;
z2_gf2 = z2_gf*z2_gf;
z2_gf3 = z2_gf2*z2_gf;
z3_gf2 = z3_gf*z3_gf;
z3_gf3 = z3_gf2*z3_gf;

delta = [[z1_gf,z2_gf];[z1_gf2,z2_gf2]];
delta_1 = [[S1_gf,z2_gf];[S2_gf,z2_gf2]];
delta_2 = [[z1_gf,S1_gf];[z1_gf2,S2_gf]];

dlt =   [[z1_gf,z2_gf,z3_gf];[z1_gf2,z2_gf2,z3_gf2];[z1_gf3,z2_gf3,z3_gf3]];
dlt_1 = [[S1_gf,z2_gf,z3_gf];[S2_gf,z2_gf2,z3_gf2];[S3_gf,z2_gf3,z3_gf3]];
dlt_2 = [[z1_gf,S1_gf,z3_gf];[z1_gf2,S2_gf,z3_gf2];[z1_gf3,S3_gf,z3_gf3]];
dlt_3 = [[z1_gf,z2_gf,S1_gf];[z1_gf2,z2_gf2,S2_gf];[z1_gf3,z2_gf3,S3_gf]];

if (z1==0)
    y1 = 0;
    y2 = 0;
    y3 = 0;
elseif (z2==0)
    y1 = S1;
    y2 = 0;
    y3 = 0;
elseif (z3==0)
    y1 = det(delta_1)/det(delta);
    y2 = det(delta_2)/det(delta);
    y3 = 0;
else
    y1 = det(dlt_1)/det(dlt);
    y2 = det(dlt_2)/det(dlt);
    y3 = det(dlt_3)/det(dlt);
end
end
