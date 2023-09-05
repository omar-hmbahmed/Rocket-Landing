%Omar Ahmed
%Writing a function to be called by the controller

function thrust = ThrustControl(state,gain,vdesired)

%Setting the equations to be used in the controller
Error = vdesired - state.v;
thrust = gain * Error + (state.fuelmass + state.fixedmass) * state.g;