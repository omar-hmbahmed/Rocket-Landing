%Omar Ahmed
% The lander simulator and controller Version 2
 
% 1. Initialise the values.
 %    1.1 Set the Model Parameters.
 state.fixedmass = 500;    % kg Mass with no fuel
 state.fuelmass = 1500;    % kg
 state.g = 9.81;           % Acceleration due to gravity m s^-2
 state.a = -state.g;       % Acceleration m s^-2
 state.v = -300;           % Velocity m /s
 state.h = 3000;           % Height m
 state.t = 0;              % Time s
 state.dt = 0.1;           % Step size s
%    1.2 Initialise vectors to store the data to plot.
 n = 600;                  % The total number of points
 H = zeros(1,n);           % Vector to store the values of h
 V = zeros(1,n);           % Vector to store the values of v
 A = zeros(1,n);           % Vector to store the vaues of a
 M = zeros(1,n);           % Vector to store the values of fuelmass
 T = zeros(1,n);           % Vector to store the values of t
k = 0;
% 2. Repeat for each time step while above the ground.
 while (state.h >0 && k < n)

     %    3. Store the data to plot later.
     k = k+1;
     H(k) = state.h;
     V(k) = state.v;
     A(k) = state.a;
     M(k) = state.fuelmass;
     T(k) = state.t;
 
%    4. Get the thrust from the controller.
     thrust = 19620;
 
%    5. Run the simulator to predict what will happen over the next time step.
     state = simulator(state,thrust);
 
% 6. End of repeat.
 end
 %removing unused points
 H = H(1:k);
 V = V(1:k);
 A = A(1:k);
 M = M(1:k);
 T = T(1:k);
 
% 7. Plot the data.
PlotGraphs(H,V,A,M,T)