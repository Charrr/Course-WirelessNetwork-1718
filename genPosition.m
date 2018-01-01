function [z] = genPosition(m)
% Randomly generates m positions of the MS. 
% All points should be within a hexagon area which in the 
% meantime excludes a centre circular area of raidus 0.1.
%   Input: m - the number of MS to be generated.
%   Output: z - the coordinates of the positions in complex numbers.


% Firstly, let all points fall into a rectangular area.
x = 1.5*rand(m,1)-1;
y = sqrt(3)*rand(m,1)-0.5*sqrt(3);

% Secondly, exclude the points that fall outside the hexagon.
for k=1:m
    if x(k)>-1 && x(k)<-0.5 && y(k)>(1+x(k))*sqrt(3)
        x(k)=x(k)+1.5;
        y(k)=y(k)-sqrt(3)/2;
    elseif x(k)>-1 && x(k)<-0.5 && y(k)<-(1+x(k))*sqrt(3)
        x(k)=x(k)+1.5;
        y(k)=y(k)+sqrt(3)/2;
    end
    
% Lastly, exclude the points that is too close to the centre.
    if sqrt(x(k)^2+y(k)^2)<0.1
        x(k)=0.1;
        y(k)=0;
    end
end
z=x+1i*y;

% Show all the points.
figure, scatter(real(z),imag(z),'filled'); title('Random positions');
end
