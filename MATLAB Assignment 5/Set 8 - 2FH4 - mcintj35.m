%joey mcintyre - matlab - set 5
clc; %clear command line
clear; %remove previous variables

Epsilono = 8.85e-12; %permitivity of air
D = 2e-6; %surface charge density

%lower and upper bounds of r, theta and phi
r_upper = 3.0; 
r_lower = 2.0;
theta_upper = pi;
theta_lower = 0;
phi_upper = 2 * pi;
phi_lower = 0;

%initialize discretization in the r, theta, and phi directions
Number_of_r_Steps = 100; 
Number_of_theta_Steps = 100; 
Number_of_phi_Steps = 100; 

%the step in the r, theta and phi directions
dr = (r_upper - r_lower) / Number_of_r_Steps;
dtheta = (theta_upper - theta_lower) / Number_of_theta_Steps;
dphi=(phi_upper - phi_lower) / Number_of_phi_Steps; 

% total energy stored in the region
WE=0;
for k=1:Number_of_phi_Steps
    for j=1:Number_of_theta_Steps
        for i=1:Number_of_r_Steps
            r = r_lower + 0.5 * dr + (i - 1) * dr; %radius of volume element
            theta = theta_lower + 0.5 * dtheta + (j - 1) * dtheta; %theta of volume element
            phi = phi_lower + 0.5 * dphi + (k - 1) * dphi; %phi of volume element
            EMag = D / (Epsilono * r * r); %magnitude of electric field of volume element
            dV = r * r * sin(theta) * dr * dtheta * dphi; %volume of element
            dWE = 0.5 * Epsilono * EMag * EMag * dV; %energy stored in element
            WE = WE + dWE; % contribution to the total energy
        end 
    end 
end

WE