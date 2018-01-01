% Question 1
 
N = input('the cluster size N = '); 
n = input('the path loss exponent n = ');
M = 100000;   % the times of simulation

%*** call function to get the randomly lacation of the user ***%
MSPos = genPosition(M); 

%*** call function to get the lacation of 18 co-interference cells ***%
CelLoc = AdjCel(N); 

%*** ds is the '-n' power of the distance between MS and BaseStation ***%
ds = (abs(MSPos)).^-n; 

%*** calculate the '-n' power of the distance between MS and BaseStation of the co-interference cell ***%
ditemp1 = abs(MSPos*(ones(18,1))'-ones(M,1)*CelLoc'); 
ditemp2 = ditemp1.^-n; 

%*** add the distance of inteference togather. ***%
di = ditemp2*ones(18,1); 

%*** the SIR  ***%
SIR = 10*log(ds./di); 

%EverageSIR = SIR*ones(1,M)/M 
hist(SIR,-20:250) 
title('Histogram'); 
xlabel('SIR(dB)'); 
ylabel('numbers of MS');