%joey mcintyre - matlab - lab 6 - set 14
clc;  %clear command line
clear;  %remove previous variables

%voltage on outer and inner bounds
VOut = 0;
VIn = 100;

%number of points in the x and y directions & total number of unknowns
NumberOfXPoints = 50;
NumberOfYPoints = NumberOfXPoints;
NumberOfUnknowns = NumberOfXPoints * NumberOfYPoints;

%matrix of coefficients and the right hand side vector
A = zeros(NumberOfUnknowns, NumberOfUnknowns);
b = zeros(NumberOfUnknowns, 1);

%midpoints of the lines in x and y directions
iLine = NumberOfXPoints / 2;
jLine = NumberOfYPoints / 2;

%counter of the equations
EquationCounter = 1;

%repeat for all rows and columns
for i = 1:NumberOfXPoints
    for j = 1:NumberOfYPoints
        
        %condition for the inner boundary
        if (i == iLine && j >= jLine)
            A(EquationCounter, EquationCounter) = 1;
            b(EquationCounter, 1) = VIn;
        
        %top boundary
        elseif ((i < iLine || i > iLine) && j == NumberOfYPoints)
            A(EquationCounter, EquationCounter) = 1;
            b(EquationCounter, 1) = 50;
        
        %interior points
        else
            A(EquationCounter, EquationCounter) = -4;
            
            %left boundary
            if (j == 1) 
                b(EquationCounter, 1) = b(EquationCounter, 1) - VOut;
            else
                A(EquationCounter, EquationCounter - 1) = 1;
            end
            
            %right boundary
            if (j == NumberOfYPoints)
                b(EquationCounter, 1) = b(EquationCounter, 1) - 50;
            else
                A(EquationCounter, EquationCounter + 1) = 1;
            end
            
            %top boundary
            if (i == 1)
                b(EquationCounter, 1) = b(EquationCounter, 1) - VOut;
            else
                A(EquationCounter, EquationCounter - NumberOfXPoints) = 1;
            end
            
            %bottom boundary
            if (i == NumberOfXPoints)
                b(EquationCounter, 1) = b(EquationCounter, 1) - VOut;
            else
                A(EquationCounter, EquationCounter + NumberOfXPoints) = 1;
            end

        end
        EquationCounter = EquationCounter + 1;

    end
end

%solve the vector of voltages and convert into a squate matrix
V = A \ b; 
V_Square = reshape(V, NumberOfXPoints, NumberOfYPoints); 

%obtain the surface figure
surf(V_Square);
colormap(jet);
figure;

%obtain the contour figure
[C, h] = contour(V_Square);
set(h, 'ShowText', 'on', 'TextStep', get(h, 'LevelStep') * 2);
colormap summer;
figure;

%obtain the electric field map [E = -Gradient(V)]
contour(V_Square);
[px, py] = gradient(V_Square);
hold on;
quiver(-px, -py);
hold off;
colormap summer;