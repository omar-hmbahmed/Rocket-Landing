%Omar Ahmed
%Writing a function to plot graphs
function PlotGraphs(H,V,A,M,T,gain,vdesired)

subplot(4,1,1) %Top Graph
plot(T,H,'g')
title ('Height')
xlabel('t')
ylabel('h')
grid

subplot(4,1,2) %2nd Graph
plot(T,V,'b','DisplayName','Lander Velocity')
title ('Velocity')
xlabel('t')
ylabel('v')
yline(vdesired,'k--','DisplayName','Target Velocity')
range = max(V)-min(V);
axis([T(1) T(end) min(V)*1.1 (range*1.2)-abs(min(V))])%lines 18-19 adjust the axis so horizontal line is visible
legend('Location','SouthEast') 
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
text(T(end),20,' \leftarrow Final fuel mass ')

sgtitle( ['Version 7, where gain = ', num2str(gain)])


