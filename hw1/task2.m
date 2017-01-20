close all
clc
clear

cov1=[1 0;0 2];
mean1 = [0; 0];
for i = 1:3
    z  = plot2dcov( mean1, cov1, i );
end

cov2=[3 -0.4;-0.4 2];
mean2 = [5; 0];
for i = 1:3
    z  = plot2dcov( mean2, cov2, i );
end

cov3=[9 6;6 4];
mean3 = [2; 2];
for i = 1:3
    z  = plot2dcov( mean3, cov3, i );
end