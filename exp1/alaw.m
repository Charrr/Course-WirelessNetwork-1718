function [ output ] = alaw( input )
% Encode the signal by A-law. 
% Note: both input and output are row vectors
max_of_input = max(input);
len = length(input);
compressed = compand(input, 87.6, max_of_input, 'a/compressor');
compressed = round(compressed * 128 / max_of_input);   % Normalise all the values to (-128,128).

encoded = zeros(len, 8);      % Initialise all the 

for n = 1:len
    if compressed(n)>0          % Assign the first bit - the sign bit
        encoded(n, 1) = 1;      % If positive, assign 1
    else
        encoded(n, 1) = 0;      % If negative, assgin 0
    end
    for i = 2:8                 % Assign the rest bits - 2nd to 8th
        binchar = dec2bin(abs(compressed(n)), 8);  % Convert the quantised value to binary digits.  
        encoded(n, i) = str2num(binchar(i));
    end
end

output = reshape(encoded',[],1)'; % Reform the matrix to a sequence of 1s and 0s.

end

