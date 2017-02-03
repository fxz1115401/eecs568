delta_t = 0.5;
A = [1+delta_t 0; 0 1];
B = [2 * delta_t; 0];
mean = zeros(2,6);
var = zeros(2,12);
mean(:,1) = [0; 0];
var(:,1:2)=[0.1 0; 0 0.1];
for i = 2:6

    mean(:,i)= A*mean(:,i-1) + B;
    var(:,2*i-1:2*i) = A*var(:,2*i-3:2*i-2)*A';
    figure
    z  = plot2dcov( mean(:,i), var(:,2*i-1:2*i), 1);
    
end


