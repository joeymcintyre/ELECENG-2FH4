clc;
clear;

R1 = [1 2 3];
R2 = [3 2 1];

R1_dot_R2 = dot(R1, R2);
R2_dot_R2 = dot(R2, R2);

Proj_R1_on_R2 = (R1_dot_R2 / R2_dot_R2) * R2;

Mag_R1 = norm(R1);
Mag_R2 = norm(R2);

COS_theta = R1_dot_R2 / (Mag_R1 * Mag_R2);
theta = acos(COS_theta) * 180/pi;

fprintf('a) R1 dot R2 ='); disp(R1_dot_R2);

fprintf('b) Projection of R1 on R2 ='); disp(Proj_R1_on_R2);

fprintf('c) Angle between R1 and R2 ='); disp(theta);
