% A script to plot a piecewise linear flight plan

% Define three co-ordinates for the lines to go through
Hpoints = [0,1500,3000];                   % In vector form X = [x1 x2 x3]
Vpoints = [-1,-250,-300];                   %            and Y = [y1 y2 y3]

%  Find intercepts and slopes, store as data structure lineCoeffs
lineCoeffs = points2pwl(Hpoints,Vpoints);

% For full range of heights (m), find the corresponding velocities (m/s), using function getPWLval
heights = 0:1:3000;
vdesired = getPWLval(lineCoeffs,heights);

% Plot the flight plan
for sp = -300:10:-100
    Hpoints = [0 1500 3000];
    Vpoints = [-1 sp -300];
    lineCoeffs = points2pwl(Hpoints,Vpoints);
    heights = 0:1:3000;
    vdesired = getPWLval(lineCoeffs,heights);
    plot(heights,vdesired);
    xlabel('height (m)')
    ylabel('desired velocity (m/s)')
    grid
    hold on
end

% Plot 3 original points to show fixed points where lines should pass through
hold on
plot(Hpoints,Vpoints,'ro','MarkerSize',10)
title({'PWL Flight Plan'})
x = 1000;
vdesired1000 = getPWLval(lineCoeffs,1000);
plot(x,vdesired1000,'kx')