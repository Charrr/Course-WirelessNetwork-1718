function [ PB ] = erlangB(m, A)
if m == 0
    PB = 1;   % Until m decreases to 0, P(O,A)=1
else
    PB = 1/(1 + m/( A*erlangB(m-1, A) )); 
    % Recursion takes place here. m decreases by 1 every loop until 0. 
end
end