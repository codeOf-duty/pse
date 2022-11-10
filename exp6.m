%1MS19EE004
%Aditya Arya
%GS Method
clc
clear all
n=3;
V=[1.05 1 1]; %bus voltages
Y=[20-j*50 -10+j*20 -10+j*30; -10+j*20 26-j*52 -16+j*32; -10+j*30 -16+j*32 26-j*62]  %Y Bus
P=[inf -2.566 -1.386]; 
Q=[inf -1.102 -0.452];
disp('============Output============');
iter=5;
Vprev=V;
for iter=1:5
abs(V);
abs(Vprev);
Vprev=V;
sumyv=[0 0 0 0];
for i=2:n
for k=1:n,
if(i~=k)
sumyv(i)=sumyv(i)+(Y(i,k)*V(k));
end
end
V(i)=(1/Y(i,i))*((P(i)-j*Q(i))/conj(V(i))-sumyv(i))
iter;
end
end
