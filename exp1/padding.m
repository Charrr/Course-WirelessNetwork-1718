function [ temp ] = padding( input, outlength )
%PADDING Summary of this function goes here
%   Detailed explanation goes here

inlength = length(input);
%fprintf('inlength = %d. \n', inlength);
period = floor(outlength/inlength);
%fprintf('period = %d. \n', period);

temp = zeros(1,0);

for i = 1:(length(input))
    temp = [ temp; (input(i)*ones(1,period))' ];
    %fprintf('output = %d. \n', output);
end
temp = [ temp; zeros(1,rem(outlength,inlength))' ];
output = temp';

end

