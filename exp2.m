%Aditya Arya
%1MS19EE004
%Batch 2
clc;
clear;
%      Element  From   To    Z
data=[  1        1     0    0.52
        2        2     1    0.32
        3        3     1    0.43
        4        2     0    0.25
        5        2     3    0.21];

    element=data(:,1);
    nbr=length(data(:,1));
    from=data(:,2);
    to=data(:,3);
    zb=data(:,4);
    n=max(max(from),max(to));
    zbus=zeros(n,n);

    for i=1:nbr
        %Modification-1

        if(element(i)==1)
            zbus=zb(i)
            continue
        end

        %Modification-2

        if(from(i)~=0 && to(i)~=0)
            if(from(i)>to(i))
                k=to(i);
                new=from(i);
                for j=1:2
                    zbus(j,new)=zbus(j,k);
                    zbus(new,j)=zbus(k,j);
                end
                zbus(new,new)=zbus(k,k)+zb(i)
                continue
            end
        end
        %Modification-3

        if(to(i)==0)
            old=from(i);
            m1=zbus(old,old)+zb(i);
            ztemp=(1/m1)*zbus(:,old)*zbus(old,:);
            zbus=zbus-ztemp
            continue
        end
        %Modification-4

        if(from(i)~=0 && to(i)~=0)
            a=from(i);
            b=to(i);
            m2=zb(i)+zbus(a,a)+zbus(b,b)-(2*zbus(a,b));
            ztemp=(1/m2)*((zbus(:,a)-(zbus(:,b)))*((zbus(a,:))-(zbus(b,:))));
            zbus=zbus-ztemp
            continue
        end
    end
    fprintf('z-bus\n');
    disp(zbus);
