function [ output ] = bpsk( input, f0 )
%BPSK Summary of this function goes here
%   f0 denotes the center frequency of the BPSK modulation.
outlength = 1024;
input_padded = padding(input,outlength);
for i = 1:outlength
   output(i) = cos(2*pi*f0*(i-1) + pi*input_padded(i));
end
% output = cos(2*pi/f0*(1:outlength));
end