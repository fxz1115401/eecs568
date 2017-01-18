X=(0:0.01:5);
Y=normpdf(X,1,1);
plot(X,Y)
figure
Y1=normcdf(X,1,1);
plot(X,Y1)