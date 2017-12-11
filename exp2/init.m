poly = [0,5,7,8,9,13,15];
M = mSeq(poly);
figure, stem(M(1:100)); title('M-Sequence(1:100)');
figure, autocorr(M); title('Autocorrelation');