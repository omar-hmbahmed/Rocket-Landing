%Omar Ahmed
%Creating CheckCriteria funtion to analyse the performance of the
%controller

function CheckCriteria(A,V,M)


%Displaying the key values that need to be checked
disp(['Maximum acceleration is ' num2str(max(A))])
disp(['Landing velocity is ' num2str(V(end))])
disp(['Fuel mass remaining at landing is ' num2str(M(end))])

%These if statements check the values have passed or failed the criteria
%and displays the result
if 0 > V(end) & V(end)> -2
    disp('Criteria #1 Passed')
else
    disp('Criteria #1 Failed')
end

if M(end) > 0
   disp('Criteria #2 Passed')
else
    disp('Criteria #2 Failed')
end

if max(A) < 6 * 9.81
    disp('Criteria #3 Passed')
else
    disp('Criteria #3 Failed')
end