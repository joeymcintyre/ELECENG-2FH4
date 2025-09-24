%joey mcintyre - matlab - lab 7 - set 16
clc;
clear;

%define the toroid's parameters
I = 5.0;
N = 200;
r_i = 1.5;
r_o = 2.5;

%define the parameters of the observation plane
NumberOfXPlottingPoints = 25;
NumberOfYPlottingPoints = 25;
Xmin = -4;
Xmax = 4;
Ymin = -4;
Ymax = 4;

%steps in the x and y directions
StepX = (Xmax - Xmin) / (NumberOfXPlottingPoints - 1);
StepY = (Ymax - Ymin) / (NumberOfYPlottingPoints - 1);
[XData, YData] = meshgrid(Xmin:StepX:Xmax, Ymin:StepY:Ymax);

%initialize the magnetic field components
Bx = zeros(NumberOfYPlottingPoints, NumberOfXPlottingPoints);
By = zeros(NumberOfYPlottingPoints, NumberOfXPlottingPoints);
Bz = zeros(NumberOfYPlottingPoints, NumberOfXPlottingPoints);

%calculate the magnetic field at each observation point
for m = 1:NumberOfYPlottingPoints
    for n = 1:NumberOfXPlottingPoints
        %get the coordinates of current observation point
        PlotX = XData(m, n);
        PlotY = YData(m, n);
        r = sqrt(PlotX^2 + PlotY^2);
        
        %calculate the magnetic field for points withing the toroid
        if (r >= r_i) && (r <= r_o)
            %calculate tangential field
            Bphi = (I * N) / (2 * pi * r);
            theta = atan2(PlotY, PlotX);
            %convert to cartesian components
            Bx(m, n) = -Bphi * sin(theta);
            By(m, n) =  Bphi * cos(theta);
        end
    end
end

%plot magnetic field vectors in the observation region
figure;
quiver(XData, YData, Bx, By);
xlabel('x (cm)');
ylabel('y (cm)');
title('joey mcintyre - matlab - lab 7 - set 16')