[X,Y] = meshgrid(1:2:400, 1:2:300);
% figure, mesh(X,Y,(X.*Y));
% figure, mesh((X-Y));

[M,N] = size(X);
Z = zeros(M,N);

for i = 1:M
    for j = 1:N
        Z(i,j) = erlangB(X(i,j),Y(i,j));
    end
end

figure, mesh(X,Y,Z);