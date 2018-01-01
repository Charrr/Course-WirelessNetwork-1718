function [i,j] = cluster(N)
% Locates co-channel cells according to the formula N = i^2+j^2+ij.
%   Input: N - cluster size
%   Output: i,j - the path length i,j
i = -1;
j = -1;
for a = 0:sqrt(N)
    for b = 0:sqrt(N)
        if a^2+b^2+a*b == N
            i = a;
            j = b;
        end;
    end;
end;

if i == -1 || j == -1
    error('N cannot be divided into a pair of i,j');
end

display(i); display(j);
end