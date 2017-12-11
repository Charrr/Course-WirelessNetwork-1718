function [ output ] = debpsk3( input, f0, pc )
in=tqn((input)',257);
m=size(in,1);
n=size(in,2);

output=zeros(m,1);
deltaT=1/65536;
tk=(0:256)*deltaT;
carry=cos(2*pi*f0*tk);
if nargin<3
    for k=1:m
        y=in(k,:).*carry;
        output(k)=(sum(y)>0);
    end
else
    for k=1:m
        y=in(k,:).*carry*(pc(k));
        output(k)=(y(257)>0);
    end
end

end