clear all,clc,close all;
%внутренние параметры
 
R=220;
R1=R*2
C=33e-12;
tau=R1*C;% постоянная времени цепи
 
%начальные условия
Uc(1)=0;
 
% Ось времени
T=tau/100;
tmax=(4*tau);
t=0:T:tmax;
N=length(t);

%Ось частоты
w=2*pi*(0:0.1/(tau):10/(tau)); 
M=length(w);
for m=1:M; 
    
    for k=1:N*2
        Uvh=cos(k*w(m)*T);
        Uc=(Uvh*T+Uc*R1*C)/(C*R1+2*T);
        Ur=Uvh-2*Uc;
        Ucmas(k)=Uc;
    end
    
    U_save(m) = max(Ucmas(k-400:k));
    
end;
    
figure(2)
plot(w/(2*pi),U_save)