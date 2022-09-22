
clear all;
close all;
%     p q     z      hlc(adm)
z =  [1 2 0.02+0.06i 0.6i
      2 3 0.06+0.18i 0.04i
      2 4 0.06+0.18i 0.04i
      3 4 0.01+0.03i 0.02i
      ];
fb =z(:,1);
tb =z(:,2);
Z  =z(:,3);
hlc=z(:,4);
y  =1./Z;

nbus = max(max(fb),max(tb));
Y = zeros(nbus);
nline= length(tb);
G=1.25-3.75i;
for k=1:nline
    p=fb(k);
    q=tb(k);
    Y(p,p)=Y(p,p)+y(k)+hlc(k)+G;
    Y(q,q)=Y(q,q)+y(k)+hlc(k)+G;
    Y(p,q)=Y(p,q)-y(k);
    Y(q,p)=Y(p,q);
end
Y(3,3)-G;
Ybus=Y
