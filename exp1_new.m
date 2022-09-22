clear all;
close all;

%    p q     z         hlc(adm)
z = [0 1 0.08+0.24j    0.00j
     1 2 0.02+0.06j    0.06j
     2 0 0.08+0.24j    0.00j
     2 3 0.06+0.18j    0.04j
     2 4 0.06+0.18j    0.04j
     3 4 0.01+0.03j    0.02j
     4 0 0.08+0.24j    0.00j
    ];

fb = z(:,1);
tb = z(:,2);
Z = z(:,3);
hlc = z(:,4);
y = 1./Z;

nbus = max(max(fb), max(tb))+1;
Y = zeros(nbus);
nline = length(tb);
for k = 1:nline
    p = fb(k)+1;
    q = tb(k)+1;
    Y(p,p) = Y(p,p)+y(k)+hlc(k);
    Y(q,q) = Y(q,q)+y(k)+hlc(k);
    Y(p,q) = Y(p,q)-y(k);
    Y(q,p) = Y(p,q); 
end
Ybus = Y(2:5, 2:5);