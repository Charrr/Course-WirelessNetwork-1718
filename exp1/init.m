dt = 1/16;
tk = (0:1024)*dt;
st = sin(2*pi*tk)+cos(pi*tk);
Sf = fft(st);
Sfmag = abs(Sf);
st_alaw = alaw(st);