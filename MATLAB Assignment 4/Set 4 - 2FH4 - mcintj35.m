%joey mcintyre - matlab - set 4
clc; %clear command line
clear; %remove previous variables

Epsilon_o = 8.85e-12; %permitivity of air
D = 2e-6; %surface charge density
P = [0 0 1]; %observation point
E = [0 0 0]; %initializing E

%discretizaation in rho and phi
Number_of_rho_steps = 100;
Number_of_phi_steps = 100;

%upper and lower boundaries of phi and rho
rho_lower = 0;
rho_upper = 1;
phi_lower = 0;
phi_upper = 2*pi;

d_rho = (rho_upper - rho_lower) / Number_of_rho_steps; %the rho increment
d_phi = (phi_upper - phi_lower) / Number_of_phi_steps; %the phi increment
ds = d_rho * d_phi; %area of a single grid
dQ = D * ds; %charge on a single grid

for j = 1 : Number_of_phi_steps
    for i = 1 : Number_of_rho_steps
        rho = rho_lower + d_rho / 2 + (i - 1) * d_rho; %rho component of center of grid
        phi = phi_lower + d_phi / 2 + (j - 1) * d_phi; %phi component of center of grid
        R = P - [rho*cos(phi) rho*sin(phi) 0]; %vector from center of grid to observation point P
        R_mag = norm(R); %magnitude of vector R
        E = E + (rho * dQ / (4 * Epsilon_o * pi * R_mag^3)) * R; %get contribution to the E field
    end
end

E
    

