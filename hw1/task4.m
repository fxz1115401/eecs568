close all
clear
load data_task4.mat
%%%%%%%%%%% part a %%%%%%%%%%%%%
mean_x = zeros(1,1001);
var_x = 0;
for i = 2:N
    mean_x(i) = mean_x(i-1) + dt * u(i-1);
    var_x = var_x + dt^2 * R_action;
    
end
figure
plot(mean_x,'b')
hold on
plot(x_real,'r')
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
for i = 2:N
    mean_x(i) = mean_x(i-1) + dt * u(i-1);
    var_x = var_x_post(i-1) + dt^2 * R_action;
    K = var_x * (var_x + 10)^(-1);
    mean_x_post(i) = mean_x(i) + K * (z(i-1) - mean_x(i));
    var_x_post(i) = (1 - K) * var_x;
    
    
end
figure
hold on
plot(x_real,'r')
plot(mean_x,'b')
plot(mean_x_post,'g')
