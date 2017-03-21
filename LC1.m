clear all,clc,close all;


%внутренние параметры 
R=220
R1=R*2;
C=33e-12;
tau=R*C;% постоянная времени цепи
 
%внешние параметры
U=5;

%начальные условия
Uc(1)=0;
 
% Ось времени
T=tau/100;
tmax=(4*tau);
t=0:T:tmax;
N=length(t);

 
for k=1:N;
    Uc=(U*T+Uc*R*C)/(C*R+2*T); %напряжение на конденсаторе
    Ur=U-2*Uc; %напряжение на резисторе
    Ucmas(k)=Uc;
end;
figure(1)
plot(t,Ucmas)