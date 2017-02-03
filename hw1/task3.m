%%%%%%%%%%%%%% part a %%%%%%%%%%%%%%%%
delta_t = 0.5;
n = 500;
x = [randn(1,n);randn(1,n)];
A = [1+delta_t 0; 0 1];
B = [2 * delta_t; 0];
mean = zeros(2,6);
var = zeros(2,12);
mean(:,1) = [0; 0];
var(:,1:2)=[0.1 0; 0 0.1];

A_sample = chol([0.1 0; 0 0.1], 'lower');
B_sample = [0; 0];
for j = 1:size(x,2)

        x(:,j) = A_sample * x(:,j) + B_sample;
    
end
figure 
hold on
for i = 2:6

    mean(:,i)= A*mean(:,i-1) + B;
    var(:,2*i-1:2*i) = A*var(:,2*i-3:2*i-2)*A';
    for j = 1:size(x,2)

        x(:,j) = A * x(:,j) + B;
    
    end
      
    
    z  = plot2dcov( mean(:,i), var(:,2*i-1:2*i), 1);
    scatter(x(1,:),x(2,:))

    
end

%%%%%%%%%%%%%% part c %%%%%%%%%%%%%%%%

u = [3 0 3 0 3; 0 3 0 -3 0];
A = [1 0; 0 1];
B = [0.5 0; 0 0.5];
R = [0.1 0; 0 0.1];

E_X = zeros(2,6);
E_X(:,1) = [0;0];
sigma_X = zeros(2,12);
sigma_X(:,1:2) = [0.1 0; 0 0.1];
figure
hold on
for i = 1:5

    E_X(:,i+1) = A * E_X(:,i) + B * u(:,i);
    sigma_X(:,2*i+1:2*i+2) = A * sigma_X(:,2*i-1:2*i) * A' +R;
    z  = plot2dcov( E_X(:,i), sigma_X(:,2*i-1:2*i), 1);

end
z  = plot2dcov( E_X(:,6), sigma_X(:,2*6-1:2*6), 1);


%%%%%%%%%%%% part D %%%%%%%%%%%%%%%%%

u = [3;2];
R = [0.2 0 0; 0 0.2 0; 0 0 0.1];
E_X = zeros(3,6);
E_X(:,1) = [0;0;0];
sigma_X = zeros(3,18);
sigma_X(:,1:3) = [0.1 0 0; 0 0.1 0;0 0 0.5];
for i = 1:5

    E_X(:,i+1) = [E_X(1,i) + cos(E_X(3,i)) * delta_t * u(1); E_X(2,i) + sin(E_X(3,i)) * delta_t * u(1);E_X(3,i) + delta_t *u(2)];
    G = [1 0 -sin(E_X(3,i)) * delta_t * u(1); 0 1 cos(E_X(3,i)) * delta_t * u(1); 0 0 1];
    sigma_X(:,3*i+1:3*i+3) = G * sigma_X(:,3*i-2:3*i) * G' +R;
    
    %z  = plot2dcov( E_X(:,i), sigma_X(:,3*i-2:3*i), 1);

end

%%%%%%%%%%%%% part e %%%%%%%%%%%%%%%%%

u = [3;2];
R = [2 0;0 0.1];
E_X = zeros(3,6);
E_X(:,1) = [0;0;0];
sigma_X = zeros(3,18);
sigma_X(:,1:3) = [0.1 0 0; 0 0.1 0;0 0 0.5];
figure
hold on
for i = 1:5

    E_X(:,i+1) = [E_X(1,i) + cos(E_X(3,i)) * delta_t * u(1); E_X(2,i) + sin(E_X(3,i)) * delta_t * u(1);E_X(3,i) + delta_t *u(2)];
    G = [1 0 -sin(E_X(3,i)) * delta_t * u(1); 0 1 cos(E_X(3,i)) * delta_t * u(1); 0 0 1];
    V = [cos(E_X(3,i)) * delta_t 0; sin(E_X(3,i)) * delta_t 0; 0 delta_t];
    sigma_X(:,3*i+1:3*i+3) = G * sigma_X(:,3*i-2:3*i) * G' +V * R * V';
    z  = plot2dcov( E_X(1:2,i), sigma_X(1:2,3*i-2:3*i-1), 1);

end