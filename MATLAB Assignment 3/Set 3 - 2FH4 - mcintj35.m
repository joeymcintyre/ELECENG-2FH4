clc; %clear command line
clear; %remove previous variables

%given charges & charge density
Q1 = 8e-9; 
Q2 = 8e-9; 
pL = 4e-9; 

Epsilono = 8.854e-12; %permittivity of free space constant

P = [0 0 0]; %observation point
A = [0 1 1]; %Q1 position
B = [0 -1 1]; %Q2 position
C = [3.5 3.5 0]; %line charges midpoint

Number_of_L_Steps = 10000; %steps along L

%vectors from charges to observation point
R1 = P - A; 
R2 = P - B; 

%magnitudes of R1 and R2
R1Mag = norm(R1); 
R2Mag = norm(R2);

%electric fields from Q1 and Q2
E1 = Q1 / (4 * pi * Epsilono * R1Mag^3) * R1; 
E2 = Q2 / (4 * pi * Epsilono * R2Mag^3) * R2; 

d = norm(P - C); %distance from observation point to midpoint of line charge
L = sqrt(98) * d; %length of line charge
length = sqrt(98); %relative length of the line
V_direction = [-7 / sqrt(98), 7 / sqrt(98), 0]; %direction vector of the line

dL = length / Number_of_L_Steps; %length of a segment
dL_V = dL * V_direction; %vector of a segment

EL = [0 0 0]; %initializing electric field due to line charge

C_segment = C - (Number_of_L_Steps / 2 * dL_V - dL_V / 2); %center of first line segment

for i = 1:Number_of_L_Steps
    R = P - C_segment; %vector from center of segment to observation point
    RMag = norm(R); %magnitude of R vector
    
    EL = EL + dL * pL / (4 * pi * Epsilono * RMag^3) * R; %contribution to electric field from each segment
    
    C_segment = C_segment + dL_V; %next segment
end

%total electric field
E = E1 + E2 + EL;

disp('Electric Field at [0, 0, 0]:');
disp(E);
