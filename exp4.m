clc;
clear all;

P=48;
pf= 0.8;
Vt= 34.64;
Xd= 13.5;
Xq= 9.33;

Vtph=Vt*1000/sqrt(3); % Per phase Voltage

pf_a=acos(pf); 
Q=P*tan(pf_a);

I=(P-j*Q)*1000000/(3*Vtph);% Current in Amps

delta=0:1:180;

delta_rad = delta*(pi/180);

%Salient Pole Synchronous Motor
if Xd ~= Xq 
    Eq=Vtph+(j*I*Xq);
    Id_mag=abs()*sin(angle(Eq)-angle());
    Ef_mag=abs(Eq)+((Xd-Xq)*Id_mag); 
    Exitation_emf = Ef_mag
    Reg = (Ef_mag-abs(Vtph))*100/abs(Vtph)
    PP=Ef_mag*Vtph*sin(delta_rad)/Xd; 
    Reluct_Power=Vtph^2*(Xd-Xq)*sin(2*delta_rad)/(2*X*Xq);
    Net_Reluct_Power=3*Reluct_Power/1000000;
    Power_sal=PP + Reluct_Power;
    Net_Power_sal=3*Power_sal/1000000;
    plot(delta, Net_Reluct_Power, 'K');
    hold on 
    plot(delta, Net_Power_sal,'r');
    xlabel('Delta(deg)');
    ylabel('Three Phase Power(pu)--->'); 
    title('Plot:Power Angle Curve for Salient Synchronous M/c');
    legend('Reluct Power', 'Salient Power');
end
if Xd==Xq %Non-Salient Pole Synchronous Motor 
    Ef=Vtph+(j*I*Xd);
    Exitation_emf=abs(Ef);
    Reg =(abs(E)-abs(Vtph))*100/abs(Vtph) 
    Power_non = abs(Ef)*Vtph*sin(delta_rad)/Xd;
    Net_Power = 3*Power_non/1000000; plot(delta, Net_Power);
    xlabel('Delta(deg)--->');
    ylabel('Three Phase Power(MW)--->'); 
    title('Plot:Power Angle Curve for Non-Salient Synchronous M/c');
    legend Non-Salient Power");
end
grid;
