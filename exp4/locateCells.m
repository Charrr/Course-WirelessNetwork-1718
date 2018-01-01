function [LocCells] = locateCells(N)
% Finds out the coordinates of the 18 cells in complex number
%   Input: N - cluster size
%   Output: LocCells - an 18-dimensional (18 = inner 6 + outer 12) vector containing
%           the coordinates of the co-interference cells in complex number

[i0,j0] = cluster(N);

% Initialise the 18 locations.
LocCells = zeros(18,1)+1i*zeros(18,1);

% The first co-interference cell.
LocCells(1) = sqrt(3)*( i0*exp(1i*pi/6) + j0*exp(1i*pi/6+1i*pi/3));

% Every next cell is shifted by 60-degree from the last.
for k=2:6
    LocCells(k) = LocCells(k-1)*(0.5+sqrt(3)/2*1i);
end

% The outer 12 co-interference cells are superposed based on the first cycle.
for i = 1:6
    LocCells(2*i+5) = LocCells(i)+LocCells(i);
    LocCells(2*i+6) = LocCells(i)+LocCells(i+1);
end

LocCells(18) = LocCells(6)+LocCells(1);

% figure, scatter(real(LocCells),imag(LocCells),'filled'); title('Co-interference cells');
end
