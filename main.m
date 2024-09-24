clear;
clc;

disp('Welcome AUSSP ASTRA-ETHEREA ADCS Control Simulation');

%%%Get Planet Parameters
earth;

%%%Initial Conditions
altitude = 500000; %meters
x0 = r + altitude;
y0 = 0;
z0 = 0;
xdot0 = 0;
inclination = 9 * pi / 180; 
semi_major = norm([x0;y0;z0]);
vcircular = sqrt(mu/semi_major);
ydot0 = vcircular*sin(inclination);
zdot0 = vcircular*cos(inclination);
stateinitial = [x0;y0;z0;xdot0;ydot0;zdot0];

%%%Time Window
period = 2*pi/sqrt(mu)*semi_major^(3/2);
number_of_orbits = 1;
tspan = [0 period*number_of_orbits];


%%%Integrate the Equations of motion using ode45
[tout,stateout] = ode45(@satellite,tspan,stateinitial);

%%%Convert Stateout to Kilometers
stateout_km = stateout / 1000;

%%%Extract State Vector
xout = stateout_km(:,1);
yout = stateout_km(:,2);
zout = stateout_km(:,3);

%%%

%%%Make an Earth
[X,Y,Z] = sphere(100);
X = X * r / 1000;
Y = Y * r / 1000;
Z = Z * r / 1000;

%%%Plot 3D orbit
figure;
hold on;
fig = figure(1);
set(fig,'color','white');
plot3(xout,yout,zout,'b-','LineWidth',4)
grid on
surf(X,Y,Z,'EdgeColor','none')
axis equal
