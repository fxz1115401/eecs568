close all
clc
clear

cov1=[1 0;0 2];
mean1 = [0; 0];
for i = 1:3
    
    figure
    z  = plot2dcov( mean1, cov1, i );
    axis equal

end

cov2=[3 -0.4;-0.4 2];
mean2 = [5; 0];
for i = 1:3
    
    figure
    z  = plot2dcov( mean2, cov2, i );
    axis equal

end
%%%%%
% cov3=[9 6;6 4];
% mean3 = [2; 2];
% for i = 1:3 
%     z  = plot2dcov( mean3, cov3, i );
% end
%%%%%%

%%% part C %%%
n = 10000;
x = [randn(1,n);randn(1,n)];
b = [2;2];
A = chol([1 1.3; 1.3 3], 'lower');
for j = 1:size(x,2)

    y(:,j) = A * x(:,j) + b;
    
end
figure
scatter(y(1,:),y(2,:))
axis equal
hold on
z  = plot2dcov( [2;2], [1 1.3; 1.3 3], 1 );
mean_y = 1/n*sum(y,2);
sum_yyt = zeros(2);
sum_y = zeros(2,1);
sum_yt = zeros(1,2);
for i = 1:n

    sum_yyt = sum_yyt + y(:,i) * y(:,i)';
    sum_y = sum_y + y(:,i);
    sum_yt=sum_yt +y(:,i)';

end
cov_y = 1/n * sum_yyt -(1/n * sum_y) * (1/n * sum_yt);
hold on
z  = plot2dcov( mean_y, cov_y, 1 );