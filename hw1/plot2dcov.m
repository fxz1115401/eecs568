function  z  = plot2dcov( mean, cov, k )

A = chol(cov, 'lower');

b = mean;

i = 0;
for theta = 0:pi/100:2*pi
    i = i+1;
    x(i) = k * cos(theta);
    y(i) = k * sin(theta);
end
z = zeros(2,size(x,2));
for j = 1:size(x,2)

    z(:,j) = A * [x(j); y(j)] + b;
    
end

figure
plot(z(1,:),z(2,:))
axis equal


end

