%Aditya Arya
%1MS19EE004
clc;
clear all;
L = input('Enter length of transmission line in Km');
R = input('Enter the value of resistance per unit length');
X = input('Enter the value of reactance per unit length');
Z1 = complex(R,X)
G = input('Enter the value of admittance per unit length');
Y1 = complex(0,G);
Z = L*Z1;
Y=L*Y1;
if L<80
    A=1
    B=Z
    C=0
    D=1
    
else if L>240
        Zc = sqrt(Z1/Y1);
        gamma = sqrt(Z1*Y1);
        A = cosh(gamma*L)
        B = Zc*sinh(gamma*L)
        C=(1/Zc)*sinh(gamma*L)
        D=A
    else
        model = input('Which model do you want to implement 1. T model 2. Pi model')
        if(model ==1 )
            A= 1 + Y*Z/2
            B = Z*(1 + Y*Z/4);
            C=Y
            D=A
        else
            A = 1+(Y*Z)/2
            B=Z
            C = Y*(1 + Y*Z/4);
            D=A
        end
    end
end


 Vr1 = input('Enter the value of receiving end line voltage');
 p = input('Enter the receiving end power');
 pf = input('Enter the receiving end power factor');
 Vr = Vr1/1.732;
 x = sqrt(1-pf*pf);
 magIr = p/(1.732*Vr1*pf)
 Ir = complex(magIr*pf,-magIr*x);
 Vs = (A*Vr)+(B*Ir);
 Is = (C*Vr) + (D*Ir);
 % Volatage regulation
 
 Vr0 = abs(Vs/A)
 regulation = ((Vr0-Vr)/Vr)*100
 %efficiency
 input= real(3*Vs*conj(Is));
 output=real(3*Vr*conj(Ir));
 efficiency = (output/input)*100
        
