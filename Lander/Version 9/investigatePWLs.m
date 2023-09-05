% A script to plot a piecewise linear flight plan

% Define three co-ordinates for the lines to go through
Hpoints = [0,1500,3000];                   % In vector form X = [x1 x2 x3]
Vpoints = [-275,-250,-285];                   %            and Y = [y1 y2 y3]

%  Find intercepts and slopes, store as data structure lineCoeffs
lineCoeffs = points2pwl(Hpoints,Vpoints);

% For full range of heights (m), find the corresponding velocities (m/s), using function getPWLval
heights = 0:1:3000;
vdesired = getPWLval(lineCoeffs,heights);
j = 1;
% Plot the flight plan
 SP = -300:10:-100;
for sp = SP
    Hpoints = [0 1500 3000];
    Vpoints = [-1 sp -300];
    lineCoeffs = points2pwl(Hpoints,Vpoints);
    [maxa(j),landingv(j),remainingfuelmass(j)] = LanderFunc(lineCoeffs);
 j = j+1;
end

%Plotting the values for maxa, landingv, and remainingfuelmass 
subplot(3,1,1)
plot(SP, maxa)
ylabel('max accel.(ms^-2)')
grid

subplot(3,1,2)
plot(SP, landingv)
ylabel('landing velocity (m/s)')
grid

subplot(3,1,3)
plot(SP,remainingfuelmass)
ylabel('Fuel left(kg)')
grid
hold on
