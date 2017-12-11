function [ M ] = mSeq( orders )
%MSEQ Generates an m-sequence according to the given orders of the polynomial.
%   orders: the array of the orders of the given polynomial.
%           e.g., 1+x^2+x^5 corresponds to [0,2,5]

% Convert the polynomial orders into a binary sequence representing the connections of registers.
len = max(orders)+1;    % Total length of the LFSR.
seq = zeros( 1, len );
for i = 1:length(orders)
    seq(orders(i)+1) = 1;
end

N = 2^len - 1;  % The period of the M-sequence.
M = zeros(1,N); % Initialising M, of length 2^n-1

register = [1, zeros(1,len-1)];
M(1) = register(1);
for i = 2:N
    nextRegister(1:len-1) = register(2:len);        % Shifting.
    nextRegister(len) = mod(sum(seq.*register), 2); % Modulus 2 plus operaiton.
    register = nextRegister;                        % Shifting.
    M(i) = register(1);
end

end

