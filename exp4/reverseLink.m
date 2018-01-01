function reverseLink( N, n )
% Calculates the SIR in the reverse link, and repeats it by randomly changing the position of the MSs.
%   Input: N - cluster size
%          n - path loss exponent

ms = 100000; % 100000 trials.
 
PosMSs = genPosition(ms); % Generates random position of the user.
PosCells = locateCells(N); % Locates the co-interference cells.

pos = ones(18, ms);
for i=1:18
    pos(i,:)=genPosition(ms);
end

IntMS = pos'+ones(ms,1)*PosCells'; 
 
% Distance between MS and BaseStation by -n'th power.
ds = (abs(PosMSs)).^-n; 
 
% Distance between interferece MS and BaseStation by -n'th power.
ditemp = (abs(IntMS)).^-n; 
di = ditemp*ones(18,1); 
 
% Calculates the SIR.
SIR = 10*log(ds./di); 
 
% Plot the histogram.
hist(SIR, -20:150); title('PDF of SIR'); 
xlabel('SIR(dB)'); ylabel('PDF'); 
end

