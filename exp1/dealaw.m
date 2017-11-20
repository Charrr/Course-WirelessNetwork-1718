function [ output ] = dealaw( input, nor )
%	Decode the demodulated signal.
%   nor denotes the normalisation scale in A-law companding.
len = length(input);
octave = reshape(input, 8, []);     % Put every 8 digit as a column vector.
deci = ones(1, len/8);     % The array of decimal numbers to be converted from the binary columns.
for n = 1:len/8
    if octave(1,n)==0       % Decide the sign bit.
        deci(n) = -1;       % If the first digit is 0, then the orignal value should be negative.
    end
    deci(n) = deci(n) * bin2dec(strcat(num2str(octave(2:8,n))')); % Convert the rest binary digits to decimal numbers.
end
% decoded = bin2dec(strcat(num2str(octave)'))';   
decoded = deci/127*nor;
expanded = compand(decoded, 87.6, nor, 'a/expander');    % Reverse the A-law convertion.
output = expanded;

end

