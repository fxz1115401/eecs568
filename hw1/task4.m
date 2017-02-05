close all
clear
load data_task4.mat
%%%%%%%%%%% part a %%%%%%%%%%%%%
mean_x = zeros(1,1001);
var_x = zeros(1,1001);
for i = 2:N
    mean_x(i) = mean_x(i-1) + dt * u(i-1);
    var_x(i) = var_x(i-1) + dt^2 * R_action;
    
end
figure

hold on
ciplot(mean_x-var_x,mean_x+var_x,t,'g')
plot(t,x_real,'r')
%%%%%%%%% part b %%%%%%%%%%%%%
figure
hold on
plot(x_real,'r')
plot(z,'b')

%%%%%%%% part d %%%%%%%%%%%
mean_x = zeros(1,1001);
mean_x_post = zeros (1,1001);
var_x = 0;
var_x_post = zeros (1,1001);
K = zeros(1,1000);
for i = 2:N
    mean_x(i) = mean_x_post(i-1) + dt * u(i-1);
    var_x = var_x_post(i-1) + dt^2 * R_action;
    K(i-1) = var_x * (var_x + 10)^(-1);
    mean_x_post(i) = mean_x(i) + K(i-1) * (z(i-1) - mean_x(i));
    var_x_post(i) = (1 - K(i-1)) * var_x;
    
    
end
figure
plot(K)

figure
hold on
ciplot(mean_x_post-3*var_x_post,mean_x_post+3*var_x_post,t,'b')
ciplot(mean_x_post-var_x_post,mean_x_post+var_x_post,t,'g')
plot(t,x_real,'r')

