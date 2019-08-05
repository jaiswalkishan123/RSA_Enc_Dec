function otp_generation()
disp('OPT GENERATION IN PROGRESS..................');
otp=randi(power(2,17),1);
disp(otp);
[otpd,otpe,otpn]=key_gen();
otp_enc=rsa_crypt2(otp,otpe,otpn);
disp('otp authentication in progress........');
writematrix(otp,'verification.txt');
userv1=dlmread('verification.txt','');
userv=rsa_crypt2(otp_enc,otpd,otpn);
if (isequal(userv1,otp))
    if((isequal(userv,otp)))
   disp('otp verified procced for message transfer');
   pause(2);
   message_transfer();
    end
else
    disp('UNAUTHORISED ACCESS...');
    return
end
end
