function [d,e,n] = key_gen()
RSA_version =2048 ;
% p and q are distinct primes.
%randseed function takes argument(State,m,n,range_min,range_max), mxn.
p = randseed(1,1,1,1,RSA_version);
p=max(primes(p));
q = randseed(1,1,1,1,RSA_version);
q=max(primes(q));
while q==p
    q = randseed;
end

% n is 64-bit integer
n = int64(p)*int64(q);

% calculate phi(n) = (p1)*(q-1)
phi = int64(p-1)*int64(q-1);
disp(phi);

% e =GCD(phi,e)=1
e = int64(2);
while gcd(phi,e)~=1
    e = e+1;
end

%dmod phi == 1(mod phi)
[k,x,d] = gcd(phi,e);
d = mod(d,phi);
if(d<0)
    d = d+phi;
end
d = int64(d);
end
% public key-->{e,n}
% private keys-->{d,n}