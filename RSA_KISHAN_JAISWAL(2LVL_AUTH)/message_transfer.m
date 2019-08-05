clear;
clc;
c=0;
 read =xlsread('T1.xlsx');
 read=uint64(read);
tl=length(read);
tic
fprintf("\n");
    present_time=datetime('now');
%disp('-----------------------Original Message----------------------');
%disp(read);

for t=1:length(read)
  
       data_read=(read(t,:));

disp(t);
disp('-----------------------Key Generation----------------------');
[d,e,n] = key_gen();
fprintf('Generated keys:\n e=%d,\n d=%d,\n n=%d\n',e,d,n);

disp('------------------------Encryption-------------------------');
c = rsa_crpy(data_read,e,n);
fprintf('Cipher Text in Hex: ');
fprintf('\n');
for i=c,
    fprintf('%x ',i);
end
disp(' ');

disp('-------------------------Decryption------------------------');
plain = rsa_crpy(c,d,n);
disp('Plain text ');
fprintf("%d\t",plain);
%%for i=0:500000
    %%for j=0:10000
    %%end
    
%%end


c=c+1;
if (c==6)
    key_gen1();
    continue;
end
end

  fprintf("\n");
  disp(' TRANSFER SUCCESSFUL......');
  tt= toc;
  disp('time taken is');
  disp(tt);
 

  







