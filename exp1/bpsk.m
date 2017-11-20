function [ output ] = bpsk( input, f0 )
%   Modulates a signal by BPSK
%   f0 denotes the center frequency of the BPSK modulation.
%   Note: both input and output are row vectors.

fs = 65536;     % Define the sampling rate.
dt = 1/fs;     % Samping time interval.
len = length(input);
n = fs/f0;      % For every bit, use n samples for modulation.

s = kron(input, ones(1, n));    % Repeat every bit by fs/f0 times so as to match the samples
% s = 2*s-1;                      % Scale s from [0,1] to [-1,1]
t = (1:(len*n))*dt;             % The complete time sequence for modualtion.

output = cos(2*pi*f0*t + pi*s);

% outlength = 1024;
% input_padded = padding(input,outlength);
% for i = 1:outlength
%    output(i) = cos(2*pi*f0*(i-1) + pi*input_padded(i));
% end
% output = cos(2*pi/f0*(1:outlength));
end