%ADITYA
%1MS19EE004
%Batch 2
%23/11/2022
%Economic Load Dispatch
clc;
alpha=[400; 600; 650];
beta=[8.4; 8.93; 6.87];
gamma=[0.006; 0.0042; 0.004];
PD=820;
delp=1;
lamada=10.5;
fprintf(' ')
disp(['Lamada p1 p2 p3 Dp' .....
    'grad Delamada'])
iter=0;
while abs(delp)>=0.001
   iter=iter+1;
    p=(lamada-beta)./(2*gamma);
    delp=PD-sum(p);
    j= sum(ones(length(gamma),1)./(2*gamma));
    Delamada=delp/j;
    disp([lamada,p(1),p(2),p(3),delp,j,Delamada])
    lamada=lamada+Delamada;
end
totalcost=sum(alpha+beta.*p+gamma.*p.^2)
