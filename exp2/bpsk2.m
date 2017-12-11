function [ output ] = bpsk2( input, f0 )
%   Modulates a signal by BPSK.
%   ///This file is based on bpsk.m in exp1.///

%   f0 denotes the center frequency of the BPSK modulation.
%   Note: both input and output are row vectors.

fs = 65536;     % Define the sampling rate.
dt = 1/fs;      % Samping time interval.
len = length(input);
n = fs/f0;      % For every bit, use n samples for modulation.

s = kron(input, ones(1, n));    % Repeat every bit by fs/f0 times so as to match the samples
t = (1:(len*n))*dt;             % The complete time sequence for modualtion.

output = cos(2*pi*f0*t + pi*s);
end