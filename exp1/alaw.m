function [ code ] = alaw( input )
% Encode the signal by A-law.
max_of_input = max(abs(input));

companded = compand(input, 87.6, max_of_input, 'a/compressor');
companded = round(companded * 128 / max_of_input);   % Normalise all the values to (-128,128).

encoded = zeros(length(input), 8);      % Initialise all the 

% for i = 1:length(companded);
%     switch companded(i)
%         case 
%     end
% end

end

