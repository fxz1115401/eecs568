clc
close all
%%% part a %%%
X=(0:0.01:5);
Y=normpdf(X,1,1);
plot(X,Y)
figure

%%% part b %%%
Y1=normcdf(X,1,1);
plot(X,Y1)
figure

%%% part c %%%
z = 0.75;
fun = @ (x) normpdf(x,1,1).*normpdf(z,x,0.2^0.5);
p_z = integral(fun,-Inf,Inf);
p_xgivenz=normpdf(X,1,1).*normpdf(0.75,X,0.2^0.5)/p_z;
subplot(2,1,1)
plot(X,Y)
subplot(2,1,2)
plot(X,p_xgivenz)
figure

%%% part e %%%
[x,z]=meshgrid(0:0.01:5);
mesh(x,z,normpdf(x,1,1).*normpdf(z,x,0.2^0.5))