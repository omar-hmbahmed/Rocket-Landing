%Omar Ahmed
%Creating the simulator function


function newstate = simulator(oldstate,thrust)

newstate = oldstate;        % Make a new copy of all the variables in state, ready for updating.

newstate.a = GetAcceleration(oldstate,thrust);
%5.2 Use Euler's method to find the position at the next step.
newstate.h = oldstate.h + oldstate.dt * oldstate.v;
%5.3 Use Euler's method to find the velocity at the next step.
newstate.v = oldstate.v + oldstate.dt * oldstate.a;
%5.4 Increase the time by dt.
newstate.t = oldstate.t + oldstate.dt; 
 