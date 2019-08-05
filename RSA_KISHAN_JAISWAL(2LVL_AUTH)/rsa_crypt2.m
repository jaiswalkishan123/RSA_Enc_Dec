function [crypt_msg] = rsa_crypt(message,key,n)

message = (message);
crypt_msg = [];
for i=(1:length(message)),
    crypt_msg(i) = (powermod(message(i),key,n));
end
end
