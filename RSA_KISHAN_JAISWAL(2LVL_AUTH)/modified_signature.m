function modified_signature() 
clear;
clc;
look_id=fopen('serial.txt','r+');
line1=fgetl(look_id);
lines1=cell(0,1);
while ischar(line1)
    lines1{end+1,1}=line1;
    line1=fgetl(look_id);
end
fclose(look_id);
%s=cell2mat(lines1);
look_id1=fopen('serial.txt','r+');
look_idr=fopen('test1.txt','w+');
fprintf(look_idr,'%6s %6s\n','no','s.no');
writecell(lines1,'test1.txt','delimiter','tab');
lines1=cell2mat(lines1);
fclose(look_idr);
fclose(look_id1);
[id,ie,in] = key_gen();
select_sender=randi(5);
disp('selected sender is .....');
disp(select_sender);

%disp(text);
%%serial number 
serial=lines1(select_sender,1);
disp('----------intruments will create Digital Signature--------------');
sign = rsa_crypt2(serial,ie,in);
disp('Digital Signature: ');
fprintf('%x ',sign);
fprintf('\n');
disp('VERIFICATION IN PROGRESS');
pause(2);
%verification process
sign2 = rsa_crypt2(sign,id,in);
if (sign2 == serial) 
    disp('---------instrument2 Verifies Message with private  key------------');
disp('Signature mathcing with provided text.-->Verified text');
pause(2);
otp_generation();
%disp('----------------------------------------------------------------');
else 
disp('NOT VERIFIED');
return
end
end
