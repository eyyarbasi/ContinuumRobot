clear all
clc
close all

d=0.025;
rho=0.32;
s=0.3;
K=10;
i=1;


for mu=1:0.05:10
lambda(i)= sqrt(0.5*(K*mu^2-1/(mu^2))/(2*K+mu^2)+...
    sqrt((0.5*(K*mu^2-1/mu^2)/(2*K+mu^2))^2+(K*mu^(-2)+2)/(2*K+mu^2)));

%p(i)=2*s*d/rho*(1/lambda(i)/mu^2*(lambda(i)^2-1/(lambda(i))^2/mu^2)*(K^2+mu^2));
p(i)=2*s*d/rho*(1/lambda(i)/mu^2*(lambda(i)^2-1/(lambda(i))^2/mu^2)*(K+mu^2));
i=i+1;



end
mu=1:0.05:10;
%plot(mu,lambda)
hold on
grid on
plot(mu,p*6.89^2*2.1, 'LineWidth',2)
xlabel('Hoop Stretch, \mu')
ylabel('Pressure [kPa]')