% Question 2

N = input('the cluster size N = '); 
n = input('the path loss exponent n = ');
M = 100000;   % the times of simulation
 
%*** call function to get the randomly lacation of the user ***%
MSPos = genPosition(M); 
 
%*** call function to get the lacation of 18 co-interference cells ***%
CelLoc = AdjCel(N); 
 
pos=ones(18,M);
for i=1:18
    pos(i,:)=RandPOS(M);
end
 
%*** the location of inteference MS within inteference cell ***%
IntMS = pos'+ones(M,1)*CelLoc'; 
 
%*** ds is the '-n' power of the distance between MS and BaseStation ***%
ds = (abs(MSPos)).^-n; 
 
%*** di is the '-n' power of the distance between inteference MS and BaseStation ***%
ditemp = (abs(IntMS)).^-n; 
di = ditemp*ones(18,1); 
 
%*** the SIR  ***%
SIR = 10*log(ds./di); 
 
%EverageSIR = SIR*ones(1,M)/M 
hist(SIR,-20:150) 
title('pdf of SIR'); 
xlabel('SIR(dB)'); 
ylabel('pdf'); 
