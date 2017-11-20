function [ output ] = dealaw( input )
%	Decode the demodulated signal
%   Does not include normalisaion, i.e., the range of the values will be
%   (-128,128)
octave = reshape(input, 8, []);     % Put every 8 digit as a column vector.
decoded = bin2dec(strcat(num2str(octave)'))';   % Convert every column (binary) to decimal numbers.
expanded = compand(decoded, 87.6, max_of_input, 'a/expander');    % Reverse the A-law convertion.
output = expanded;

end

