%**************************************************************************
% This function is to find cellulars coordinates x+jy
% (Base Stations in the middle) for a given N (so as i/j)
%  CelLoc is a 18*1 matrix with the coordinates of the co-interference
%  cell of the first two cycle.(6 for the first cycle and 12 for the second)
%**************************************************************************

function [CelLoc] = AdjCel(N)

%******** Call ClusterN functon to get the i and j value *******%
[i0,j0] = cluster(N);

%******** 18 locations considering two cycle of co-interference cell *******%
CelLoc = zeros(18,1)+1i*zeros(18,1);

%******** calculate the first co-interference cell  *******%
CelLoc(1) = sqrt(3)*( i0*exp(1i*pi/6) + j0*exp(1i*pi/6+1i*pi/3));

%******** the other cells are 60 degree shift of the last cell *******%
for k=2:6
    CelLoc(k) = CelLoc(k-1)*(0.5+sqrt(3)/2*1i);
end;

%******** the second 12 co-interference cells are the vector addtion of the first cycle  *******%
for i = 1:6
    CelLoc(2*i+5) = CelLoc(i)+CelLoc(i);
    CelLoc(2*i+6) = CelLoc(i)+CelLoc(i+1);
end;
CelLoc(18) = CelLoc(6)+CelLoc(1);
