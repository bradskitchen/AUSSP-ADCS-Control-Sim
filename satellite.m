function dstatedt = satellite(t,state)
%%%stateinitial = [x0;y0;z0;xdot0;ydot0;zdot0];

x = state(1);
y = state(2);
z = state(3);
xdot = state(4);
ydot = state(5);
zdot = state(6);

%%%Inertia & Mass
ms = 5; %%kilograms

%%%Kinematics
vel = state(4:6);

%%%Gravity Model
earth
r = state(1:3); %%r = [x;y;z]
rnorm = norm(r);
rhat = r/rnorm;
Fgrav = -(G*me*ms/rnorm^2)*rhat;

%%%Dynamics
F = Fgrav;
accel = F/ms;


%%%Return dervitives vector
dstatedt = [vel;accel];
