% Phong Thanh Trinh
m1 = 1; 
m2 = 2; 
S1 = [1,0]; 
S2 = [-1,0];

options = odeset('RelTol',1e-9,'AbsTol',1e-10);

u0 = [0,5,2,0];
tspan = [0 10];
[T,U] = ode45(@(t,u) odefun(t,u,m1,S1,m2,S2),tspan,u0,options);
plot(U(:,1),U(:,3))
grid on;
hold on;
xlim([-2.5,2.5]);
ylim([-2,2]);
plot(S1(1),S1(2),'r*','MarkerSize',m1*13.5);
plot(S2(1),S2(2),'r*','MarkerSize',m2*13.5);
hold off;

function dudt = odefun(t,u,m1,S1,m2,S2)
dudt = zeros(4,1);
dudt(1) = u(2);
dudt(2) = ((4*pi^2)*m1*(S1(1)-u(1)))/(((S1(1)- u(1))^2 + (S1(2)- u(3))^2)^(3/2)) + ((4*pi^2)*m2*(S2(1)- u(1)))/(((S2(1)-u(1))^2 + (S2(2)-u(3))^2)^(3/2));
dudt(3) = u(4);
dudt(4) = ((4*pi^2)*m1*(S1(2)-u(3)))/(((S1(1)- u(1))^2 + (S1(2)- u(3))^2)^(3/2)) + ((4*pi^2)*m2*(S2(2)- u(3)))/(((S2(1)-u(1))^2 + (S2(2)-u(3))^2)^(3/2)); 
end
