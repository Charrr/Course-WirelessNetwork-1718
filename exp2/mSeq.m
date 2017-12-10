function [ M ] = mSeq( orders )
%MSEQ Generates an m-sequence according to the given orders of the polynomial.
%   orders: the array of the orders of the given polynomial.
%           e.g., 1+x^2+x^5 corresponds to [0,2,5]

% Convert the polynomial orders into a binary sequence representing the connections of registers.
len = max(orders)+1;
seq = zeros( 1, len );
for i = 1:length(orders)
    seq(orders(i)+1) = 1;
end

M = seq;

end

