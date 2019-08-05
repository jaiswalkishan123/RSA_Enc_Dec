function [b] = powermod(b,e,n)
b = mod(b,n);

left= [];
k=1;

while gt(e,1),
    t = b;
    b = mod(b*b,n);    
    if ne(mod(e,2),0),
        left(k)=t;
        k = k+1;
        e = e-1;
    end
    e = (e/2);
end

for i=left,
    b = mod(b*i,n);
end
end