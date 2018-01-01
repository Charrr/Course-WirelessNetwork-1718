function [ PC ] = erlangC( n, A )

temp = n*erlangB(n, A);
PC = temp/(n - A*(1 - temp));

end

