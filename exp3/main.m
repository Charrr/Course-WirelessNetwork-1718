%*****************************************
% for the three parts.
% n is the number servers.
% A is the traffic intensity.
% p is the blocking probability.
%*****************************************

n_1 = 1:2;
A_1 = linspace(0.1,10,50); % 50 points between 0.1 and 10.
n_2 = 10:10:20;
A_2 = linspace(3,20,50);
n_3 = 30:10:100;
A_3 = linspace(13,120,50);

%*****************************************

% for each part, call the erlang_ b() function.

%*****************************************

for i = 1:length(n_1)
    for j = 1:length(A_1)
        p_1(j,i) = erlangB(n_1(i), A_1(j));
    end
end

for i = 1 : length(n_2)
    for j = 1 : length(A_2)
        p_2(j,i) = erlangB(n_2(i), A_2(j));
    end
end

for i = 1 : length (n_3)
    for j = 1 : length(A_3)
        p_3(j,i) = erlangB(n_3(i), A_3(j));
    end
end

%*****************************************
% use log log to figure the result within logarithm coordinate.
%*****************************************

loglog(A_1,p_1,'k-',A_2,p_2,'k-',A_3,p_3,'k-');
xlabel('Traffic intensity in Erlangs (A)')
ylabel('Probability of Blocking (P) ')