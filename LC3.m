clear all,clc,close all;
%внутренние параметры
 
R=220;
R1=R*2
C=33e-12;
tau=R1*C;% постоянная времени цепи
 
%начальные условия
Uc(1)=0;
stdn=3;
 
% Ось времени
T=tau/100;
tmax=(4*tau);
t=0:T:tmax;
N=length(t);
    

%На входе шум%
for k=2:N;
    Uvhw(k)=randn(1,1)*stdn;
    Uvihw(k)=Uvhw(k)/2;
end;
figure(3)
plot(t,Uvhw,t,Uvihw)
xlabel('t')
ylabel('Uvhw,Uvihw')
grid on