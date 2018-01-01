% Commands for the experiment.

% The availabe integers for the cluster number.
% for i = 0:10
%     for j = 0:10
%         N(i+1,j+1) = i*i + j*j + i*j;
%     end
% end


% Question 1 - forward
figure('Name', 'Forward: Same cluster size N=7'),
subplot(2,2,1), forwardLink(7, 2);
subplot(2,2,2), forwardLink(7, 3);
subplot(2,2,3), forwardLink(7, 4);
subplot(2,2,4), forwardLink(7, 8);

figure('Name', 'Forward: Same path loss exponent n=4'),
subplot(2,2,1), forwardLink(1, 4);
subplot(2,2,2), forwardLink(3, 4);
subplot(2,2,3), forwardLink(7, 4);
subplot(2,2,4), forwardLink(12, 4);

% Question 2 - reverse
figure('Name', 'Reverse: Same cluster size N=7'),
subplot(2,2,1), reverseLink(7, 2);
subplot(2,2,2), reverseLink(7, 3);
subplot(2,2,3), reverseLink(7, 4);
subplot(2,2,4), reverseLink(7, 8);

figure('Name', 'Reverse: Same path loss exponent n=4'),
subplot(2,2,1), reverseLink(1, 4);
subplot(2,2,2), reverseLink(3, 4);
subplot(2,2,3), reverseLink(7, 4);
subplot(2,2,4), reverseLink(12, 4);

