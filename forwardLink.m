function forwardLink( N, n )
% Calculates the SIR in the forward link, and repeats it by randomly changing the position of the MS.
%   Input: N - cluster size
%          n - path loss exponent

ms = 100000; % 100000 trials.

PosMSs = genPosition(ms); % Generates random position of the user.
PosCells = locateCells(N); % Locates the co-interference cells.

% Distance between MS and BaseStation by -n power.
ds = (abs(PosMSs)).^-n;
ditemp1 = abs(PosMSs*(ones(18,1))'-ones(ms,1)*PosCells'); 
ditemp2 = ditemp1.^-n; 

% Integrates the inteference distance.
di = ditemp2*ones(18,1); 

% Calculates the SIR.
SIR = 10*log(ds./di); 

% Plot the histogram.
figure, hist(SIR, -20:250); title('Histogram'); 
xlabel('SIR(dB)'); ylabel('numbers of MS');
end

