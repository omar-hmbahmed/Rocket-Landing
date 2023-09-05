 %Omar Ahmed
 %Creating the GetAcceleration function
% 5.1 Calculate the acceleration.
 function a = GetAcceleration(state,thrust)

%           5.1.1 Calculate the total mass.
 mass = state.fixedmass + state.fuelmass;
%           5.1.2 Calculate the force.
 Force = thrust - mass * state.g;
%           5.1.3 Use Newton's second law to calculate the acceleration.
 a = Force / mass;