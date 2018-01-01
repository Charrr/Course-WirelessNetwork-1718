% Commands for question 1.

ns = [1,2,10:10:100];

[X,Y] = meshgrid(ns, 0:1:1000);

[M,N] = size(X);
Z = zeros(M,N);

for i = 1:M
    for j = 1:N
        Z(i,j) = erlangB(X(i,j),Y(i,j));
    end
end

txtLegends = cell(1,N);
% Plot a 2D graph with respect to A and PB
figure,
for i = 1:N
    plot(Y(:,i), Z(:,i));
    txtLegends{i} = strcat('n=',num2str(ns(i)));
    hold on;
end
xlabel('x: A'), ylabel('y: P_B'),
legend(txtLegends);

% Plot a 2D loglog graph with respect to A and PB
figure,
for i = 1:N
    loglog(Y(:,i), Z(:,i));
    hold on;
end
xlabel('x: A'), ylabel('y: P_B'),
legend(txtLegends);

% Plot a 3D-mesh.
figure, mesh(X,Y,Z);
xlabel('x: n'), ylabel('y: A'), zlabel('z: P_B');