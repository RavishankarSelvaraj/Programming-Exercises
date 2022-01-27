% Exercise 7.1 
%
% author: Dominik Wirsig (2020067), Ravishankar Selvaraj(2036915)
%
% Pendulum

clear;
%
% a)
%
le = 1; % length l =1.0m
phi0 = 0.5; % initial displacement
g = 9.81; % gravitational acceleration
maxstep = 10000;
tau = 0.025;

x = zeros(maxstep, 1);
y = zeros(maxstep, 1);
t = zeros(maxstep, 1);
x(1) = 0;
y(1) = phi0;

% Euler method
for step=1:maxstep-1
    x(step + 1) = x(step) - tau * (g / le) * sin(y(step));
    y(step + 1) = y(step) + tau * x(step + 1);
    t(step + 1) = t(step) + tau;
    if t(step + 1) > 10 % from t = 0 to t = 10s
        break;
    end
    
end

% plot of phi(t)
figure(1);
plot(t, y);
xlabel('time (seconds)');
ylabel('phi(radians)');
% the period of oscillation is 2 seconds

% phase-space plot
figure(2);
plot(y, x);
xlabel('phi(t)');
ylabel('d(phi(t))/dt');
