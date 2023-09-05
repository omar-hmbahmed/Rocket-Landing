%Omar Ahmed
%Writing a function to plot graphs
function PlotGraphs(H,V,A,M,T)

subplot(4,1,1) %Top Graph
plot(T,H,'g')
title ('Height')
xlabel('t')
ylabel('h')
grid

subplot(4,1,2) %2nd Graph
plot(T,V,'b')
title ('Velocity')
xlabel('t')
ylabel('v')
grid

subplot(4,1,3) %3rd Graph
plot(T,A,'r')
title ('Acceleration')
xlabel('t')
ylabel('a')
grid

subplot(4,1,4) %Bottom Graph
plot(T,M,'r')
title ('Fuel Mass')
xlabel('t')
ylabel('m')
grid

sgtitle('Version 1')


