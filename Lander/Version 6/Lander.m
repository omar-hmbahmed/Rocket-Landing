%Omar Ahmed
% The lander simulator and controller Version 6
 
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
 state.burnrate = 0.001;   % Burn rate in kg per Newton of thrust per second
 state.g = 9.81;                 % Gravitational acceleration in m s^-2
%    1.2 Initialise vectors to store the data to plot.
 n = 3000;                  % The total number of points
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
%        4.1 Set the gain and target velocity for current time step
      gain = 1000;              % Constant used when calculating thrust
      vdesired = 0;             % Desired velocity for controller in m/s
%        4.2 Find the thrust, based on this target velocity
     thrust = ThrustControl(state,gain,vdesired);
 
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
PlotGraphs(H,V,A,M,T,gain,vdesired)
CheckCriteria(A,V,M) %Checks if the criteria has passed or failed