clc;
clear;

%initializing variables
V = 0;
S1 = 0; S2 = 0; S3 = 0; S4 = 0; S5 = 0; S6 = 0;

% defining upper and lower boundaries
r_min = 0; r_max = 2;
theta_min = pi/4; theta_max = pi/2;
phi_min = pi/4; phi_max = pi/2;

%defining number of discretization steps
number_of_r_Steps = 100;
number_of_theta_Steps = 100;
number_of_phi_Steps = 100;

%increments calculated
dr = (r_max - r_min) / number_of_r_Steps;
dtheta = (theta_max - theta_min) / number_of_theta_Steps;
dphi = (phi_max - phi_min) / number_of_phi_Steps;

%volume of enclosed surface calculation
for k = 1 : number_of_theta_Steps
    theta = theta_min + (k - 1) * dtheta; %increments with each step

    for j = 1 : number_of_r_Steps
        r = r_min + (j - 1) * dr; %increments with each step

        for i = 1 : number_of_phi_Steps
            phi = phi_min + (i - 1) * dphi; %increments with each step
            V = V + r^2 * sin(theta) * dr * dtheta * dphi;
            
        end
    end
end

%S1 and S2 calculated area
r1=0;
r2=2;
for k = 1 : number_of_theta_Steps
    theta = theta_min + (k - 1) * dtheta; %increments with each step

    for i = 1 : number_of_phi_Steps
        phi = phi_min + (i - 1) * dphi; %increments with each step
        S1 = S1 + r1^2 * sin(theta) * dtheta * dphi;
        S2 = S2 + r2^2 * sin(theta) * dtheta * dphi;

    end
end

%S3 and S4 calculated area
for j = 1 : number_of_r_Steps
    r = r_min + (j-1) * dr; %increments with each step

    for i = 1 : number_of_phi_Steps
        phi = phi_min + (i-1) * dphi; %increments with each step
        S3 = S3 + r * sin(theta_min) * dr * dphi;
        S4 = S4 + r * sin(theta_max) * dr * dphi;

    end
end

%S5 and S6 calculated area
for k = 1 : number_of_theta_Steps
    theta = theta_min + (k-1) * dtheta; %increments with each step

    for j = 1 : number_of_r_Steps
        r = r_min + (j-1) * dr; %increments with each step
        S5 = S5 + r * dr * dtheta;

    end
end
S6=S5;

%total area of enclosed surface is calculated
S=S1+S2+S3+S4+S5+S6;

%printed results
fprintf('Volume: %f\n', V);
fprintf('Surface Area: %f\n', S); 