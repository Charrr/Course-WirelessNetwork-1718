function [ output ] = debpsk( input, f0 )
%	Demodulates the modulated signal.
%   f0 denotes the center frequency of the BPSK modulation.
%   Note: both input and output are row vectors.

fs = 65536;         % Keep the sampling rate consistent with that in modulation.
n = fs/f0;          % every 1 bit corresponds to n samples.

s = input .* cos(2*pi*f0*(1:length(input))/fs);  % Multiply by the carrier wave.

[b,a] = ellip(4,0.1,40,1/128);                  % Deisgn a low-pass filter.
s_filtered = filter(b,a,s);

% Sample and decide.
s_reshaped = reshape(s_filtered, n, []);        % So that every column vector represents one bit.
s_sampled = s_reshaped(floor(n/2), :);            % Take the median value of every colunm vector as one sample.
s_decided = (s_sampled < 0);                    % Deicide: if positive, the bit is 0; if negative, the bit is 1.

output = s_decided;

end