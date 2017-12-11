function t2=tqn(t1,k)
t2=zeros(length(t1)/k,k); 
a=1;
b=1;
  for m=1:length(t1)-1
      if b>k
          a=a+1;
          b=1;
      end
      t2(a,b)=t1(m);
      b=b+1;
      m=m+1;
  end
end
