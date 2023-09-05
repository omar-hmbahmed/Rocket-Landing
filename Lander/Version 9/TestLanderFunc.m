%Omar Ahmed
%Testing the lander function


Hpoints = [0,1500,3000];                   
Vpoints = [-1,-250,-300];
lineCoeffs = points2pwl(Hpoints,Vpoints);
%Calling lander function
LanderFunc(lineCoeffs)

%Displaying the key values
disp(max(A))
disp(V(end))
disp(M(end))

CheckCriteria(A,V,M)